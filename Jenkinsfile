pipeline{
    agent any 
    stages{
stage("checkout"){
steps{
sh "cd .."
sh "rm -rf gamutkart2"
sh "git clone https://github.com/dnyanesh12345678/gamutkart2.git"
}
}
stage("create package"){
steps{
sh "mvn clean package"
}
}
        stage("connect to jfrog"){
            steps{
                rtServer (
    id: 'jfrog',
    url: 'http://172.17.0.1:8081/artifactory',
    // If you're using username and password:
    username: 'admin',
    password: 'password',
    // If you're using Credentials ID:
    
    // If Jenkins is configured to use an http proxy, you can bypass the proxy when using this Artifactory server:
    bypassProxy: true,
    // Configure the connection timeout (in seconds).
    // The default value (if not configured) is 300 seconds:
    timeout: 300
)
            }
        }
        stage("upload files"){
            steps{
               rtUpload (
    serverId: 'jfrog',
    spec: '''{
          "files": [
            {
              "pattern": "/home/zx/.jenkins/workspace/gamutkart-ansible-jfrog automation/target/gamutgurus.war",
              "target": "gamutkart-project"
            }
         ]
    }''',
 

) 
            }
        }
    stage("execute ansible file"){
steps{
sh "ansible-playbook -i hosts deployment.yaml"
}
}
}
}
