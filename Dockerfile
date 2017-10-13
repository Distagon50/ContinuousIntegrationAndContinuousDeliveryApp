FROM java:8-jdk
MAINTAINER lucas <lucas.ganyu.li@accenture.com>

CMD java -jar ContinuousIntegrationAndContinuousDeliveryApp.jar
# Add the service itself
ADD target/ContinuousIntegrationAndContinuousDeliveryApp-0.0.7-SNAPSHOT.jar /data/ContinuousIntegrationAndContinuousDeliveryApp.jar
