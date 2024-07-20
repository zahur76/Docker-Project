# DOCKER MINI PROJECT 2

Create a minimal Django project and deploy using Docker + Apache2 reverse proxy + mod_wsgi + Gunicorn

- Run following commands in container:

    ```service apache2 start```

    ```a2dissite 000-default```

    ```a2ensite webapp```

    ```service apache2 reload```

Notes:
- Ensure .env file is created at project root with SECRET_KEY
