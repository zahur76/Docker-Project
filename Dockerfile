# For more information, please refer to https://aka.ms/vscode-docker-python
FROM ubuntu

USER root
USER root
RUN apt-get update
RUN apt install -y python-is-python3 && apt-get install -y python3-pip virtualenv
RUN apt-get install -y apache2 apache2-utils libapache2-mod-wsgi-py3
# Keeps Python from generating .pyc files in the container
ENV PYTHONDONTWRITEBYTECODE=1

# Turns off buffering for easier container logging
ENV PYTHONUNBUFFERED=1

# Create Virtualenv
ENV VIRTUAL_ENV=/venv
RUN virtualenv $VIRTUAL_ENV
ENV PATH="$VIRTUAL_ENV/bin:$PATH"

# Install dependencies:
COPY requirements.txt .
RUN pip install -r requirements.txt

# Creates a non-root user with an explicit UID and adds permission to access the /app folder
# For more info, please refer to https://aka.ms/vscode-docker-python-configure-containers
WORKDIR /var/www/app
COPY webapp /var/www/app

COPY webapp.conf /etc/apache2/sites-available

RUN echo "ServerName localhost" >> /etc/apache2/apache2.conf

RUN useradd -ms /bin/bash appuser && usermod -aG sudo appuser

# CMD apachectl -D FOREGROUND
CMD ["gunicorn", "--bind", "0.0.0.0:8000", "reverse_proxy.wsgi"]