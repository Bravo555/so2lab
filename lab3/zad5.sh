#!/usr/bin/env bash
#
# Systemy operacyjne 2 – laboratorium nr 3
#
# Celem zajęć jest pogłębienie wiedzy na temat struktury systemu plików,
# poruszania się po katalogach i kontroli uprawnień w skryptach powłoki.
# Proszę unikać wykorzystywania narzędzia `find` w ramach bieżących zajęć.
#
# Nie przywiązujemy wagi do środowiska roboczego – zakładamy, że jego pliki,
# inne niż te podane wprost w treści zadań, mogą ulec zmianie, a przygotowane
# rozwiązania nadal powinny działać poprawnie (robić to, o czym zadanie mówi).
#
# Wszystkie chwyty dozwolone, ale ostatecznie w wyniku ma powstać tylko to,
# o czym mowa w treści zadania – tworzone samodzielnie ewentualne tymczasowe
# pliki pomocnicze należy usunąć.
#

#
# Zadanie 5.
# Plik `dane/twardziel` stanowi dowiązanie twarde do pewnych plików z katalogu
# `dane/icao/`. Proszę odnaleźć które to pliki i wyświetlić ich nazwy, każdą
# w osobnej linii.
#

# pierwszy pomysl: wziac inode twardziela i znalezc pliki z takim samym inode
# numerem. widocznie na tyle common case ze w find jest flaga -samefile
#   find dane/icao -samefile dane/twardziel -exec basename {} \;
#
# Bez finda bedzie troche bardziej verbose:
#   inode=$(stat dane/twardziel --printf="%i")
#   ...
#
# Na szczescie test w bashu ma opcje -ef ktora sprawdza czy inody operandow sa
# takie same.

for f in dane/icao/*; do [ dane/twardziel -ef "$f" ] && basename "$f" ; done
