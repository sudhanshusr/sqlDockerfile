FROM ubuntu

MAINTAINER Amol Shende <amolsh@cybage.com>

ENV DEBIAN_FRONTEND noninteractive

ENV DB_USR root

ENV DB_PASWD root 

RUN apt-get update -qq && apt-get install -y mysql-server-5.5

ADD my.cnf /etc/mysql/conf.d/my.cnf

RUN chmod 664 /etc/mysql/conf.d/my.cnf

ADD run.sh /usr/local/bin/run

ADD Dump_test.sql Dump_test.sql

RUN chmod +x /usr/local/bin/run

VOLUME ["/var/lib/mysql"]

EXPOSE 3306

CMD ["/usr/local/bin/run"]
