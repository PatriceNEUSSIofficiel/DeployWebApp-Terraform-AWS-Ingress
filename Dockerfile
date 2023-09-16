FROM nginx:latest

COPY ./porfulio  /usr/share/nginx/html/

EXPOSE 80

# docker build -t my_site_web .

# docker run -d -p 8080:80 c1 my_site_web

# docker tag my_site_web patricehub/apache_deploy

# docker push patricehub/apache_deploy
