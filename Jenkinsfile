pipeline {
    agent any
environment {
  dnyaneshwar = credentials("india")
}

    stages {
		stage('Clone-Repo') {
			steps {
				checkout scm
			}
		}
	
		stage('Build') {
			steps {
				sh 'mvn install -Dmaven.test.skip=true'
			}
		}
		
		stage('Unit Tests') {
			steps {
				sh 'mvn compiler:testCompile'
				sh 'mvn surefire:test'
				junit 'target/**/*.xml'
			}
		}
stage("login to docker hub"){
    steps{
        sh "echo $dnyaneshwar_PSW |  docker login -u $dnyaneshwar_USR --password-stdin"
        
    }
}
stage("build"){
        steps{
            sh " docker build -t 9dnyanesh/gamutkart-image:latest ."
            sh " docker push 9dnyanesh/gamutkart-image:latest"
        }
    }
stage("create container"){
    steps{
        sh "chmod 777 -R create-env.sh"
        sh "./create-env.sh 5"
    }
}
	
		
    }
}
