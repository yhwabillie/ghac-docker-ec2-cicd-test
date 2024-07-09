FROM node:20.11.1

# 하위에 app디렉토리를 생성함
RUN mkdir -p /app

# 생성한 app디렉토리를 work 디렉토리로 설정하겠다
WORKDIR /app

# 현재 루트에 있는 파일들을 모두 app폴더 안으로 복사하겠다
ADD . /app

# 기존 yarn.lock과 package-lock.json을 지우겠다
RUN rm yarn.lock || true
RUN rm package-lock.json || true

# yarn 실행 및 빌드
RUN yarn
RUN yarn build

ENV HOST 0.0.0.0
EXPOSE 3000

CMD [ "yarn", "start" ]

