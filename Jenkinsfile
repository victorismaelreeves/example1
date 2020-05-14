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
		stage('Get dependencies') { 
			steps {
				sh "go get \"github.com/aws/aws-lambda-go/lambda\""
			}
		}
		stage('Build') { 
			steps {
				sh 'GOOS=linux GOARCH=amd64 go build -o myLambdaScript myLambdaScript.go'
				sh 'zip myLambdaScript.zip myLambdaScript'
			}
		}
		stage('Publish') { 
			steps { 
				archiveArtifacts 'myLambdaScript.zip'
			}
		}
	}
}
