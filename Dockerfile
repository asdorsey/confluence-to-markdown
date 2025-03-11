FROM node:23-bookworm

WORKDIR /app

RUN apt-get update && \
    apt-get install -y pandoc && \
    apt-get clean

ADD bin/ ./bin/
ADD src/ ./src/
ADD test/ ./test/
ADD package.json LICENSE README.md .

RUN npm install

VOLUME /source
VOLUME /target

CMD ["npm", "run", "start", "/source", "/target"]
