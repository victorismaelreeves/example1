pipeline {
   agent any
   stages {
      
      stage('Build image') {
          steps {
              sh 'docker build -t victorismaelreeves/docker:latest .'
          }
      }
	   
      stage('Docker login') {
    	  steps {
		  withCredentials([usernamePassword(credentialsId: '20a4150c-e0c8-4147-b245-ec7593bc8293', passwordVariable: 'DOCKER_PASSWORD', usernameVariable: 'DOCKER_USER')]) {
			sh "docker login -u ${DOCKER_USER} -p ${DOCKER_PASSWORD}"
		}  
	  }
      }
      
      stage ('Push image'){
	  steps {
		sh "docker push victorismaelreeves/docker:latest"
	  }      
      } 
   }
}
