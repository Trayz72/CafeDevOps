# Use official Nginx base image
FROM nginx:alpine

# Remove default website
RUN rm -rf /usr/share/nginx/html/*

# Copy your static site into Nginx's public folder
COPY . /usr/share/nginx/html

# Expose port 80
EXPOSE 80

# Start Nginx in the foreground
CMD ["nginx", "-g", "daemon off;"]
