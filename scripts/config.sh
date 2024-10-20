#!/usr/bin/bash

# Пытается найти эмулятор терминала
TERMINAL="${TERMINAL:-$(command -v alacritty || command -v konsole || command -v gnome-terminal || command -v xterm)}"

# Проверяет, найден ли эмулятор
if [ -z "$TERMINAL" ]; then
    echo -e "\e[1;94m::\e[0m \e[31mОшибка:\e[0m Не удалось найти эмулятор терминала."
    exit 1
fi

# Проверяет, что Git установлен
if ! command -v git &>/dev/null; then
    echo -e "\e[31mОшибка:\e[0m Git не установлен."
    exit 1
fi

# Проверяет, что находится в Git-репозитории
if ! git rev-parse --is-inside-work-tree &>/dev/null; then
    echo -e "\e[31mОшибка:\e[0m Не найден Git-репозиторий."
    exit 1
fi

# Определяет корневую директорию репозитория
REPO_ROOT="$(git rev-parse --show-toplevel)"