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
        sh 'docker tag mgcerati/dockerapi localhost:5000/mgcerati/dockerapi'
        sh 'docker push localhost:5000/mgcerati/dockerapi'
        sh 'docker rmi -f mgcerati/dockerapi localhost:5000/mgcerati/dockerapi'
      }
    }
  }
  catch (err) {
    throw err
  }
}