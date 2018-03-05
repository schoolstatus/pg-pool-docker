FROM postgres:9.6

RUN apt-get update
RUN apt-get install -y postgresql-server-dev-9.6 curl build-essential libmemcached11 libmemcached-dev

RUN curl -L -o pg-pool.tgz 'http://www.pgpool.net/download.php?f=pgpool-II-3.7.2.tar.gz'
RUN tar xzvf pg-pool.tgz

WORKDIR /pgpool-II-3.7.2
RUN ./configure --with-memcached=/usr/include/libmemcached
RUN make
RUN make install
RUN ldconfig

RUN mkdir /var/run/pgpool
RUN chmod u+rw,g+rw,o+rw /var/run/pgpool
RUN mkdir /var/log/pgpool
RUN chmod u+rw,g+rw,o+rw /var/log/pgpool

ADD pgpool.conf /usr/local/etc/pgpool.conf
ADD start_pool.sh /tmp/start_pool.sh
RUN chmod +x /tmp/start_pool.sh
CMD /tmp/start_pool.sh
