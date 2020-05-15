pipeline {
   agent any
   stages {
      
      stage('Build image') {
          steps {
              sh 'sudo docker build -t victorismaelreeves/docker:latest .'
          }
      }
	   
      stage('Docker login') {
    	  steps {
		  withCredentials([usernamePassword(credentialsId: 'docker-hub-credentials', passwordVariable: 'DOCKER_PASSWORD', usernameVariable: 'DOCKER_USER')]) {
			sh "sudo docker login -u ${DOCKER_USER} -p ${DOCKER_PASSWORD}"
		}  
	  }
      }
      
      stage ('Push image'){
	  steps {
		sh "sudo docker push victorismaelreeves/docker:latest"
	  }      
      } 
   }
}
