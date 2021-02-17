pipeline {
  agent any
  stages {
    stage('pull') {
      steps {
          echo 'started'
          // git(url: 'git@github.com:bravuri/mintzip-gateway.git', branch: 'master')
      }
    }
    stage('build') {
      steps {
          echo 'Building stage'

        sh 'docker build -t testing .'
        // sh 'docker run -t -d  -p 80:80 --name gateway-container -v $(pwd):/code -e APP_ENV=build -e SECRET_KEY=123 -e DEBUG=True -e ALLOWED_HOSTS=* -e DB_DEFAULT_HOST=test-db.cewtrekk8rc3.ap-south-1.rds.amazonaws.com -e DB_DEFAULT_PORT=3306 -e DB_DEFAULT_USER=root -e DB_DEFAULT_PASS=testingpassword -e CACHE_LOCATION=redis://13.127.59.34:6379 -e AWS_STORAGE_BUCKET_NAME=mintzip-gateway-staging -e EMAIL_HOST_USER=mintzip.errorreport@gmail.com -e EMAIL_HOST_PASSWORD=piz1$M1nT@9 -e EMAIL_HOST=email-smtp.eu-west-1.amazonaws.com gateway'
      }
    }
    stage('migrations') {
      steps{
          echo 'Running Migrations'
        // sh "docker exec -t gateway-container bash -c 'python3 manage.py migrate'"
        // sh "docker exec -t gateway-container bash -c 'python3 manage.py createcachetable'"
      }
    }
    stage('test') {
      steps {
          echo 'Running Tests'
        // sh "docker exec -t gateway-container bash -c 'python3 manage.py test --keepdb'"
      }
    }
    stage('deploy') {
      steps {
          echo 'Running Deployment'

        // sh '( ~/.local/bin/aws ecr get-login --no-include-email --region ap-south-1) | /bin/bash'
        // sh 'docker tag gateway:latest 831931756231.dkr.ecr.ap-south-1.amazonaws.com/gateway:latest'
        // sh 'docker push 831931756231.dkr.ecr.ap-south-1.amazonaws.com/gateway:latest'
      }
    }
    stage('retagging') {
      steps {
          echo 'Retagging IMages'
        // sh '''
        // DIGEST=$(~/.local/bin/aws ecr describe-images --repository-name gateway --query "sort_by(imageDetails,& imagePushedAt)[-2].imageDigest")
        // echo $DIGEST
        // MANIFEST=$(~/.local/bin/aws ecr batch-get-image --repository-name gateway  --image-ids imageDigest=$DIGEST --query images[].imageManifest --output text)
        // ~/.local/bin/aws ecr put-image --repository-name gateway --image-tag stable --image-manifest "$MANIFEST"
        // OLD_DIGEST=$(~/.local/bin/aws ecr describe-images --repository-name gateway --query "sort_by(imageDetails,& imagePushedAt)[-3].imageDigest")
        // OLD_MANIFEST=$(~/.local/bin/aws ecr batch-get-image --repository-name gateway  --image-ids imageDigest=$OLD_DIGEST --query images[].imageManifest --output text)
        // ~/.local/bin/aws ecr put-image --repository-name gateway --image-tag stable-v1 --image-manifest "$OLD_MANIFEST"
        // '''
        // sendSlackNotif('#59f442', message: "Retagging successfull")
      }
    }
  }
  post {
    always {
      echo 'This always runs'
    }
  }
}