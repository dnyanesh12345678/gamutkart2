pipeline {
    agent any
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
stage("deploy to QA-server"){
    steps{
        sh "scp target/gamutgurus.war root@172.17.0.3:/root/apache-tomcat-9.0.62/webapps"
        
    }
}
stage("deploy to production sever"){
        steps{
              sh "scp target/gamutgurus.war root@172.17.0.2:/root/apache-tomcat-9.0.62/webapps"
        }
    }
		
    }
}
