FROM node
WORKDIR /app
COPY ./*.tgz /app
RUN tar -xf *.tgz; ls -lrt
WORKDIR /app/package
RUN npm install 
EXPOSE 9005
CMD ["node","backend/server.js"]
