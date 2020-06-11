node {
    def app

    stage('Clone repository') {
        /* Clone repository to our workspace */

        checkout scm
    }

    stage('Build Dev Namespace Image') {
        /* This builds the dev namespace image */

        app = docker.build("dstubked-docker.jfrog.io/orders-nginx-dev:good")
    }
    
    stage ('Aqua Scan') {
        /* Scan built image */
        aqua customFlags: '--layer-vulnerabilities', hideBase: false, hostedImage: '', localImage: 'dstubked-docker.jfrog.io/orders-nginx-dev:good', locationType: 'local', notCompliesCmd: '', onDisallowed: 'fail', policies: '', register: true, registry: 'JFrog', showNegligible: false
    }
    
    stage('Push Dev Namespace Image') {
        /* Finally, we'll push the image into the Dev namespace */
        docker.withRegistry('https://dstubked-docker.jfrog.io', 'jfrog') {
            app.push()
        }
    }
}
