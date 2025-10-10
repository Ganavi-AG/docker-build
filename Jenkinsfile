   pipeline {
    agent {
        docker {
           image 'maven:3.8.6-eclipse-temurin-17'
           args '-v /root/.m2:/root/.m2'
        }
    }

           stages {
                stage('Checkout') {
                      steps {
                           git url : 'https://github.com/Ganavi-AG/maven-project.git' , branch:'main'
                 }
           }

        stage('Build with Maven') {
            steps {
                sh 'mvn clean install -DskipTests -B'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    sh "docker build -t my_image ."
                }
            }
        }
     }
   }
