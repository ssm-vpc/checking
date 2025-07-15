pipeline {
  agent any

  environment {
    AWS_ACCESS_KEY_ID     = credentials('jenkins-aws-secret-key-id')
    AWS_SECRET_ACCESS_KEY = credentials('jenkins-aws-secret-access-key')
    AWS_DEFAULT_REGION    = 'us-east-1'
  }

  stages {
    stage('Checkout Code') {
      steps {
        git 'https://github.com/ssm-vpc/checking.git'
      }
    }

    stage('Terraform Init') {
      steps {
        sh 'terraform init'
      }
    }

    stage('Terraform Validate') {
      steps {
        sh 'terraform validate'
      }
    }

    stage('Terraform Plan') {
      steps {
        sh 'terraform plan -out=tfplan'
      }
    }

    stage('Terraform Apply') {
      steps {
        input message: 'Do you want to apply the Terraform changes?'
        sh 'terraform apply -auto-approve tfplan'
      }
    }
  }

  post {
    always {
      echo 'Pipeline completed.'
    }
  }
}
