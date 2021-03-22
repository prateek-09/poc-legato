from flask import Flask
app = Flask(__name__)

@app.route('/')
def hello_world():
    return 'Hello, This is flask app updated by 5 mins watchtower with the help of jenkins'
