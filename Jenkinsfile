pipeline {
    agent any
    triggers { 
        pollSCM('*/1 * * * *') 
    }
    stages {
        stage('build-docker-image') {
            steps {
                build_docker_image()
            }
        }
        stage('deploy-to-dev') {
            steps {
                deploy_to_environment("dev")
            }
        }
        stage('tests-on-dev') {
            steps {
                execute_api_tests("dev")
            }
        }
        stage('deploy-to-stg') {
            steps {
                deploy_to_environment("stg")
            }
        }
        stage('tests-on-stg') {
            steps {
                execute_api_tests("stg")
            }
        }
        stage('deploy-to-prod') {
            steps {
                deploy_to_environment("prod")
            }
        }
        stage('tests-on-prod') {
            steps {
                execute_api_tests("prod")
            }
        }
    }
}

def build_docker_image(){
    echo "Building docker image.."
    sh "docker build --no-cache -t kristelj/python-greetings-app:latest ."

    echo "Pushing docker image to registry.."
    sh "docker push kristelj/python-greetings-app:latest"
}

def deploy_to_environment(String environment){
    echo "Starting deployment for ${environment} environment"
    echo "Pulling latest image from registry..."
    sh "docker pull kristelj/python-greetings-app:latest"

    echo "Stopping & removing previous docker service..."
    sh "docker-compose-v1 stop greetings-app-${environment}"
    sh "docker-compose-v1 rm greetings-app-${environment}"

    echo "Starting new docker service..."
    sh "docker-compose-v1 up greetings-app-${environment}"
}

def execute_api_tests(String environment){
    echo "tests"
}