pipeline {
    agent any
    
    stages {
        stage('Build') {
            steps {
                git 'https://github.com/Aleksandar1010/KIII-Jenkins-BlueOcean.git'
                
                sh 'mvn clean package'
            }
        }
        stage('Test') {
            steps {
                sh 'mvn test'
            }
        }
        stage('Deploy') {
            steps {
                sh 'kubectl apply -f deployment.yaml'
            }
        }
    }
    
    post {
        success {
	    echo 'Pipeline executed successfully!'
        }
        failure {
            echo 'Pipeline execution failed!'
        }
    }
}
