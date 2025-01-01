# Start from the official Nginx image
FROM nginx:alpine

# Copy the HTML and CSS files into the default nginx public folder
COPY index.html /usr/share/nginx/html/
COPY style.css /usr/share/nginx/html/

# Expose port 80 (not strictly necessary in newer Docker versions, but good practice)
EXPOSE 80

# Nginx will run automatically with the default configuration