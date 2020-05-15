pipeline {
	agent any
	stages {
		stage('Publish') { 
			steps { 
				archiveArtifacts 'web.rb'
			}
		}
	}
}
