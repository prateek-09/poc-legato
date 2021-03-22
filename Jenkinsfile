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
          sh 'docker build -t prateekjourney/legatopoc:firstpush .'
      }
    }

    stage('push stage') {
      steps {
          echo 'Running docker container'
          sh 'docker login --username=prateekjourney --password=Prateek@123'
          sh 'docker push prateekjourney/legatopoc:firstpush'
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