pipeline {
   agent any

   stages {
      stage('Copy artifact') {
         steps {
            copyArtifacts filter: 'example1', fingerprintArtifacts: true, projectName: 'simple_ruby_multii',  selector: lastSuccessful()
         }
      }
      stage('Deliver') {
         steps {
            ansiblePlaybook become: true, credentialsId: 'vagrant-ssh', inventory: 'hosts.ini', playbook: 'playbook.yml'
         }
      }
   }
}
