   env:
      ARM_CLIENT_ID: ${{ secrets.TF_VAR_ARM_CLIENT_ID }}
      ARM_CLIENT_SECRET: ${{ secrets.TF_VAR_ARM_CLIENT_SECRET }}
      ARM_SUBSCRIPTION_ID: ${{ secrets.TF_VAR_ARM_SUBSCRIPTION_ID }}
      ARM_TENANT_ID: ${{ secrets.TF_VAR_ARM_TENANT_ID }}   
pipeline {
    agent any
  
    parameters
    {
        booleanParam(defaultValue: true, description: '', name: 'Env')
        string(name: 'name', defaultValue: "", description: 'env')
        choice(choices: ['apply', 'destroy'], name: 'Action')
    }
    
    stages {
        
  
     
        
        stage ('Terraform Init') {
            steps {
                echo "${params.name}"
                script {
                    
                    sh "cd ${params.name} && terraform init"
                }                
            }
        }
    
   
        stage ('Terraform apply') {
            steps {
                script {
                    sh "cd ${params.name} && terraform apply -auto-approve"
                }    
            }
        } 
        

        stage ('Clone') {
            steps {
                checkout scm
            }
        }

        stage ('Build Image') {
            steps {
                script {
                    docker.build("mhkrhn/mkbrief14")
                }    
            }
        }    
        stage ('Push Image') {
            steps {
                sh "docker login -u mhkrhn -p dckr_pat_nMkCbhcdZJxwHULLUidN83YRK-k"
                sh "docker push mhkrhn/mkbrief14"
            }
        }
    }

        }

