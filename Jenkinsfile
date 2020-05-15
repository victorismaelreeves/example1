pipeline {
   agent any
   stages {
      stage('Build image') {
          steps {
              sh "docker build -t victorismaelreeves/docker:latest ."
	  }
      }   
      stage('login') {
    	  steps {
		  withCredentials([usernamePassword(credentialsId: 'docker-hub-credentials', passwordVariable: 'DOCKER_PASSWORD', usernameVariable: 'DOCKER_USER')]) {
			sh "docker login -u ${DOCKER_USER} -p ${DOCKER_PASSWORD}"
		  }  
	  }
      }
      stage ('Push'){
	  steps {
		sh "docker push victorismaelreeves/docker:latest"
	  }      
      }
      stage ('Run image'){
	  steps {
		sh "docker run -dit --restart always --name web -p 9100:9100 victorismaelreeves/docker:latest"  
	  }
      }
   }
}
