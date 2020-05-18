pipeline {

	agent any
	
	tools {
		go {'go-1.14'}
	}
	
	environment {
		XDG_CACHE_HOME = '/tmp/.cache'
		CGO_ENABLED='0'
	}
	
	stages {
		stage('Test') { 
			steps {
				sh "go get \"github.com/aws/aws-lambda-go/lambda\""
			}
		}
		stage('Build') { 
			steps {
				sh 'go build -o MyLambdaScript MyLambdaScript.go'
			}
		}
		stage('Publish') { 
			steps { 
				archiveArtifacts 'MyLambdaScript'
			}
		}
	}
}
