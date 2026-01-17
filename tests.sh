#!/bin/bash
set -eux

BINARY="usr/local/bin/findmax"

if [ ! -f "$BINARY" ]; then
  echo "Ошибка: бинарный файл не найден по пути $BINARY"
  exit 1
fi

# Тестовый ввод:
# размер массива = 10
# далее 10 чисел, по одному в строке
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

# Ожидаемый вывод программы (без приглашений ко вводу)
EXPECTED="Max of array: 10"

# Запуск программы с передачей ввода
RESULT=$(echo "$INPUT" | "$BINARY" | sed '/Enter/d')

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

