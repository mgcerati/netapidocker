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
        sh 'docker tag dockerapi localhost:4000/dockerapi'
        sh 'docker push localhost:4000'
        sh 'docker rmi -f dockerapi localhost:5000/dockerapi'
        sh 'docker pull localhost:4000/dockerapi'
        sh 'docker rm -f dockerapi'
        sh 'docker run -d -p 4000:4000 --name dockerapi localhost:4000/dockerapi:latest'
      }
    }
  }
  catch (err) {
    throw err
  }
}