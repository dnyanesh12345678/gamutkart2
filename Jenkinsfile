pipeline{
agent any
environment {
  DOCKERHUB_CREDENTIALS = credentials('dockerhub')
}
stages{
stage("git-clone"){
steps{
checkout([$class: 'GitSCM', branches: [[name: '*/master']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/dnyanesh12345678/gamutkart2.git']]])
}
}
stage("compliation"){
steps{
sh "mvn install"
}
}
stage("connect to dockerhub"){
steps{
sh "echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u DOCKERHUB_CREDENTIALS_USR --password-stdin"
}
}
stage("create image"){
steps{
sh "docker build -t 9dnyanesh/gamutkart-image ."
}
}
stage("push image to dockerhub"){
steps{
sh "docker push 9dnyanesh/gamutkart-image"
}
}
stage("create environment"){
steps{
sh "./create-env.sh 5"
}
}
}
}
