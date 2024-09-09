# Use official Node.js image
FROM node:18-alpine AS builder

# Set working directory inside the container
WORKDIR /app

# Install dependencies
COPY package.json package-lock.json ./
RUN npm install

# Copy all project files
COPY . .

# Build the Next.js project
RUN npm run build

# Run production environment
FROM node:18-alpine
WORKDIR /app
COPY --from=builder /app ./

# Expose port
EXPOSE 3000

# Start the application
CMD ["npm", "run", "start"]
