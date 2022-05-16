#Depends on node version
FROM node:16
#Work Directory 
WORKDIR /app
#Relative to work directory (eg. /app)
COPY package.json .
ARG NODE_ENV
RUN if [ "$NODE_ENV" = "development" ]; \
    then npm install; \
    else npm install --only=production; \
    fi
COPY . ./
ENV PORT 3000
EXPOSE $PORT
CMD ["node", "index.js"]
