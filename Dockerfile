FROM python:3.11-slim

WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

# Render expone un PORT; dale un default por si acaso
ENV PORT=10000
EXPOSE 10000

# Usa gunicorn y referencia el objeto WSGI "app" del módulo app.py
CMD ["gunicorn", "-w", "2", "-b", "0.0.0.0:${PORT}", "app:app"]
