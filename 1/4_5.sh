#!/bin/bash

# Команда вызова сценария должна содержать по меньшей мере 10 параметров, например
# ./scriptname 1 2 3 4 5 6 7 8 9 10
MINPARAMS=10

echo

echo "Имя файла сценария: \"$0\"."
# Для текущего каталога добавит ./
echo "Имя файла сценария: \"`basename $0`\"."
# Добавит путь к имени файла (см. 'basename')

echo

if [ -n "$1" ]              # Проверяемая переменная заключена в кавычки.
then
 echo "Параметр #1: $1"     # необходимы кавычки для экранирования символа #
fi

if [ -n "$2" ]
then
 echo "Параметр #2: $2"
fi

if [ -n "$3" ]
then
 echo "Параметр #3: $3"
fi

# ...


if [ -n "${10}" ]  # Параметры, следующие за $9 должны заключаться в фигурные скобки
then
 echo "Параметр #10: ${10}"
fi

echo "-----------------------------------"
echo "Все аргументы командной строки: "$*""

if [ $# -lt "$MINPARAMS" ]
then
  echo
  echo "Количество аргументов командной строки должно быть не менее $MINPARAMS !"
fi

echo

exit 0
