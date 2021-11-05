node {
  try {
    stage('Checkout') {
      checkout scm
    }
    stage('Environment') {
      sh 'git --version'
      echo "Branch: ${env.BRANCH_NAME}"
      sh 'docker -v'
      sh 'printenv'
    }
/*     stage('Build Docker test'){
     sh 'docker build -t react-test -f Dockerfile.test --no-cache .'
    }
    */
    stage('Deploy'){
      if(env.BRANCH_NAME == 'master'){
        sh 'docker build -t mgcerati/dockerapi --no-cache .'
        sh 'docker run -p 5000:80 mgcerati/dockerapi'

      }
    }
  }
  catch (err) {
    throw err
  }
}