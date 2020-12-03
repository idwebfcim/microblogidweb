#!groovy

pipeline {

     agent any

     stages {

         stage("Build") {
             steps {
                 sh 'python3 -m venv "${BUILD_TAG}" && \
                     . ${BUILD_TAG}/bin/activate && \
                     ${BUILD_TAG}/bin/pip3 install --upgrade pip && \
                     ${BUILD_TAG}/bin/pip3 install wheel && \
                     ${BUILD_TAG}/bin/pip3 install -r requirements.txt && \
                     flask db stamp head && flask db migrate && flask db upgrade && deactivate'
             }
         }

         stage("Test") {
             steps {
                 sh '. ${BUILD_TAG}/bin/activate && python3 tests.py && deactivate'
             }
         }

     }
     
     post {
          always {
               sh 'rm -rf ${BUILD_TAG}'
          }
     }

}
