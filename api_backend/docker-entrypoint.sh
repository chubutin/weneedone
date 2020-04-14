#!/bin/sh
set -e
flask db upgrade
gunicorn -c config.py -b 0.0.0.0:5000 wsgi:app