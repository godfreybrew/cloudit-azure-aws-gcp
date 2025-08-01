# Use the official Alpine Python runtime as the base image
FROM python:3.11-alpine3.18

# Set the maintainer label
LABEL maintainer="r3drun3"

# Set the working directory in the container
WORKDIR /app

# Copy app files into the container at /app
COPY cloudit.py requirements.txt /app/

RUN apk upgrade

# Upgrade pip to the latest version and install any needed packages specified in requirements.txt
RUN pip install --no-cache-dir --upgrade pip==23.3.1 && pip install --no-cache-dir -r requirements.txt


# Run the script when container launches
CMD ["python", "./cloudit.py"]

################################# EXAMPLES #################################
# example command to build the image locally:
# docker build -t cloudit:latest .

# example command to pull the image from github registry:
# docker pull ghcr.io/rooted-io/cloudit:0.0.8

# example command to run the container:
# docker run -it --rm -v /Users/rago/Desktop/personal/GITHUB/cloudit/cloudit/:/app/ -v /Users/rago/Desktop/personal/GITHUB/cloudit/cloudit/credentials:/app/credentials ghcr.io/rooted-io/cloudit:0.0.8
#############################################################################
