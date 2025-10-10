    pipeline {
        agent {label 'slave_one'}

        stages {
            stage('Checkout') {
                steps {  git  'https://github.com/Ganavi-AG/maven-project.git'
                      }
               }

            stage('Maven Build (inside Docker)') {
                agent {
                     docker {  image 'maven:3.8.7'  args '-v $HOME/.m2:/root/.m2' 
                    }
                }
                  steps {
                      sh 'mvn clean package -DskipTests' // Perform Maven compilation and packaging
                }
            }

            stage('Build Docker Image') {
                steps {
                    sh 'docker build -t ganaviag/jenkins .'
                    }
                }
            }      
        }
    
