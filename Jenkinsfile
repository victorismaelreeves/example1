pipeline {
   agent any

   stages {
      stage('Copy artifact') {
         steps {
            copyArtifacts filter: 'example1', fingerprintArtifacts: true, projectName: 'example1', selector: lastSuccessful()
         }
      }
      stage('Deliver') {
         steps {
            ansiblePlaybook become: true, credentialsId: 'toolbox-vagrant-key', inventory: 'hosts.ini', playbook: 'playbook.yml'
         }
      }
   }
}
