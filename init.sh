sudo pip3 install --upgrade django==2.0.7

sudo ln -sf /home/box/web/etc/nginx.conf /etc/nginx/sites-enabled/default

sudo /etc/init.d/nginx restart 
sudo /etc/init.d/gunicorn restart
# sudo gunicorn -b 0.0.0.0:8000 hello:app

sudo gunicorn -c /home/box/web/etc/gunicorn.conf hello:wsgi_application
sudo gunicorn -c /home/box/web/etc/gunicorn-django.conf ask.wsgi:application