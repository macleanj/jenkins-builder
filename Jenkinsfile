// ------------------------
// Shared Library Functions
// ------------------------
// Implicitly loaded in the project Folder

def debugInfo

pipeline {
  triggers {
    pollSCM('* * * * *') /* default: poll once a minute */
  }

  options {
    buildDiscarder(
      logRotator(
        artifactDaysToKeepStr: '100', 
        artifactNumToKeepStr: '5', 
        daysToKeepStr: '100',
        numToKeepStr: '5'
      )
    )
    timestamps()
  }

  environment {
    GIT_AUTHOR_NAME = sh(returnStdout: true, script: 'git show -s --pretty=%an').trim()
  }

  agent {
    kubernetes(k8sagent(name: 'base+s_helper', label: 'jnlp', cloud: 'kubernetes'))
  }

  stages {
    stage ('Set environment') {
      agent { label 'master' }
      environment {
        TMP_TAGS_NAME = "${TAG_NAME ? TAG_NAME : ''}"
        TMP_CHANGE_ID = "${CHANGE_ID ? CHANGE_ID : ''}"
        BASE_DIR = sh(returnStdout: true, script: "echo ${WORKSPACE} | sed -e 's?.*/workspace/??g' | sed -e 's?/??g'").trim()
        WORKSPACE_LIBS = sh(returnStdout: true, script: "[ -d ${WORKSPACE}/../workspace@libs ] && echo \"${WORKSPACE}/../workspace@libs\" || echo \"${WORKSPACE}/../${BASE_DIR}@libs\"").trim()
        PREP_LOAD_ENV = sh(returnStdout: false, script: "${WORKSPACE_LIBS}/cicd/resources/com/cicd/jenkins/prepEnv.sh -build_number ${BUILD_NUMBER} -git_commit ${GIT_COMMIT} -tag_name ${TMP_TAGS_NAME} -change_id ${TMP_CHANGE_ID} > /dev/null 2>&1")
      }
      steps {
        sh 'echo "master - Set environment"'
        load "${WORKSPACE_LIBS}/cicd/resources/com/cicd/jenkins/files/env.groovy"

        script {
          if (env.CICD_DEBUG == '1') {
            debugInfo = sh(script: "printenv | sort", returnStdout: true)
            echo "DEBUG: Environment\n${debugInfo}"
          }
        }
      }
    }
    stage ('Build Image') {
      when { environment name: 'CICD_BUILD_ENABLED', value: '1' }
      steps {
        container ('jenkins-builder') {
          dir ("${CICD_TAG_APP_NAME}") {
            sh 'echo "jenkins-builder - Build Image"'
            sh 'img build -f Dockerfile -t ${CICD_REGISTRY_URL}/${CICD_REGISTRY_SPACE}/${CICD_TAG_APP_NAME}:${CICD_TAGS_ID} .'
          }
        }
      }
    }
    stage ('Publish Image') {
      when { environment name: 'CICD_BUILD_ENABLED', value: '1' }
      steps {
        container ('jenkins-builder') {
          dir ("${CICD_TAG_APP_NAME}") {
            sh 'echo "jenkins-builder - Publish Image"'
            sh 'img push ${CICD_REGISTRY_URL}/${CICD_REGISTRY_SPACE}/${CICD_TAG_APP_NAME}:${CICD_TAGS_ID}'
          }
        }
      }
    }
  // stages
  }

  post {
    failure {
      echo 'This will run only if failed'
    }
  // post
  }

// pipeline
}
