node {
                 def remote = [:]
                 remote.name = 'mkjenkinsvm'
                 remote.host = '51.103.70.96'
                 remote.user = 'azureuser'
                 remote.password = 'Karahan507144'
                 remote.allowAnyHosts = true
                 stage('Remote SSH') {
                 sshCommand remote: remote, command: "docker run -d -p 1137:1337 mhkrhn/jenktest"
            }
        }  
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

