# Specify base image
FROM node:18-alpine

# Create a working directory
WORKDIR /usr/app

# Copy the file into the container
COPY package.json ./

# Install dependencies
RUN npm install

# COPY the other files
COPY ./ ./

# Start the server
CMD ["npm", "start"]