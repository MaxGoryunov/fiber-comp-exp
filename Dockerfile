# Используем последнюю версию PHP с CLI
FROM php:8.4-cli

# Устанавливаем необходимые расширения PHP и инструменты
RUN apt-get update && apt-get install -y \
    git \
    unzip \
    libzip-dev \
    && docker-php-ext-install zip

# Устанавливаем Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Устанавливаем Xdebug для отладки
RUN pecl install xdebug && docker-php-ext-enable xdebug

# Настройка рабочей директории
WORKDIR /var/www

# Копируем конфигурацию PHP (если нужно)
# COPY docker/php/conf/ /usr/local/etc/php/conf.d/