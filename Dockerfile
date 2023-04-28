# Use an official Node.js base image
FROM node:14

# Set the working directory
WORKDIR /usr/src/app

# Copy package.json and package-lock.json (or pnpm-lock.yaml if you have it) into the working directory
COPY package.json ./
COPY package-lock.json ./

# Install pnpm locally in your project directory
RUN npm install pnpm

# Install project dependencies using pnpm
RUN npx pnpm install

# Copy the rest of your application code
COPY . .

# Set the user and group ownership of the working directory (optional, but can help with permission issues)
RUN chown -R node:node /usr/src/app

# Change to a non-root user (optional, but recommended for security)
USER node

# Expose the port your app runs on
EXPOSE 3000

# Start your application
CMD ["npm", "start"]

