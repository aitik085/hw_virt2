FROM python:3.12-slim

WORKDIR /app

# Установка зависимостей (если есть requirements.txt)
# RUN pip install --no-cache-dir -r requirements.txt 
# Если зависимостей нет в файле, установите их напрямую:
RUN pip install --no-cache-dir fastapi uvicorn mysql-connector-python

# Обязательное условие
COPY . .

# Запускаем приложение с помощью uvicorn, делая его доступным по сети
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "5000"] 