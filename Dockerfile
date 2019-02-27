#  Create a new image from the base nodejs 8 image.
FROM debian:latest
# Patch it
#RUN yum -y update && yum clean all
RUN apt-get -y update && apt-get -y upgrade
# Install curl
#RUN yum install curl
RUN apt-get install -y curl
# Install xz decompression utilities
#RUN yum install -y xz-utils
RUN apt-get install -y xz-utils
# Create the target directory in the image
RUN mkdir -p /opt/
WORKDIR /opt/
# Copy the package.json inside the working 
RUN curl -L https://www.factorio.com/get-download/0.17.1/headless/linux64 | tar -xJ
# Open port 34197. This is the port that the factorio server uses
#EXPOSE 34197
# Set the created directory as the working directory
WORKDIR /opt/factorio/
ADD server-start.sh /opt/factorio/
# Start the server
CMD ["./server-start.sh"]