FROM postgis/postgis:16-3.4

RUN apt-get update && apt-get install -y \
	git \
	make \
	curl \
	ca-certificates \
	gcc \
	build-essential \
	libpq-dev \
	postgresql-server-dev-16

RUN cd /tmp && git clone --branch v0.7.4 https://github.com/pgvector/pgvector.git
RUN cd /tmp/pgvector && make && make install
