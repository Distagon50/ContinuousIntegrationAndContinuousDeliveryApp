FROM dockerfile/java:oracle-java8
MAINTAINER lucas <lucas.ganyu.li@accenture.com>

ENTRYPOINT ["/usr/bin/java", "-jar", "/usr/share/myservice/myservice.jar"]

# Add Maven dependencies (not shaded into the artifact; Docker-cached)
ADD target/lib           /usr/share/lib
# Add the service itself
ADD target/ContinuousIntegrationAndContinuousDeliveryApp.jar /usr/share/ContinuousIntegrationAndContinuousDeliveryApp.jar
