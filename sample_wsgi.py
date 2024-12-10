"""
WSGI config for pilot_select project.

It exposes the WSGI callable as a module-level variable named ``application``.

For more information on this file, see
https://docs.djangoproject.com/en/4.2/howto/deployment/wsgi/
"""

import os

import sys

# additonal settings if venv not located by apache server
# sys.path.insert(0,"/var/www/pilot_selection/venv/lib/python3.10/site-packages")
# sys.path.append("/var/www/pilot_selection")
# sys.path.append("/var/www/pilot_selection/app")

from django.core.wsgi import get_wsgi_application

os.environ.setdefault("DJANGO_SETTINGS_MODULE", "pilot_select.settings")

application = get_wsgi_application()
