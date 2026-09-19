pipeline {

    agent any

    environment {
        DOCKER_IMAGE = "muthusuresh5/devops-app"
    }

    options {
        timestamps()
        disableConcurrentBuilds()
    }

    stages {

        stage('Checkout') {
            steps {
                echo 'Checking out application source code...'

                checkout scm
            }
        }


        stage('Install Dependencies') {
            steps {
                echo 'Installing application dependencies...'

                sh '''
                    cd app
                    npm install
                '''
            }
        }



        stage('Docker Build') {
            steps {
                echo 'Building Docker image...'

                sh '''
                    docker build \
                    -t ${DOCKER_IMAGE}:${BUILD_NUMBER} \
                    -t ${DOCKER_IMAGE}:latest \
                    .
                '''
            }
        }


        stage('Docker Push') {
            steps {

                echo 'Pushing Docker image to Docker Hub...'

                withCredentials([
                    usernamePassword(
                        credentialsId: 'dockerhub-credentials',
                        usernameVariable: 'DOCKER_USERNAME',
                        passwordVariable: 'DOCKER_PASSWORD'
                    )
                ]) {

                    sh '''
                        echo "$DOCKER_PASSWORD" | \
                        docker login \
                        -u "$DOCKER_USERNAME" \
                        --password-stdin

                        docker push ${DOCKER_IMAGE}:${BUILD_NUMBER}

                        docker push ${DOCKER_IMAGE}:latest

                        docker logout
                    '''
                }
            }
        }
    }


    post {

        success {
            echo '''
            ========================================
            CI PIPELINE SUCCESS
            ========================================
            Docker image successfully pushed.
            '''
        }

        failure {
            echo '''
            ========================================
            CI PIPELINE FAILED
            ========================================
            '''
        }
    }
}
