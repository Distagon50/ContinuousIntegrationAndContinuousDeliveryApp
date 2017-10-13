FROM java:8-jdk
MAINTAINER lucas <lucas.ganyu.li@accenture.com>

ENTRYPOINT ["/usr/bin/java", "-jar", "/usr/share/myservice/myservice.jar"]

# Add Maven dependencies (not shaded into the artifact; Docker-cached)
CMD java -jar ContinuousIntegrationAndContinuousDeliveryApp.jar
# Add the service itself
ADD build/ContinuousIntegrationAndContinuousDeliveryApp.jar /data/ContinuousIntegrationAndContinuousDeliveryApp.jar
