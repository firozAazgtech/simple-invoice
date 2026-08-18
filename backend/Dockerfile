FROM node:24-alpine

WORKDIR /app

COPY package*.json ./
# Full install (incl. devDependencies) on purpose: `npm run seed` uses
# ts-node against the TypeScript source at runtime, so ts-node/typescript
# need to stay available in the running container, not just at build time.
RUN npm ci

COPY . .
RUN npm run build
RUN chmod +x docker-entrypoint.sh

EXPOSE 3000

CMD ["./docker-entrypoint.sh"]
