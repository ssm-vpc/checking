pipeline {
  agent any

  environment {
    // Optionally set AWS credentials (requires Jenkins credentials setup)
    AWS_ACCESS_KEY_ID     = credentials('aws-access-key-id')
    AWS_SECRET_ACCESS_KEY = credentials('aws-secret-access-key')
    // Set your desired AWS region
    AWS_DEFAULT_REGION    = 'us-EAST-1'
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
