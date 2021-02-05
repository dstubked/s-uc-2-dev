node {
    def app

    stage('Clone repository') {
        /* Clone repository to our workspace */

        checkout scm
    }

    stage('Build Container Image') {
        /* This builds the dev namespace image */

        app = docker.build("dstubked/orders-nginx:${env.BUILD_NUMBER}")
    }
    stage('Test Image') {
        sh "docker images | grep orders"
    }
    
    /*stage ('Aqua Scan') {
        aqua customFlags: '--layer-vulnerabilities', hideBase: false, hostedImage: '', localImage: 'dstubked-docker.jfrog.io/orders-nginx-dev:good', locationType: 'local', notCompliesCmd: '', onDisallowed: 'fail', policies: '', register: true, registry: 'JFrog', showNegligible: false
    }*/
    
    
    stage('Push Image into Registry') {
        /* Finally, we'll push the image into the Dev namespace */
        docker.withRegistry('https://registry.hub.docker.com', 'dockerhub') {
            app.push ("${env.BUILD_NUMBER}")
        }
    }
}
