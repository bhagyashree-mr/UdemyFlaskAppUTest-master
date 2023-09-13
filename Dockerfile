#Dockerfile
#docker build -t mysmartapp .
#docker run -d -p 5000:5000 mysmartapp

# FROM python:3.10-slim-buster
# ADD . /smartapp
# WORKDIR /smartapp
# RUN pip install --no-cache-dir -r requirements.txt
# CMD [ "python", "./run.py" ]

# Use a base image that includes Python and other essential tools
FROM python:3.10

# Set the working directory
WORKDIR /smartapp

# Copy your application code to the container
COPY . /smartapp

# Install build dependencies, including 'gcc'
RUN apt-get update && \
    apt-get install -y gcc && \
    rm -rf /var/lib/apt/lists/*

# Install Python packages from requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Specify the command to run your application
CMD [ "python", "./run.py" ]
