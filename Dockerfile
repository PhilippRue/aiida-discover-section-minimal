FROM python:3.7

# Install discover section
ENV AIIDA_PATH /app/.aiida
ENV PYTHONPATH /app

# AiiDA profile vars
ENV AIIDA_PROFILE judit
ENV AIIDADB_ENGINE postgresql_psycopg2
ENV AIIDADB_PASS aiida
ENV AIIDADB_NAME judit
#ENV AIIDADB_HOST localhost
ENV AIIDADB_HOST host.docker.internal
ENV AIIDADB_BACKEND django
ENV AIIDADB_PORT 5432
ENV AIIDADB_REPOSITORY_URI file:///app/.aiida/repository/aiida-test
ENV AIIDADB_USER aiida
#ENV AIIDADB_USER ruess
ENV default_user_email p.ruessmann@fz-juelich.de

# set workdir in container
WORKDIR /app

# copy files and directories
COPY test-app ./test-app
COPY prepare_db_connection.sh ./

# install dependencies
RUN pip3 install -e test-app
RUN reentry scan -r aiida

# prepare aiida config file
RUN ./prepare_db_connection.sh

# finally copy serve-app script 
COPY ./serve-app.sh /opt/

# start bokeh server
EXPOSE 5006
CMD ["/opt/serve-app.sh"]
