# Base image
FROM python:3.13

# Install core OS dependencies
# - gcc: for psypcopg2-binary
# - git: for pre-commit
RUN apt-get update && \
    apt-get install -y gcc postgresql-client && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# This prevents Python from writing out pyc files
ENV PYTHONDONTWRITEBYTECODE 1

# This keeps Python from buffering stdin/stdout
ENV PYTHONUNBUFFERED 1
ENV PYTHONPATH "${PYTHONPATH}:/usr/src/project"
ENV TZ=UTC
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# Set app working directory
WORKDIR /app/

COPY ../requirements.txt .

# Установка зависимостей
RUN pip install --upgrade pip && \
    pip install -r requirements.txt

# Copy project files
COPY . .

RUN echo '#!/bin/sh\n\
export POSTGRES_USER=${POSTGRES_USER:-postgres}\n\
export POSTGRES_PASSWORD=${POSTGRES_PASSWORD}\n\
export POSTGRES_DB=${POSTGRES_DB:-hotel_test}\n\
export POSTGRES_HOST=${POSTGRES_HOST:-db}\n\
export POSTGRES_PORT=${POSTGRES_PORT:-5432}\n\
\n\
until pg_isready -h $POSTGRES_HOST -U $POSTGRES_USER -d $POSTGRES_DB; do\n\
  echo "Waiting for PostgreSQL..."\n\
  sleep 2\n\
done\n\
\n\
python init_db.py\n\
exec "$@"\n\
' > /entrypoint.sh && \
    chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "5000", "--reload"]

# EXPOSE 80
# CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "80"]