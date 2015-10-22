FROM java:7-jre

#ENV http_proxy http://username:password@yourproxy.com:1234
#ENV https_proxy http://username:password@yourproxy.com:1234

ENV TZ Australia/Sydney
ENV CATALINA_HOME /usr/local/tomcat
ENV PATH $CATALINA_HOME/bin:$PATH
RUN mkdir -p "$CATALINA_HOME"
WORKDIR $CATALINA_HOME

ENV TOMCAT_MAJOR 6
ENV TOMCAT_VERSION 6.0.44
ENV TOMCAT_TGZ_URL https://www.apache.org/dist/tomcat/tomcat-$TOMCAT_MAJOR/v$TOMCAT_VERSION/bin/apache-tomcat-$TOMCAT_VERSION.tar.gz

RUN set -x \
	&& curl -fSL "$TOMCAT_TGZ_URL" -o tomcat.tar.gz \
	&& curl -fSL "$TOMCAT_TGZ_URL.asc" -o tomcat.tar.gz.asc \
	&& tar -xvf tomcat.tar.gz --strip-components=1 \
	&& rm bin/*.bat \
	&& rm tomcat.tar.gz*

ENV CONFIGURATION_HOME artifacts/configuration

COPY $CONFIGURATION_HOME/context.xml $CATALINA_HOME/conf/context.xml
COPY $CONFIGURATION_HOME/tomcat-users.xml $CATALINA_HOME/conf/tomcat-users.xml
COPY $CONFIGURATION_HOME/setenv.sh $CATALINA_HOME/bin/setenv.sh
COPY $CONFIGURATION_HOME/lib $CATALINA_HOME/lib

ENV SCRIPT_HOME artifacts/scripts
COPY $SCRIPT_HOME/start.sh $CATALINA_HOME/bin/start.sh

WORKDIR $CATALINA_HOME/bin
EXPOSE 8080
EXPOSE 8000
CMD /usr/local/tomcat/bin/start.sh
