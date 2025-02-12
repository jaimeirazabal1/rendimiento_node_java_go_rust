# Usamos una imagen base de Node.js
FROM node:14-alpine

# Creamos y establecemos el directorio de trabajo
WORKDIR /app

# Copiamos los archivos de configuración
COPY package.json /app

# Instalamos dependencias (aunque aquí no hay, npm install se queda vacío)
RUN npm install

# Copiamos el resto de los archivos
COPY concurrency-test.js /app

# Comando de inicio
CMD ["npm", "start"]
