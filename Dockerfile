FROM node:alpine

WORKDIR /opt/app
RUN chown -R node:node /opt/app
COPY --chown=node:node ./node-plaid-playground/package*.json /opt/app/

USER node
RUN npm install

COPY --chown=node:node ./node-plaid-playground/index.js ./
COPY --chown=node:node ./.env ./

EXPOSE 8000
ENTRYPOINT ["node-plaid-playground"]
CMD ["index.js"]
