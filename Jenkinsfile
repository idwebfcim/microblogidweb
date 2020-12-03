#!groovy
// Run docker build
properties([disableConcurrentBuilds()])

pipeline {
    agent any

    // triggers { pollSCM('* * * * *') }

    options {
        buildDiscarder(logRotator(numToKeepStr: '10', artifactNumToKeepStr: '10'))
        timestamps()
    }

    stages {
        stage("Build") {
            steps {
                echo " ============== Build =================="
                sh 'python3 -m venv "${BUILD_TAG}" && \
                        . "${BUILD_TAG}/bin/activate" && \
                        ${BUILD_TAG}/bin/pip3 install wheel && \
                        ${BUILD_TAG}/bin/pip3 install -r requirements.txt && \
                        flask db migrate'
            }
        }
        stage("Test") {
            steps {
                echo " ============== Test =================="

            }
        }
    }


}
