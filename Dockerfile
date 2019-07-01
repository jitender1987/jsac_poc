FROM jcas:v1
ENV CASC_VAULT_ENGINE_VERSION=1
ENV CASC_JENKINS_CONFIG="/var/jenkins_home/jenkins.yml"
ENV CASC_VAULT_TOKEN=accbdd04-79cf-58f4-2ae8-0f5589bb9274
ENV CASC_VAULT_PATHS=secret/jenkins
ENV CASC_VAULT_URL=http://142.93.220.221:8200
ENV JAVA_OPTS -Djenkins.install.runSetupWizard=false
COPY jenkins.yml ${CASC_JENKINS_CONFIG}
COPY settings.xml "/var/jenkins_home/.m2/settings.xml"
USER jenkins
RUN /usr/local/bin/install-plugins.sh script-security workflow-job workflow-aggregator job-dsl configuration-as-code configuration-as-code-support git workflow-cps-global-lib:2.13 
