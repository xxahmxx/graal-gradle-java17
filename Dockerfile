FROM debian:bookworm-slim

RUN apt-get -qq update && \
    apt-get -qq install -y wget gcc libz-dev unzip
RUN  apt-get update && apt-get install java-common && \
     wget -q https://corretto.aws/downloads/resources/17.0.10.8.1/java-17-amazon-corretto-jdk_17.0.10.8-1_amd64.deb && \
     dpkg --install java-17-amazon-corretto-jdk_17.0.10.8-1_amd64.deb && \
     java -version && \
     rm java-17-amazon-corretto-jdk_17.0.10.8-1_amd64.deb
ENV JAVA_HOME /opt/graalvm-jdk-17
RUN export JAVA_HOME

RUN wget -q https://services.gradle.org/distributions/gradle-8.6-bin.zip && \
    mkdir /opt/gradle && \
    unzip -d /opt/gradle gradle-8.6-bin.zip && \
    ls /opt/gradle/gradle-8.6 && \
    rm gradle-8.6-bin.zip

RUN wget -q https://download.oracle.com/graalvm/17/latest/graalvm-jdk-17_linux-x64_bin.tar.gz && \
    mkdir /opt/graalvm-jdk-17 && \
    tar -xzf graalvm-jdk-17_linux-x64_bin.tar.gz --directory /opt/graalvm-jdk-17 --strip-components=1 && \
    ls /opt/graalvm-jdk-17
ENV GRAALVM_HOME /opt/graalvm-jdk-17
RUN export JAVA_HOME
CMD ["bash"]
ENV PATH=/opt/gradle/gradle-8.6/bin:/opt/graalvm-jdk-17/bin$PATH
