FROM ubuntu:18.04

#=============
# Set WORKDIR
#=============
WORKDIR /root

RUN apt-get -qqy update && \
    apt-get -qqy --no-install-recommends install \
    openjdk-8-jdk \
    ca-certificates \
    tzdata \
    zip \
    unzip \
    curl \
    wget \
    libqt5webkit5 \
    libgconf-2-4 \
    xvfb \
    gnupg \
    salt-minion \
  && rm -rf /var/lib/apt/lists/*

#===============
# Set JAVA_HOME
#===============
ENV JAVA_HOME="/usr/lib/jvm/java-8-openjdk-amd64/jre" \
    PATH=$PATH:$JAVA_HOME/bin

#=====================
# Install Android SDK
#=====================
ARG SDK_VERSION=sdk-tools-linux-4333796
ARG ANDROID_BUILD_TOOLS_VERSION=27.0.3
ARG ANDROID_PLATFORM_VERSION="android-27"
ARG GRADLE_VERSION=4.10.3


ENV SDK_VERSION=$SDK_VERSION \
    ANDROID_BUILD_TOOLS_VERSION=$ANDROID_BUILD_TOOLS_VERSION \
    ANDROID_HOME=/root
	
RUN wget -O tools.zip https://dl.google.com/android/repository/${SDK_VERSION}.zip && \
    unzip tools.zip && rm tools.zip && \
    chmod a+x -R $ANDROID_HOME && \
    chown -R root:root $ANDROID_HOME


ENV PATH=$PATH:$ANDROID_HOME/tools:$ANDROID_HOME/tools/bin:$ANDROID_HOME/platform-tools:$ANDROID_HOME/build-tools

RUN mkdir -p ~/.android && \
    touch ~/.android/repositories.cfg && \
    echo y | sdkmanager "platform-tools" && \
    echo y | sdkmanager "build-tools;$ANDROID_BUILD_TOOLS_VERSION" && \
    echo y | sdkmanager "platforms;$ANDROID_PLATFORM_VERSION"

RUN apt-get update

RUN yes | tools/bin/sdkmanager --licenses

RUN sdkmanager "platform-tools" "platforms;android-29"
RUN sdkmanager "platform-tools" "platforms;android-28"

#https://androidsdkmanager.azurewebsites.net/Buildtools

RUN wget https://dl.google.com/android/repository/build-tools_r29.0.2-linux.zip
RUN mv build-tools_r29.0.2-linux.zip build-tools
RUN cd build-tools && unzip build-tools_r29.0.2-linux.zip -d 29.0.2 && rm -fr build-tools_r29.0.2-linux.zip

RUN wget https://dl.google.com/android/repository/build-tools_r28.0.2-linux.zip
RUN mv build-tools_r28.0.2-linux.zip build-tools
RUN cd build-tools && unzip build-tools_r28.0.2-linux.zip -d 28.0.2 && rm -fr build-tools_r28.0.2-linux.zip

RUN apt-get install -y \
        nodejs \
        npm \
        git \
		maven

#RUN apt-get install -y maven
		
RUN npm install -g appium

RUN npm install appium-doctor -g

RUN npm i -g npm-upgrade

RUN npm cache clean -f
RUN npm install -g n
RUN n stable

EXPOSE 4723 2251 5555

RUN wget https://services.gradle.org/distributions/gradle-${GRADLE_VERSION}-bin.zip
RUN unzip gradle-${GRADLE_VERSION}-bin.zip -d /opt/gradle/

ENV GRADLE_HOME=/opt/gradle/gradle-${GRADLE_VERSION}/
ENV PATH=${GRADLE_HOME}/bin:${PATH}

#### SONAR ###

ADD https://binaries.sonarsource.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-4.3.0.2102-linux.zip /opt/

RUN unzip /opt/sonar-scanner-cli-4.3.0.2102-linux.zip -d /opt/ 
RUN mv /opt/sonar-scanner-4.3.0.2102-linux/ /opt/sonar_scanner/

ENV SONAR_SCANNER_HOME=/opt/sonar_scanner/bin

ENV PATH=$SONAR_SCANNER_HOME:$PATH



WORKDIR /root/codigo_aplicacao/
