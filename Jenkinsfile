   pipeline {
    agent {
        docker {
            image 'maven:3.8.6-openjdk-17'
            args '-v /root/.m2:/root/.m2' // optional: cache Maven dependencies
        }
    }

           stages {
        stage('Checkout') {
            steps {
                git  'https://github.com/Ganavi-AG/maven-project.git'
            }
        }

        stage('Build with Maven') {
            steps {
                sh 'mvn clean install'
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
