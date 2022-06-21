FROM node
WORKDIR /app
COPY ./*.tgz /app
RUN tar -xf *.tgz; ls -lrt
ENV SESSION_SECRET=abc123
WORKDIR /app/package
RUN npm install 
EXPOSE 9005
CMD ["node","server.js"]
