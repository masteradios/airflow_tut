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
