# 1️⃣ Base image
FROM node:18-alpine AS base
WORKDIR /app

# 2️⃣ Install dependencies (only package.json & lock first for caching)
COPY package*.json ./
RUN npm install --legacy-peer-deps

# 3️⃣ Copy all project files
COPY . .

# 4️⃣ Build the Next.js app
RUN npm run build

# 5️⃣ Production stage
FROM node:18-alpine AS runner
WORKDIR /app

ENV NODE_ENV=production

# Copy build output and dependencies from previous stage
COPY --from=base /app/public ./public
COPY --from=base /app/package*.json ./
COPY --from=base /app/.next ./.next
COPY --from=base /app/node_modules ./node_modules

EXPOSE 3000

# Run Next.js in standalone mode
CMD ["npm", "start"]
