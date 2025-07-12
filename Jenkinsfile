pipeline {
    agent any

    environment {
        IMAGE_NAME = 'cafe'
        CONTAINER_NAME = 'cafe-container'
    }

    stages {


        stage('Build Docker Image') {
            steps {
                script {
                    docker.build("${IMAGE_NAME}")
                }
            }
        }

        stage('Stop & Remove Old Container') {
            steps {
                script {
                    sh "docker stop ${CONTAINER_NAME} || true"
                    sh "docker rm ${CONTAINER_NAME} || true"
                }
            }
        }

        stage('Run New Container') {
            steps {
                script {
                    sh "docker run -d -p 8080:80 --name ${CONTAINER_NAME} ${IMAGE_NAME}"
                }
            }
        }
    }

    post {
        success {
            echo "✅ Cafe website deployed at http://localhost:8080"
        }
        failure {
            echo "❌ Build failed"
        }
    }
}
