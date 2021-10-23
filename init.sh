#!/bin/sh
sudo pip3 install --upgrade django==2.0.7

sudo ln -sf /home/box/web/etc/nginx.conf /etc/nginx/sites-enabled/default

sudo /etc/init.d/nginx restart 
# sudo /etc/init.d/gunicorn restart

sudo ln -sf /home/box/web/etc/gunicorn-django.conf /etc/gunicorn.d/gunicorn-django.py
sudo ln -sf /home/box/web/etc/gunicorn.conf /etc/gunicorn.d/gunicorn.py

sudo gunicorn -c /home/box/web/etc/gunicorn-django.conf hello:app
sudo gunicorn -c /home/box/web/etc/gunicorn-django.conf ask.wsgi:application