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
                sh 'python3 -m venv MicroBlog && \
                        . MicroBlog/bin/activate && \
                        pip3 install -r requirements.txt && \
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
