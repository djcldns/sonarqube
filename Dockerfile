FROM debian:jessie
RUN apt-get update && apt-get install -y curl unzip default-jre
RUN curl -k -o sonar.zip -L https://sonarsource.bintray.com/Distribution/sonarqube/sonarqube-5.2.zip && unzip sonar && chmod -R 777 /sonarqube-5*/logs /sonarqube-5*/bin/linux-x86-64 /sonarqube-5*/temp /sonarqube-5*/data /sonarqube-5*/extensions /sonarqube-5*/web && rm sonar.zip
COPY sonar.properties /sonarqube-5.2/conf/sonar.properties
EXPOSE 9000
CMD /sonarqube-5.2/bin/linux-x86-64/sonar.sh console
