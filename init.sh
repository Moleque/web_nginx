#!/bin/sh
sudo pip3 install --upgrade django==2.0.7

sudo ln -sf /home/box/web/etc/nginx.conf /etc/nginx/sites-enabled/default

sudo /etc/init.d/nginx restart

sudo gunicorn -c /home/box/web/etc/gunicorn.conf.py hello:app
sudo gunicorn -c /home/box/web/etc/gunicorn-django.conf.py ask.wsgi:application