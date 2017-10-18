node {
        withMaven(
        // Maven installation declared in the Jenkins "Global Tool Configuration"
        maven: 'M3',
        // Maven settings.xml file defined with the Jenkins Config File Provider Plugin
        // Maven settings and global settings can also be defined in Jenkins Global Tools Configuration
        globalMavenSettingsConfig: '91fe42e9-9bec-42a1-b72c-43b56f129502',
        mavenSettingsConfig: '569ce301-98b1-4c66-a182-40f6209d005b') {
            
    stage('Preparation') { // for display purposes
        git credentialsId: '53800197-e86a-429b-8617-ec74b43680aa', url: 'https://demo.daveland.com.cn/devops/gitlab/springbootCD/ContinuousIntegrationAndContinuousDeliveryApp.git'
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
