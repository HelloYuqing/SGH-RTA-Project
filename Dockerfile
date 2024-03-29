# This file defines the Docker container that will contain the Flask app.

# From the source image
FROM python:3.8-slim


# Identify maintainer
LABEL maintainer = "calbon@wikimedia.org"

# Set the default working directory
WORKDIR /app/

#RUN apt-get update
#RUN apt-get -y install gcc
#RUN gcc g++ make python3-dev

# Copy requirements.txt outside the container
# to /app/ inside the container
COPY requirements.txt /app/

RUN pip3 install --no-cache-dir -r ./requirements.txt


# Copy app.py and__init__.py outside the container
# to /app/ inside the container
COPY app.py __init__.py /app/

# Copy templates folder outside the container
# to /app/ inside the container
ADD templates /app/templates

# Expose the container's port 3333
EXPOSE 5000

# When the container starts, run this
ENTRYPOINT python ./app.py
