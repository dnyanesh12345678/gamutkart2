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

    stage('deploy to tomcat server') {
      steps {
        sh 'rsync -avh ./target/gamutgurus.war root@172.17.0.2:/root/apache-tomcat-9.0.62/webapps'
      }
    }

  }
}