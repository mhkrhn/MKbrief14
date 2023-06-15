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
        
node{

    stage('Clone') {
        checkout scm
    }

    stage ('Build Image') {
        docker.build("mowqa/doom")
    }
    stage ('Push Image') {
        sh 'docker login -u mowqa -p dckr_pat_is0y3bHt8AoE6BLlA7sv3NaKJMI'
        sh 'docker push mowqa/doom'
    }
    }    
    }
}
