# Usamos una imagen oficial de Go para compilar
FROM golang:1.19-alpine AS builder

# Establecemos directorio de trabajo
WORKDIR /app

# Copiamos los archivos de go.mod y go.sum
COPY go.mod go.sum ./

# Descargamos dependencias (si las hubiera)
RUN go mod download

# Copiamos el resto del código
COPY . .

# Compilamos en modo release
RUN go build -o concurrencyTest main.go

# Segunda etapa: imagen final más pequeña
FROM alpine:3.17

WORKDIR /app

# Copiamos el binario desde la etapa de compilación
COPY --from=builder /app/concurrencyTest /app/

# Ejecutamos la aplicación
CMD ["./concurrencyTest"]
