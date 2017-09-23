FROM rocketchat/base:8

ENV RC_VERSION 0.64.1

MAINTAINER lltcggie@gmail.com

RUN set -x \
 && curl -SLf "https://github.com/lltcggie/Rocket.Chat/releases/download/${RC_VERSION}-custom/Rocket.Chat.tar.gz" -o rocket.chat.tgz \
 && mkdir -p /app \
 && tar -zxf rocket.chat.tgz -C /app \
 && rm rocket.chat.tgz \
 && cd /app/bundle/programs/server \
 && npm install \
 && npm cache clear --force \
 && chown -R rocketchat:rocketchat /app

USER rocketchat

VOLUME /app/uploads

WORKDIR /app/bundle

# needs a mongoinstance - defaults to container linking with alias 'mongo'
ENV DEPLOY_METHOD=docker \
    NODE_ENV=production \
    MONGO_URL=mongodb://mongo:27017/rocketchat \
    HOME=/tmp \
    PORT=3000 \
    ROOT_URL=http://localhost:3000 \
    Accounts_AvatarStorePath=/app/uploads

EXPOSE 3000

CMD ["node", "main.js"]
