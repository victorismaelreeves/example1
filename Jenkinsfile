pipeline {
   agent any

   stages {
      stage('Copy artifact') {
         steps {
            copyArtifacts filter: 'example1', fingerprintArtifacts: true, projectName: 'example 1',  selector: lastSuccessful()
         }
      }
      stage('Deliver') {
         steps {
            ansiblePlaybook become: true, credentialsId: 'vagrant-ssh', inventory: 'hosts.ini', playbook: 'playbook.yml'
         }
      }
   }
}
