pipeline {
  agent any
  stages {
    stage('check directory') {
      parallel {
        stage('check directory') {
          steps {
            sh 'ls'
          }
        }

        stage('compile') {
          steps {
            sh 'mvn install'
          }
        }

      }
    }

  }
}