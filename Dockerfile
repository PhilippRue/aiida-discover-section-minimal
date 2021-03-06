FROM python:3.7

# Install discover section
ENV AIIDA_PATH /app/.aiida
ENV PYTHONPATH /app

# AiiDA profile vars
ENV AIIDA_PROFILE judit
ENV AIIDADB_ENGINE postgresql_psycopg2
ENV AIIDADB_PASS aiida
ENV AIIDADB_NAME judit
ENV AIIDADB_HOST host.docker.internal
ENV AIIDADB_BACKEND django
ENV AIIDADB_PORT 5432
ENV AIIDADB_REPOSITORY_URI file:///app/.aiida/repository/aiida-test
ENV AIIDADB_USER aiida
ENV default_user_email p.ruessmann@fz-juelich.de

# set workdir in container
WORKDIR /app

# install dependencies should be done here to use caching 
COPY test-app/requirements.txt .
RUN pip3 install -r requirements.txt

# copy files and directories
COPY test-app ./test-app
COPY prepare* ./
COPY data ./data

# prepare aiida config file and test data
RUN reentry scan -r aiida
RUN ./prepare_db_connection.sh
RUN verdi import data/KkrCalculation-nodes-53acc7b8a54857077284f1114ca72811.tar.gz

# finally copy serve-app script 
COPY ./serve-app.sh /opt/

# start bokeh server
EXPOSE 5006
CMD ["/opt/serve-app.sh"]
