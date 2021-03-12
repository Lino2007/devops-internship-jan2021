
pipeline {

  agent any

  stages {

    stage("Prepare and build ms") {
            steps {
                        build job: 'biz_ms'
			build job: 'admin_ms'
			build job: 'news_ms'
			build job: 'website_ms'
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


