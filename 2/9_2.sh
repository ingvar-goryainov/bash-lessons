#!/bin/bash
# timed-input.sh

# TMOUT=3            бесполезно в сценариях

TIMELIMIT=3  # Три секунды в данном случае, но может быть установлено и другое значение

PrintAnswer()
{
  if [ "$answer" = TIMEOUT ]
  then
    echo $answer
  else       # Чтобы не спутать разные варианты вывода.
    echo "Ваше любимое растение $answer"
    kill $!  # "Прибить" ненужную больше функцию TimerOn, запущенную в фоновом процессе.
             # $! -- PID последнего процесса, запущенного в фоне.
  fi

}



TimerOn()
{
  sleep $TIMELIMIT && kill -s 14 $$ &
  # Ждать 3 секунды, после чего выдать sigalarm сценарию.
}

Int14Vector()
{
  answer="TIMEOUT"
  PrintAnswer
  exit 14
}

trap Int14Vector 14   # переназначить процедуру обработки прерывания от таймера (14)

echo "Ваше любимое растение? "
TimerOn
read answer
PrintAnswer


#  По общему признанию, это не очень хороший способ ограничения времени ожидания,
#+ однако опция "-t"команды "read" упрощает задачу.
#  См. "t-out.sh", ниже.

#  Если вам нужно что-то более элегантное...
#+ подумайте о написании программы на C или C++,
#+ с использованием соответствующих библиотечных функций, таких как 'alarm' и 'setitimer'.

exit 0

