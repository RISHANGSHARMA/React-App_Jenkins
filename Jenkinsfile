def SONAR_PROJECT="${env.JOB_NAME}".split("/")[-2]
  def APP = "react_app"
  def IMAGE = "10.83.0.202:9082/docker-hub-virtual/canadalabs/reactapp"

pipeline {
        agent any
    tools{
       nodejs '14.18.1'
    }
     stages {
        stage("Build") {
            steps {
                


                sh "npm install"
                sh "yarn build"
                
            }
        }
// 		 stage('Software Composition Analysis'){
//             steps{
//                 stepSCA()
//             }
//         }
//         stage('SonarQube Static Analysis'){
//            steps {
//                withSonarQubeEnv('Sonarqube_8') {
//                    sh "${tool('sonar')}/bin/sonar-scanner -Dsonar.projectKey=${SONAR_PROJECT} -Dsonar.projectName=${SONAR_PROJECT} -Dsonar.sources=$WORKSPACE -Dsonar.javascript.lcov.reportPaths=coverage/lcov.info -Dsonar.dependencyCheck.htmlReportPath=./dependency-check-report.html"
//                }
//            }
//         }
      
//         stage('Dependency check'){
//             steps{
//              dependencyCheck odcInstallation: 'OWASP',additionalArguments: '-n --format HTML --format XML'
// 			}
//         }
        
//         stage('Security Gate'){
// 			steps{   
// 				dependencyCheckPublisher pattern: ''
				
// 			} 
//         }
//         stage('SonarQube Analysis'){
//            steps {
//               withSonarQubeEnv('Sonarqube_8') {
//                 sh "${tool("sonar")}/bin/sonar-scanner \
//   -Dsonar.projectKey=JavaScript -Dsonar.projectBaseDir=$WORKSPACE \
//   -Dsonar.sources=$WORKSPACE -Dsonar.javascript.lcov.reportPaths=reports/coverage/lcov.info -Dsonar.dependencyCheck.htmlReportPath=$WORKSPACE/dependency-check-report.html "
//               }
//             }
           
           
//         }
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
                 APP_NAME = "react_app"
                 IMAGE_NAME = "10.83.0.202:9082/docker-hub-virtual/canadalabs/reactapp"
            }
            steps{
                 stepKubeServiceDeploy("react_app")
            }
        }
        }
}

