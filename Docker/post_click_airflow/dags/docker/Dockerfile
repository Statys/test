FROM ubuntu:latest
RUN apt-get update
ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get install -y apt-utils
RUN apt-get install -y postgresql-client-common 
RUN apt-get install -y postgresql-client
RUN apt-get install -y telnet
RUN apt-get install -y clickhouse-client
#RUN rm -rf /var/lib/apt/lists/*
COPY sql_scripts/* /sql_scripts/
COPY bash_scripts/* /bash_scripts/
CMD ["bash", "/bash_scripts/init.sh"]
#CMD ["/bin/sh", "tail -F anything"]
#CMD ["/bin/bash", "tail -f /dev/null"]