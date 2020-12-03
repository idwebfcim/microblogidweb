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
            }
        }
        stage("Test") {
            steps {
                echo " ============== Test =================="

            }
        }
    }
}
