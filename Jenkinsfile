pipeline {
  agent any
  triggers {
    githubPush()  // GitHub Webhook의 push 이벤트에 반응
  }
  options { timestamps() }
  stages {
    stage('Checkout') {
      steps { checkout scm }
    }
    stage('Build (make artifact)') {
      steps {
        sh '''
          mkdir -p build
          date +"%F %T %Z" > build/build-info.txt
          echo "commit: ${GIT_COMMIT}" >> build/build-info.txt || true
          echo "branch: ${BRANCH_NAME}" >> build/build-info.txt || true
          echo "hello, jenkins!" > build/hello.txt
          tar czf build/package.tgz -C build hello.txt build-info.txt
        '''
      }
    }
    stage('Archive') {
      steps {
        archiveArtifacts artifacts: 'build/**', fingerprint: true
      }
    }
  }
  post {
    success { echo '✅ SUCCESS' }
    failure { echo '❌ FAILURE' }
    always {
      echo "Build Result: ${currentBuild.currentResult}"
    }
  }
}
