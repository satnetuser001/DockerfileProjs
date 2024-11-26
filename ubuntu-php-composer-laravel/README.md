Создание контейнера с Laravel от имени root и от имени обычного пользователя.

За основу взять образ Ubuntu, установлен PHP, некоторые PHP библиотеки,
установлен Composer, установлен Laravel.

Побеждена ошибка "Composer не может установить Laravel от имени root" двумя способами:

1. Принудительное игнорирование Composer запуска от имени root (не желательно).
!Внимание. При использовании этого способа ОС контейнера не защищена от перезаписи её
файлов при установки библиотек и проектов при помощи Composer. Нарушение безопасности
Linux-системах можно игнарировать, т.к. используется контейнеризация.

-Создать образ на основе root.Dockerfile:
docker build -t laravel-root -f root.Dockerfile .

-Запустьть контейнер на 8000 порте:
docker run -it --rm -p 8000:8000 --name laravel-root laravel-root

-Если хочется побродить в системе контейнера
docker run -it --rm --entrypoint /bin/bash --name laravel-root laravel-root


2. Создания в контейнере пользователя без root прав:

-Создать образ на основе root.Dockerfile:
docker build -t laravel-user -f user.Dockerfile .

-Запустьть контейнер на 8000 порте:
docker run -it --rm -p 8000:8000 --name laravel-user laravel-user

-Если хочется побродить в системе контейнера
docker run -it --rm --entrypoint /bin/bash --name laravel-user laravel-user



Имя текущего пользователя Linux:
whoami

Часовой пояс системы:
date +"%Z %z"



P.S.

Роль COMPOSER_ALLOW_SUPERUSER=1 для Composer в root.Dockerfile:
По умолчанию Composer запрещает выполнение своих команд от имени
суперпользователя (root) из соображений безопасности.
Эта переменная окружения сообщает Composer, что запуск под root допустим.

Роль ENV TZ=Europe/Kyiv для PHP в Dockerfile:
Используемая в Linux и Unix-системах для определения часового пояса.
Она позволяет системе и приложениям внутри контейнера понимать, в каком часовом поясе они работают.
Это удобно в Docker, так как вы можете избежать интерактивного выбора часового пояса во время установки пакетов, например PHP.