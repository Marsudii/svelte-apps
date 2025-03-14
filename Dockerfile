# 1. Gunakan Node.js 22.14.0 sebagai base image untuk build
FROM node:22.14.0-alpine AS builder

# 2. Set working directory
WORKDIR /app

# 3. Copy file package.json dan package-lock.json (jika ada)
COPY package*.json ./

# 4. Install dependensi
RUN npm install

# 5. Copy seluruh kode aplikasi ke dalam container
COPY . .

# 6. Build aplikasi Svelte untuk produksi
RUN npm run build

# 7. Gunakan kembali Node.js sebagai runtime tanpa perlu Nginx
FROM node:22.14.0-alpine

# 8. Set working directory
WORKDIR /app

# 9. Copy build artifacts from builder stage
COPY --from=builder /app/build ./build
COPY --from=builder /app/package*.json ./

# 10. Expose port (sesuaikan dengan port aplikasi, misalnya 3000)
EXPOSE 3000

# 11. Jalankan aplikasi dengan Node.js
CMD ["node", "build/index.js"]