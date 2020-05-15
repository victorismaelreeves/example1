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
		  withCredentials([usernamePassword(credentialsId: '20a4150c-e0c8-4147-b245-ec7593bc8293', passwordVariable: 'DOCKER_PASSWORD', usernameVariable: 'DOCKER_USER')]) {
			sh "docker login -u ${DOCKER_USER} -p ${DOCKER_PASSWORD}"
		  }  
	  }
      }
       stage ('Push'){
	  steps {
		sshagent (credentials: ['toolbox-vagrant-key']) {
			sh "docker push victorismaelreevesy/ruby-docker:latest"
		}
	  }      
      }
          stage ('Run image as a container'){
	  steps {
		  sshagent (credentials: ['toolbox-vagrant-key']) {
		  	sh "ssh vagrant@10.10.50.4 docker run -dit --restart always --name web -p 9100:9100 victorismaelreeves/docker:latest"  
		  }
	  }
      }
   }
}
