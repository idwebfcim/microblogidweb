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
                        ${BUILD_TAG}/bin/pip3 install --upgrade pip && \
                        ${BUILD_TAG}/bin/pip3 install wheel && \
                        ${BUILD_TAG}/bin/pip3 install -r requirements.txt && \
                        flask db stamp head && flask db migrate && flask db upgrade && \
                        deactivate'
            }
        }
        stage("Test") {
            steps {
                echo " ============== Test =================="
                sh '. "${BUILD_TAG}/bin/activate" && python3 tests.py && deactivate'
            }

            post {
                always {
                    junit 'test-reports/*.xml'
                }
            }  
        }

    }

    post {
        always {
            echo "Deleting virtual environment created"
            sh 'rm -rf ${BUILD_TAG}'
        }
    }


}
