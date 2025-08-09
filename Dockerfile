FROM python:3.11-slim

WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

# Render te inyecta PORT. Deja un default por si corres local.
ENV PORT=10000
EXPOSE 10000

# ⬇️ Usa shell para expandir ${PORT}
CMD ["sh", "-c", "gunicorn -w ${WEB_CONCURRENCY:-2} -b 0.0.0.0:${PORT:-10000} app:app"]
