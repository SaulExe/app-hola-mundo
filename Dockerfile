# Imagen base
FROM python:3.9-slim

# Crear directorio
WORKDIR /app

# Copiar archivos
COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt
COPY . .

# Exponer el puerto
EXPOSE 5000

# Comando para iniciar la app
CMD ["python", "app.py"]
