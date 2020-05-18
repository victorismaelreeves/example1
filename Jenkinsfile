pipeline {
   agent any

   tools {
        go {'go-1.14'}
   }

   stages {
      stage('Unit Test') {
          steps {
              sh 'go test'
          }
      }
      
      stage('Build') {
          steps {
              sh 'go build -o example1'
          }
      }
      
      stage('Deliver') {
          steps {
                 ansiblePlaybook disableHostKeyChecking: true, credentialsId: 'toolbox-vagrant-key', inventory: 'hosts.ini', playbook: 'playbook.yml'
          }
      }

      stage('Integration Test') {
          steps {
             sh 'docker run -t postman/newman:latest run "https://www.getpostman.com/collections/0fb9d09f41531188decc"'
          }
      }
   }
}
