# Etapa de construcción
FROM rust:1.69 as builder

WORKDIR /app

# Copiamos los archivos de proyecto
COPY Cargo.toml .
COPY . ./src

# Construimos el proyecto en modo release
RUN cargo build --release

# Etapa final: imagen mínima
FROM debian:bullseye-slim

WORKDIR /app
COPY --from=builder /app/target/release/rust-concurrency-test /app/concurrencyTest

CMD ["./concurrencyTest"]
