<h3>Latest Version</h3>

<br>Build Tools Version: 27.0.3  28.0.3  29.0.2
<br>Appcenter: 2.4.0
<br>Appium:1.16.0
<br>Gradle: 5.4.1
<br>Java: 1.8
<br>Maven: 3.6
<br>SonarScanner 4.3.0.2102

 How's work?

docker run -it -v ${WORKSPACE}:/root/codigo_aplicacao renatoadsumus/android:latest gradle clean test

docker run -it -v ${WORKSPACE}:/root/codigo_aplicacao renatoadsumus/android:latest gradle assembledebug

docker run -it -v ${WORKSPACE}:/root/codigo_aplicacao renatoadsumus/android:latest sonar-scanner -Dsonar.projectKey='com.br.sample' -Dsonar.projectName='PROJECT_NAME' -Dsonar.projectVersion='BASELINE' -Dsonar.sources='app/src' -Dsonar.sourceEncoding='UTF-8' -Dsonar.host.url='https://www.sonarqube.org/' -Dsonar.login='TOKEN'
