FROM openjdk:11-jre-slim

ENV JMETER_VERSION=5.6.3
WORKDIR /opt/jmeter

RUN apt-get update && apt-get install -y wget unzip \
&& wget https://archive.apache.org/dist/jmeter/binaries/apache-jmeter-${JMETER_VERSION}.zip \
&& unzip apache-jmeter-${JMETER_VERSION}.zip \
&& mv apache-jmeter-${JMETER_VERSION}/* /opt/jmeter/ \
&& rm -rf apache-jmeter-${JMETER_VERSION}.zip apache-jmeter-${JMETER_VERSION} \
&& apt-get remove -y wget unzip \
&& apt-get autoremove -y

ENV PATH="$PATH:/opt/jmeter/bin"
CMD ["jmeter", "-v"]