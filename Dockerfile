FROM ubuntu:18.04

# Install apache2
RUN apt-get update && apt-get install -y \
  python3 \
  python3-dev \
  python3-pip \
  apache2 \
  libapache2-mod-wsgi-py3 \
  curl jq vim \
  && rm -rf /var/lib/apt/lists/*

# Install Flask
RUN pip3 install --upgrade pip
RUN pip3 install flask

# Copy over the apache2 server files
COPY ./apache2/* /

# Copy over the Flask app
COPY ./app/* /app/

# Create a WSGI VirtualServer for the Flask app (000 prefix to put it first)
COPY ./apache2/app.conf /etc/apache2/sites-available/000-app.conf
RUN a2ensite 000-app.conf

# Disable to main web server, so the Flask server serves everything
RUN a2dissite 000-default.conf

# Start the apache server and monitor the error log forever
WORKDIR /
CMD /apache2.start

