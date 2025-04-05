# Hotel Backend API

Веб-приложение для управления отелем, построенное на FastAPI и PostgreSQL.

## 🚀 Технологии

- FastAPI
- PostgreSQL 16
- Docker & Docker Compose
- Pydantic
- Python 3.13

## 📋 Требования

- Docker Desktop (версия 25.0.2 или выше)
- Docker Compose (версия 2.24.3 или выше)
- Минимум 4 ГБ оперативной памяти
- 10 ГБ свободного места на диске
- `.env` файл с необходимыми переменными окружения

## 🛠 Установка и запуск

1. **Клонирование репозитория**

   ```bash
   git clone [URL репозитория]
   cd Hotel_backend
   ```

2. **Настройка окружения**
   - Скопируйте `.env.example` в `.env`
   - Заполните необходимые переменные окружения:

    ```
    POSTGRES_USER=your_user
    POSTGRES_PASSWORD=your_password
    POSTGRES_DB=your_db_name
    ```

3. **Запуск приложения**

   ```bash
   cd .deployment
   docker-compose up --build
   ```

## 🌐 Доступ к приложению

- API: <http://localhost:5000>
- Swagger UI: <http://localhost:5000/docs>
- ReDoc: <http://localhost:5000/redoc>
- База данных: localhost:5433

## 📚 API Endpoints

### 🔐 Аутентификация

- `POST /auth/login` - Вход в систему
- `POST /auth/register` - Регистрация нового пользователя

### 🏠 Управление номерами

- `GET /rooms` - Получение списка номеров
- `POST /rooms` - Создание нового номера
- `GET /rooms/{room_id}` - Получение информации о номере
- `PUT /rooms/{room_id}` - Обновление информации о номере
- `DELETE /rooms/{room_id}` - Удаление номера

### 📅 Бронирование

- `POST /bookings` - Создание бронирования
- `GET /bookings` - Получение списка бронирований
- `GET /bookings/{booking_id}` - Получение информации о бронировании
- `PUT /bookings/{booking_id}` - Обновление бронирования
- `DELETE /bookings/{booking_id}` - Отмена бронирования

## 🛑 Остановка приложения

```bash
docker-compose down
```

## 🔧 Устранение неполадок

### Docker

1. Проверьте, что Docker Desktop запущен
2. Проверьте подключение к интернету
3. Очистите кэш Docker:

   ```bash
   docker system prune -a
   ```

### База данных

1. Проверьте правильность настроек в файле `.env`
2. Убедитесь, что порт 5433 не занят
3. Проверьте логи:

   ```bash
   docker-compose logs db
   ```

### Backend

1. Проверьте логи:

   ```bash
   docker-compose logs backend
   ```

2. Проверьте доступность БД:

   ```bash
   docker-compose exec db pg_isready -U ${POSTGRES_USER}
   ```

## 💻 Разработка

- Hot-reload включен по умолчанию
- Все файлы монтируются в контейнер через volume
- Изменения в коде сразу отражаются в работающем контейнере
- База данных сохраняет данные между перезапусками

## 📝 Примечания

- База данных доступна по порту 5433 (внешний) -> 5432 (внутренний)
- API документация доступна по адресу <http://localhost:5000/docs>
- Для разработки рекомендуется использовать Docker, так как все настройки уже предварительно сконфигурированы

## 📄 Лицензия

[Указать лицензию]

## 📞 Контакты

[Контактная информация]
