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
# Zadanie 3.
# Odnaleźć w katalogu `dane/pierwiastki/` wszystkie wiszące dowiązania miękkie
# – to jest takie, które wskazują na elementy nieistniejące w systemie plików.
# Wyświetlić nazwy plików ze znalezionymi dowiązaniami, każdą w osobnej linii.
# Nie wyświetlać nic ponadto!
#

for f in dane/pierwiastki/*; do [ -L "$f" ] && [ ! -e "$f" ] && echo "$f"; done | xargs -n 1 basename
