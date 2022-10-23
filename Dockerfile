# Use Node Alpine as base image
ARG NODE_VERSION=16
FROM node:${NODE_VERSION}-alpine
LABEL maintainer="Ibnu Zamratul Iman <ibnu.z.iman@gmail.com>"

# Copy source and manifest files
COPY package*.json /usr/app/
COPY src /usr/app/

# Set pwd
WORKDIR /usr/app/

# Install production dependencies
RUN npm install elastic-apm-node --save
RUN npm install --only=production

# Run node app.js
CMD [ "node", "app.js" ]