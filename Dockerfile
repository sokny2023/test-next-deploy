# Use official Node.js image
FROM node:18-alpine

# Set working directory inside the container
WORKDIR /app

# Install dependencies first
COPY package.json package-lock.json ./
RUN npm install

# Copy all project files into the container
COPY . .

# Build the Next.js project
RUN npm run build

# Expose port 3000
EXPOSE 3000

# Start the application
CMD ["npm", "run", "start"]
