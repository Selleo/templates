```Dockerfile
FROM node:16-alpine AS builder

WORKDIR "/app"

COPY . .

RUN npm ci
RUN npm run build
RUN npm prune --production

FROM node:16-alpine AS production

WORKDIR "/app"
COPY --from=builder /app/package.json ./package.json
COPY --from=builder /app/package-lock.json ./package-lock.json
COPY --from=builder /app/dist ./dist
COPY --from=builder /app/node_modules ./node_modules
COPY --from=builder /app/entrypoint.sh ./entrypoint.sh

ENV PATH "/app/node_modules/.bin:$PATH"

ENTRYPOINT [ "/app/entrypoint.sh" ]
```
