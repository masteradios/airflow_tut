FROM apache/airflow:2.9.1-python3.9
USER root
# Install Python dependencies
COPY requirements.txt /requirements.txt
RUN pip3 install --upgrade pip
RUN pip3 install --no-cache-dir -r /requirements.txt

# Install Airflow providers and Kafka
RUN pip3 install apache-airflow-providers-apache-spark apache-airflow-providers-amazon kafka-python

# Install system dependencies

RUN apt-get update && \
    apt-get install -y gcc python3-dev openjdk-17-jdk && \
    apt-get clean

# # Set JAVA_HOME environment variable
# #ENV JAVA_HOME /usr/lib/jvm/java-17-openjdk-amd64

# # Set Airflow UID for proper permissions
# ENV AIRFLOW_UID=1000

# # Copy DAGs and plugins into the container
# COPY ./dags /opt/airflow/dags
# COPY ./plugins /opt/airflow/plugins

# # Initialize the Airflow database
# RUN airflow db init

# # Create an Airflow admin user
# RUN airflow users create \
#   --username admin \
#   --firstname admin \
#   --lastname admin \
#   --role Admin \
#   --email admin@example.com \
#   --password admin