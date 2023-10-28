# Use the official Ubuntu image as the base image
FROM ubuntu:latest

# Update and install essential packages
RUN apt-get update && \
    apt-get install -y python3.10 python3-pip

# Set the default Python version to 3.10
RUN update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.10 1

# Install pip for Python 3.10
RUN python3 -m pip install --upgrade pip

# Set the working directory
WORKDIR /app


WORKDIR /app

COPY requirements.txt ./blocker/

RUN pip install -r ./blocker/requirements.txt

COPY . ./blocker/

# Start a bash shell by default when the container is run
CMD ["/bin/bash"]

