pipeline {

  agent any

  stages {
    stage("Terminate old containers") {
      steps {
        sh 'docker-compose down || true'
      }
    }
    
    
    stage("Prepare and build ms") {
      steps {
        build job: 'biz-ms'
        build job: 'admin-ms'
        build job: 'news-ms'
        build job: 'website-ms'
      }
    }

    stage("Deploy with docker-compose") {
      steps {
        sh 'docker-compose up -d'
      }
    }
  }

  post {
    always {
      cleanWs()
    }
  }
}
