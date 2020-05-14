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
                 ansiblePlaybook disableHostKeyChecking: true, credentialsId: 'toobox-vagrant-key', inventory: 'hosts.ini', playbook: 'playbook.yml'
          }
      }

      stage('Integration Test') {
          steps {
             sh 'docker run -t postman/newman:latest run "https://www.postman.com/collections/f813962ffadc9d4b0f03"'
          }
      }
   }
}
