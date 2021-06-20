# Реализация арифметики на языке TSG

Сборка и запуск через cabal.

Сама реализация в src/Arith.hs.

Пример:

```
*Main> tsgSum 5 7
12
*Main> tsgMult 4 6
24
```
Проверка обратимости сложения:

```
*Main> a = fromInt 6
*Main> b = fromInt 2
*Main> x = ([b, CVE 1], RESTR [])
*Main> ura sumProg x a
[([CVE 1 :-> CONS (ATOM "1") (CONS (ATOM "1") (CONS (ATOM "1") (CONS (ATOM "1") (ATOM "0"))))],RESTR [])]
*Main>
```
