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
				ansiblePlaybook become: true, 
				disableHostKeyChecking: true,
				credentialsId: 'vagrant-ssh', 
				inventory: "environments/${params.TARGET_ENV}/hosts.ini", 
				playbook: 'playbook.yml'
			}
		}
	}
}
