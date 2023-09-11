pipeline {
    agent any // Specifies that the pipeline can run on any available agent (agent refers to the Jenkins worker node).

    stages {
       // stage('Checkout') { // This is the first stage in the pipeline and is named "Checkout."
            //steps {
             //   // This step allows us to use the GitHub token securely for authentication during the checkout process.
              //  withCredentials([string(credentialsId: 'GitHub_Token', variable: 'github_token')]) {
                    // This step checks out the source code repository from GitHub using Git.
                //    checkout([
                 //       $class: 'GitSCM',
                 //       branches: [[name: '*/main']], // The pipeline will only consider the 'main' branch.
                  //      extensions: [[$class: 'CleanCheckout']], // Ensures a clean checkout without any leftovers from previous builds.
                  //      userRemoteConfigs: [[url: 'https://' + env.github_token + '@' + 'github.com/ab12345/12345xyz.git']] // The repository URL with the GitHub token for authentication.
                  //  ])
              //  }
           // }
       //}

        stage('Initialize Working Directory') { // This is the second stage, which initializes the Terraform working directory.
            steps {
                script {
                    // This step runs the 'terraform init' command to initialize the Terraform working directory.
                    sh 'terraform init'
                }
            }
        }

        stage('Terraform destroy') { // This is the third stage, which performs a Terraform destroy.
            steps {
                script {
                    // This step runs the 'terraform plan' command to generate an execution plan for Terraform.
                    sh 'terraform destroy --auto-approve'
                }
            }
        }

           stage('Terraform Plan') { // This is the third stage, which performs a Terraform plan.
            steps {
                script {
                    // This step runs the 'terraform plan' command to generate an execution plan for Terraform.
                    sh 'terraform plan'
                }
            }
        }


    }
}