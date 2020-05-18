pipeline {
   agent any

   tools {
        go {'gc-1.14'}
   }

   stage('Build') {
          steps {
              sh 'go build -o example1'
          }
      }
   
      stage('Deliver') {
         steps {
            ansiblePlaybook become: true, credentialsId: 'toolbox-vagrant-key', inventory: 'hosts.ini', playbook: 'playbook.yml'
         }
      }
   }
