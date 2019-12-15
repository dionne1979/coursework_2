node {
    def app
    def scannerHome
    
    stage('Clone repository') {
        /* clone repository to workspace */

        checkout scm
    }

     
      stage('Build image') {
        /* build image */

         app = docker.build("ddougl204/repo")
    }


    stage('Push image') {
        /* push the image with two tags:
         * First, the incremental build number from Jenkins
         * Second, the 'latest' tag.*/

        docker.withRegistry('https://registry.hub.docker.com', 'docker-hub-credentials') {
	    app.push("${env.BUILD_NUMBER}")
            app.push("latest")
        }
    }
}





