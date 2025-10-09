    pipeline {
        agent {label 'slave_one'}

        stages {
            stage('Checkout') {
                steps {
                    git
                    'https://github.com/Ganavi-AG/maven-project.git'
                }
            }

            stage('Maven Build (inside Docker)') {
                agent {
                    docker {
                        image 'maven:3.8.7-openjdk-17-slim' 
                        args '-v $HOME/.m2:/root/.m2' 
                    }
                }
                steps {
                    sh 'mvn clean package -DskipTests' // Perform Maven compilation and packaging
                }
            }

            stage('Build Docker Image') {
                steps {
                    script {
                        docker.build("your-docker-image-name:${env.BUILD_NUMBER}") // Build the Docker image
                    }
                }
            }

            stage('Push Docker Image (Optional)') {
                steps {
                    script {
                        // Assuming Docker Hub credentials are configured in Jenkins
                        // docker.withRegistry('https://index.docker.io/v1/', 'docker-hub-credentials-id') {
                        //     docker.image("your-docker-image-name:${env.BUILD_NUMBER}").push()
                        // }
                    }
                }
            }
        }
    }
