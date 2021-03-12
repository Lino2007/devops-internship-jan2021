
pipeline {

  agent any

  stages {

    stage("Prepare and build ms") {
            steps {
            sh "mvn clean install -DskipTests"
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

    stage("Push image to Dockerhub") {
        steps {
             echo "maven"
            }
        }
    }
 

  post {
    always {
      cleanWs()
    }
  }
}


