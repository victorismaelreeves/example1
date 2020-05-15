pipeline {
  agent any

  stages {
    stage('Build') {
      steps {
        sh 'tar czvf simple_ruby.tar.gz *.rb'
      }
    }
    stage('Publish') {
      steps {
        archiveArtifacts 'simple_ruby.tar.gz'
      }
    }
}
}
