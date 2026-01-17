#!/bin/bash
set -eux

BINARY="usr/local/bin/findmax"

if [ ! -f "$BINARY" ]; then
  echo "Ошибка: бинарный файл не найден по пути $BINARY"
  exit 1
fi

INPUT="10
123
-200
445
667
56
7987
819
911
312
1048
"

EXPECTED="Максимальный элемент массива: 7987"

RAW_OUTPUT=$(echo "$INPUT" | "$BINARY")

VALUE=$(echo "$RAW_OUTPUT" | sed 's/.*Максимальный элемент массива: //')

RESULT="Максимальный элемент массива: $VALUE"

if [ "$RESULT" = "$EXPECTED" ]; then
  echo "Тест пройден успешно"
else
  echo "Тест не пройден"
  echo "Ожидалось:"
  echo "$EXPECTED"
  echo "Получено:"
  echo "$RESULT"
  exit 1
fi

