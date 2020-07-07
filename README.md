<h3>Latest</h3>
<br>Build Tools Version: 27.0.3  28.0.3  29.0.2
<br>Appcenter: 2.6.1
<br>Appium:1.16.0
<br>Gradle: 5.4.1
<br>Java: 1.8
<br>Maven: 3.6
<br>SonarScanner 4.3.0.2102

<h3>GIT HUB</h3>
https://github.com/renatoadsumus/docker_android

<h3> How's work CI - Test, Build and Sonar?</h3>

docker run -it -v ${WORKSPACE}:/root/codigo_aplicacao renatoadsumus/android:latest gradle clean test

docker run -it -v ${WORKSPACE}:/root/codigo_aplicacao renatoadsumus/android:latest gradle assembledebug

docker run -it -v ${WORKSPACE}:/root/codigo_aplicacao renatoadsumus/android:latest sonar-scanner -Dsonar.projectKey='com.br.sample' -Dsonar.projectName='PROJECT_NAME' -Dsonar.projectVersion='BASELINE' -Dsonar.sources='app/src' -Dsonar.sourceEncoding='UTF-8' -Dsonar.host.url='https://www.sonarqube.org/' -Dsonar.login='TOKEN'

<h3>How's works Deploy App Center?</h3>

docker run --rm -v ${WORKSPACE}:/root/codigo_aplicacao -e APPCENTER_NAME_APP=renatoadsumus-gmail.com/Bitcoin-Calculator -e APPCENTER_PATH_APK=app/build/outputs/apk/debug/app-debug.apk -e APPCENTER_TOKEN=**** renatoadsumus/android:latest /opt/appcenter_deploy.sh


