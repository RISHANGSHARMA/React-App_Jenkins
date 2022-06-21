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
		 stage('Software Composition Analysis'){
            steps{
                stepSCA()
            }
        }
        stage('SonarQube Static Analysis'){
            steps {
                withSonarQubeEnv('Sonarqube_8') {
                    sh "${tool('sonar')}/bin/sonar-scanner -Dsonar.projectKey=${SONAR_PROJECT} -Dsonar.projectName=${SONAR_PROJECT} -Dsonar.sources=$WORKSPACE -Dsonar.javascript.lcov.reportPaths=coverage/lcov.info -Dsonar.dependencyCheck.htmlReportPath=./dependency-check-report.html"
                }
            }
        }
        stage("Quality and Security Gate") {
            steps {
                stepQualityGate()
              }
        }
        stage('Publish package'){
            steps{
               sh 'npm run build'
            }
        }
        stage("Docker Build"){
            environment {
             registryCredential = 'artifactoryCredential'
            }
            steps{
               stepDockerBuildWithRegistry(IMAGE,'.')
            }
        }
        stage("Kubernetes Service Deploy"){
            environment {
                 APP_NAME = "${APP}"
                 IMAGE_NAME = "${IMAGE}"
            }
            steps{
                 stepKubeServiceDeploy(APP)
            }
        }
        }
}
