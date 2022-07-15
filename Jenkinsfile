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

    stage('check project build or not') {
      steps {
        sh 'find . -name *.war'
      }
    }

  }
}