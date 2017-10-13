FROM java:8-jdk
MAINTAINER lucas <lucas.ganyu.li@accenture.com>

CMD java -jar ContinuousIntegrationAndContinuousDeliveryApp.jar
# Add the service itself
ADD target/ContinuousIntegrationAndContinuousDeliveryApp.jar /data/ContinuousIntegrationAndContinuousDeliveryApp.jar
