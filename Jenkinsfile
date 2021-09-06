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
        sh "docker images | grep dstubked/orders-nginx"
    }
    
    stage('Push Image into Registry') {
        /* Finally, we'll push the image into the Dev namespace */
        docker.withRegistry('https://registry.hub.docker.com', 'dockerhub') {
            app.push ("${env.BUILD_NUMBER}")
        }
    }
}
