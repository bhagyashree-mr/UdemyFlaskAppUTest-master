pipeline {
    agent any
    stages {
        stage('Checkout Code') {
            steps {
				echo "Checkout"
				git branch: 'main', url: 'https://github.com/bhagyashree-mr/UdemyFlaskAppUTest-master.git'
				sh 'ls -l'
            }
        }
     stage('Unit Tests') {
           steps {
				echo "Unit Tests"
				// sh(returnStatus: true, script: '. ~/.bashrc \n pyenv version')
				//sh('chmod +x ./Jenkinsfile.sh')
				sh('bash ./Jenkinsfile.sh')
          }
        }
	stage("Publish Junit report") {
            steps{
				echo "Publish Junit"
				junit skipMarkingBuildUnstable: true, testResults: 'xmlReport/output.xml'
            }
        }
	stage ("Publish Code Coverage") {
            steps{
				echo "Publish code coverage"
				cobertura coberturaReportFile: 'coverage.xml'
            }
        }
    }
}