FROM nginx:alpine

# 删除默认配置
RUN rm /etc/nginx/conf.d/default.conf

# 复制 Gate 505 Nginx 配置
COPY nginx.conf /etc/nginx/conf.d/site.conf

# 复制静态文件
COPY . /usr/share/nginx/html/

# 清理不需要的文件
RUN rm -f /usr/share/nginx/html/Dockerfile \
          /usr/share/nginx/html/nginx.conf \
          /usr/share/nginx/html/railway.json \
          /usr/share/nginx/html/_logo_b64.txt

EXPOSE 8080
CMD ["nginx", "-g", "daemon off;"]
