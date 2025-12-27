#!/bin/bash

# 1. Полная очистка
docker compose down -v

# 2. Запуск базы данных
docker compose up -d db

echo "Ждем, пока MySQL создаст базу и пользователя..."
# Ждем именно момента 'ready for connections' в логах
until docker compose logs db | grep -q "ready for connections"; do
  sleep 2
  echo "MySQL все еще настраивается..."
done

# 3. Теперь запускаем всё остальное
docker compose up -d --build

# 4. На всякий случай рестартуем fastapi, чтобы он точно увидел готовую базу
docker compose restart fastapi

echo "Система готова!"
sleep 2
curl http://localhost:8090