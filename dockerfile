# 1. Usamos una imagen oficial de Python optimizada y liviana
FROM python:3.10-slim

# 2. Evita que Python escriba archivos .pyc en el disco y asegura que los logs salgan directo a la consola
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# 3. Definimos el directorio de trabajo dentro del contenedor
WORKDIR /app

# 4. Copiamos el archivo de requerimientos
COPY requirements.txt .

# 5. Instalamos las dependencias sin guardar la caché de pip para reducir el tamaño de la imagen
RUN pip install --no-cache-dir -r requirements.txt

# 6. Copiamos todo el código fuente del microservicio
COPY . .

# 7. Exponemos el puerto en el que Flask está configurado para escuchar
EXPOSE 8082

# 8. Comando para ejecutar la aplicación (apuntando a 0.0.0.0 para que sea accesible en la red de la VPC)
CMD ["python", "app.py"]