# # Stage 1: Install Dependencies
# FROM node:18-alpine AS dependencies
# WORKDIR /app
# COPY package.json package-lock.json ./
# RUN npm install

# # Stage 2: Build Application
# FROM node:18-alpine AS builder
# WORKDIR /app
# COPY --from=dependencies /app/node_modules ./node_modules
# COPY . .
# RUN npm run build
# RUN npm install -g next  # Install 'next' globally

# # Stage 3: Final Image
# FROM node:18-alpine
# WORKDIR /app
# COPY --from=builder /app/.next ./.next
# COPY --from=builder /app/package.json ./
# COPY --from=builder /app/public ./public

# CMD ["npm", "run", "dev"]


FROM node:18-alpine

WORKDIR /app

COPY package.json  ./

COPY . .

RUN npm run build

COPY .next ./.next

CMD ["npm", "run", "dev"]






