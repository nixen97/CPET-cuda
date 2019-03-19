pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                sh 'cd ext & make'
            }
        }
        stage('test') {
            steps {
                sh 'cd ext & bash test.sh'
            }
        }
    }
}
