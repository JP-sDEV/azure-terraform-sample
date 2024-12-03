# Use a base image with Node.js
FROM node:18-alpine

# Set the working directory in the container
WORKDIR /app

# Copy the app's package.json and install dependencies
COPY app/package.json /app/package.json
COPY app/package-lock.json /app/package-lock.json
RUN npm install --production  # Install production dependencies (app dependencies)

# Now copy the root-level package.json to handle testing dependencies
COPY package.json /package.json
COPY package-lock.json /package-lock.json
RUN npm install --only=dev  # Install development dependencies (test dependencies)

# Copy the app code into the container
COPY app /app

# Set the working directory to the app folder
WORKDIR /app

# Expose the port for the app (default for Express is 3000)
EXPOSE 3000

# Command to start the app
CMD ["npm", "start"]
