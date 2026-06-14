# ДЗ 3. Docker и bash

Данные хранятся на хосте (в общем а не внутри контейнера) через монтирование тома:
`docker run -v "$(pwd)/data:/data"`.

Источники которые я использовал НЕ в рамках лекции, которые требуются по условию задания:

- монтирование тома (bind mount): <https://docs.docker.com/engine/storage/bind-mounts/>
- условия в bash скрипте (`if`/`$1`): <https://www.gnu.org/software/bash/manual/bash.html#Conditional-Constructs>
