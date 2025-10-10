   pipeline {
    agent any

      environment {
         IMAGE_NAME = "myimage"
         MAVEN_IMAGE = "maven : 3.8.6-eclipse-temurin-17"
      }
        
           stages {
                stage('Checkout') {
                      steps {
                           git url : 'https://github.com/Ganavi-AG/maven-project.git' , branch:'main'
                 }
           }

        stage('Build with Maven') {
           agent{
              docker{
                 image "${MAVEN_IMAGE}"
                 args '-v /root/.m2:/root/.m2'
              }
           }
            steps {
                sh 'mvn clean install -DskipTests'
            }
        }

        stage('Build Docker Image') {
            steps {
               
                  sh "docker images | grep $IMAGE_NAME"
                }
            }
        }
      post{
         always {
            echo "pipeline finished"
           }
         }
     }
   
