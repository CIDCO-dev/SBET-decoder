pipeline {

  environment {
    major=0
    minor=1
    patch="${env.BUILD_ID}"
    name="${env.JOB_NAME}"
    version="$major.$minor.$patch"
    exec_name="sbet-decoder-$version"

    publishDir="/var/www/html/$name/$version"
    lastPublishDir="/var/www/html/$name/last"
    binMasterPublishDir="$publishDir/bin/debian9/bin"
    binWinx64Dir="bin/windows-x64/bin"
    binWinx64PublishDir="$publishDir/$binWinx64Dir"
  }

  agent none
  stages {

    stage('TEST MASTER'){
      agent { label 'master'}
      steps {
        sh "make test"
      }
      post {
        always {
          junit 'build/test/reports/*.xml'
        }
      }
    }

    stage('DOCUMENTATION'){
      agent { label 'master'}
      steps {
        sh "make doc"
      }
    }

    stage('BUILD WINDOWS AND TEST'){
      agent {label 'windows10-x64-2'}
      steps {
        bat "Scripts\\change_makefile_name.bat"
        //compile
        bat "make test"
        bat "make"

        archiveArtifacts('build\\bin\\sbet-decoder.exe')
        archiveArtifacts('build\\bin\\accuracy-decoder.exe')

      }
      post {
        always {
          junit 'build\\test\\reports\\*.xml'
        }
      }
    }

    stage('BUILD MASTER'){
      agent { label 'master'}
      steps {
        sh 'make'
        sh 'mkdir -p $binMasterPublishDir'
        sh 'cp -r build/bin/sbet-decoder $binMasterPublishDir/$exec_name'
        sh 'cp -r build/bin/accuracy-decoder $binMasterPublishDir/accuracy-decoder-$version'
      }
    }

    stage('SAVE WINDOWS EXE on SERVER'){
      agent { label 'master' }
      steps {
        sh 'mkdir -p $binWinx64PublishDir'
        sh 'cp  /var/lib/jenkins/jobs/$name/builds/$patch/archive/build/bin/sbet-decoder.exe $binWinx64PublishDir/$exec_name.exe '
        sh 'cp  /var/lib/jenkins/jobs/$name/builds/$patch/archive/build/bin/accuracy-decoder.exe $binWinx64PublishDir/accuracy-decoder-$version.exe '
      }
    }
  }
}
