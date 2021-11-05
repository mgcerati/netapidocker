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
        sh 'docker build -t dockerapi --no-cache .'
        sh 'docker tag dockerapi localhost:5000/dockerapi'
        sh 'docker push localhost:5000/dockerapi'
        sh 'docker rmi -f dockerapi localhost:5000/dockerapi'
        sh 'docker pull localhost:5000/dockerapi'
        sh 'docker rm -f dockerapi'
        sh 'docker run -d -p 5000:80 dockerapi'
      }
    }
  }
  catch (err) {
    throw err
  }
}