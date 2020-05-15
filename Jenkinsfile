pipeline {
	agent any
	stages {
		stage('Copy artifact') {
			steps {
				copyArtifacts filter: 'example1', fingerprintArtifacts: true, projectName: 'example2', selector: lastSuccessful(), target: 'docker'
			}
		}
		stage('Docker build and upload to ') {
			steps {
				script {
					docker.withRegistry('', 'dockerhub') {					
						def customImage = docker.build("victorismaelreeves/docker:latest", "./docker")
						customImage.push()						
					}
				}
			}
		}
	}
}
