#!/bin/sh
sudo pip3 install --upgrade django==2.0.7

sudo ln -sf /home/box/web/etc/nginx.conf /etc/nginx/sites-enabled/default

sudo /etc/init.d/nginx restart 
# sudo /etc/init.d/gunicorn restart

sudo ln -sf /home/box/web/etc/gunicorn-django.conf.py /etc/gunicorn.d/gunicorn-django.py

# sudo gunicorn -c /home/box/web/etc/gunicorn.conf hello:app &
sudo gunicorn -c /etc/gunicorn.d/gunicorn-django.py ask.ask.wsgi:application