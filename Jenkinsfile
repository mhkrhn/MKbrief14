pipeline {
    environment {
      MY_CRED = credentials('mkazure')
    }
    agent any
  
    parameters
    {
        booleanParam(defaultValue: true, description: '', name: 'Env')
        string(name: 'name', defaultValue: "", description: 'env')
        choice(choices: ['apply', 'destroy'], name: 'Action')
    }
    
    stages {
        stage('connection') {
            steps {
               sh 'az login --service-principal -u $MY_CRED_CLIENT_ID -p $MY_CRED_CLIENT_SECRET -t $MY_CRED_TENANT_ID'
      }
      }
        
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

