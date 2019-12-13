node {
    def app
    
    stage('Clone repository') {
        /* clone repository to workspace */

        checkout scm
    }

    stage('Build image') {
        /* build image */

        app = docker.build("ddougl204/repo")
    }

 
     stage('Sonarqube') {
         environment {
             scannerHome = tool 'SonarQube'
         }    steps {
             withSonarQubeEnv('SonarQube') {
                 sh "${scannerHome}/bin/sonar-scanner"
             }   
         }
     }

    stage('Push image') {
        /* Finally, we'll push the image with two tags:
         * First, the incremental build number from Jenkins
         * Second, the 'latest' tag.
         * Pushing multiple tags is cheap, as all the layers are reused. */
        docker.withRegistry('https://registry.hub.docker.com', 'docker-hub-credentials') {
	    app.push("${env.BUILD_NUMBER}")
            app.push("latest")
        }
    }
}





