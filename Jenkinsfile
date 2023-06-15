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
        
        stage ('Build Image') {
            steps {
                docker.build("mhkrhn/mkbrief14")
    }
        stage ('Push Image') {
            steps {
                sh 'docker login -u mhkrhn -p dckr_pat_nMkCbhcdZJxwHULLUidN83YRK-k'
                sh 'docker push mhkrhn/mkbrief14'
    }
    }    
    }
}
