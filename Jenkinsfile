pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/ssm-vpc/checking.git'
            }
        }

        stage('Init') {
            steps {
                sh 'terraform init'
            }
        }

        stage('Plan') {
            steps {
                sh 'terraform plan'
            }
        }

        stage('Apply') {
            steps {
                input message: "Approve Terraform Apply?"
                sh 'terraform apply -auto-approve'
            }
        }
    }
}
