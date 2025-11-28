pipeline {
    agent any

    environment {
        DOCKERHUB_USER = "biyadavis"
        IMAGE_NAME     = "biya-python-app"
    }

    stages {

        stage('Biya - Build Docker Image') {
            steps {
                sh '''
                  docker build -t $DOCKERHUB_USER/$IMAGE_NAME:latest .
                '''
            }
        }

        stage('Biya - Login to Dockerhub') {
            steps {
                withCredentials([string(credentialsId: 'dockerhub-pass', variable: 'DOCKERHUB_PASS')]) {
                    sh '''
                      echo $DOCKERHUB_PASS | docker login -u $DOCKERHUB_USER --password-stdin
                    '''
                }
            }
        }

        stage('Biya - Push Image to Dockerhub') {
            steps {
                sh '''
                  docker push $DOCKERHUB_USER/$IMAGE_NAME:latest
                '''
            }
        }
    }
}
