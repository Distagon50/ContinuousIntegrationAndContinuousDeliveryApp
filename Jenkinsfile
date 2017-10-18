node {
        withMaven(
        // Maven installation declared in the Jenkins "Global Tool Configuration"
        maven: 'M3',
        // Maven settings.xml file defined with the Jenkins Config File Provider Plugin
        // Maven settings and global settings can also be defined in Jenkins Global Tools Configuration
        globalMavenSettingsConfig: '966683f6-6877-46f8-9af3-9bbf9bdf67a6',
        mavenSettingsConfig: '45658a27-6e5d-4bca-b355-cc606cdee8f5') {
            
    stage('Preparation') { // for display purposes
        git credentialsId: '41960f2b-d390-4218-b39d-917672cf5b25', url:'https://github.com/Distagon50/ContinuousIntegrationAndContinuousDeliveryApp.git', branch:'master'
    }
    stage('Test') 
    {
        sh "mvn test"
    }
    stage('Package to Repository') {
        sh "mvn clean package -DskipTests"
        sh "mvn deploy -e"
    }
    stage('Build Image to Repository') {
        //sh 'docker build --build-arg username=test --build-arg token=ec3ulgkv2mekoqarv4pzytrh2gdiyuuy5fgqsdnns56e3orxngeq -t "myapplication" -f Dockerfile.'
        //sh 'env'
 		//sh "docker tag ant-wechat:latest https://demo.daveland.com.cn/devops/nexus/repository/testrepo/ant-wechat:0.0.1-SNAPSHOT"
        docker.withRegistry('http://34.211.91.122:8082/', '2c0a6d6d-a823-4c8e-9ed5-692d1df1329b'){ 
        def newApp = docker.build "34.211.91.122:8082/springboot:latest"
        newApp.push()
    }
    }
}
