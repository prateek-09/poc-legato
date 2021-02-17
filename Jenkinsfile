pipeline {
  agent any
  stages {
    stage('pull') {
      steps {
          echo 'started'
      }
    }
    stage('build') {
      steps {
          echo 'Building docker image'
          sh 'docker build -t testing .'
      }
    }

    stage('Run stage') {
      steps {
          echo 'Running docker container'
          sh 'docker run -d -p 8888:80 testing'
      }
    }

    stage('migrations') {
      steps{
          echo 'Running Migrations'
      }
    }
    stage('test') {
      steps {
          echo 'Running Tests'
      }
    }
    stage('deploy') {
      steps {
          echo 'Running Deployment'

      }
    }
    stage('retagging') {
      steps {
          echo 'Retagging IMages'
      }
    }
  }
  post {
    always {
      echo 'This always runs'
    }
  }
}