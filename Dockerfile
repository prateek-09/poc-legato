FROM ubuntu:20.04

RUN apt-get -y update \
	&& apt-get -y install nginx \
	&& apt-get -y install python3-pip \
	&& pip3 install gunicorn \
	&& apt-get install supervisor \
	&& mkdir /code


WORKDIR /code

COPY . .
COPY requirements.txt .

RUN /bin/bash -c "pip3 install -r requirements.txt" 


RUN rm /etc/nginx/sites-enabled/default
COPY testconfig /etc/nginx/sites-available/testconfig
COPY testblog_supervisor.conf /etc/supervisor/conf.d/testblog_supervisor.conf

# RUN /bin/bash -c "ln -s /etc/nginx/sites-available/testconfig /etc/nginx/sites-enabled/testconfig"
RUN ln -s /etc/nginx/sites-available/testconfig /etc/nginx/sites-enabled

EXPOSE 80

CMD ["/code/cmd.sh"]

# CMD ["nginx", "-g", "daemon off;"]





