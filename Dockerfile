FROM php:8.4-cli

# 1. Установка системных зависимостей + Node.js 20 + npm
RUN apt-get update && apt-get install -y \
    git unzip libzip-dev curl gnupg \
    && curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key \
       | gpg --dearmor -o /usr/share/keyrings/nodesource.gpg \
    && echo "deb [signed-by=/usr/share/keyrings/nodesource.gpg] https://deb.nodesource.com/node_20.x nodistro main" \
       > /etc/apt/sources.list.d/nodesource.list \
    && apt-get update && apt-get install -y nodejs \
    && npm install -g npm@latest \
    && rm -rf /var/lib/apt/lists/*

# 2. Проверяем версии
RUN php -v && node --version && npm --version

# 3. Копируем файлы проекта
WORKDIR /var/www
COPY package.json ./
COPY commitlint.config.js ./

# 4. Устанавливаем зависимости, включая husky + commitlint
RUN npm install

# 5. Устанавливаем Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

WORKDIR /var/www
