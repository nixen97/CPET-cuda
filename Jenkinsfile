pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                sh 'cd ext'
                sh 'make'
            }
        }
        stage('test') {
            steps {
                sh 'cd ext'
                sh 'bash test.sh'
            }
        }
    }
}
