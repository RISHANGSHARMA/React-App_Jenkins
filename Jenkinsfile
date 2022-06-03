pipeline {
        agent any
    tools{
       nodejs '17.8.0'
    }
     stages {
        stage("Build") {
            steps {
                sh "npm install"
                sh "npm run build"
            }
        }
        }
}