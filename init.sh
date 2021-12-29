#!/bin/sh
sudo pip3 install --upgrade django==2.0.7

sudo ln -sf /home/box/web/etc/nginx.conf /etc/nginx/sites-enabled/default

sudo /etc/init.d/nginx restart

sudo gunicorn -c /home/box/web/etc/gunicorn.conf.py hello:app --bind=0.0.0.0:8080 &
sudo gunicorn -c ../etc/gunicorn-django.conf.py ask.wsgi:application --bind=0.0.0.0:8000