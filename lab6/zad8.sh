#!/usr/bin/env bash
#
# Systemy operacyjne 2 – laboratorium nr 6 – semestr letni 2020/2021
#
# Celem zajęć jest zapoznanie się z możliwościami narzędzia awk.
#
# Tradycyjnie nie przywiązujemy zbyt dużej wagi do środowiska roboczego.
# Zakładamy, że format i układ danych w podanych plikach nie ulega zmianie,
# ale same wartości, inne niż podane wprost w treści zadań, mogą ulec zmianie,
# a przygotowane zadania wciąż powinny działać poprawnie (robić to, co trzeba).
#
# Wszystkie chwyty dozwolone, ale w wyniku ma powstać tylko to, o czym jest
# mowa w treści zadania – nie generujemy żadnych dodatkowych plików pośrednich.
# Większość rozwiązań powinno sprowadzić się do jednego, zmyślnego wywołania
# programu `awk` z odpowiednimi argumentami.
# 
#

#
# Zadanie 8.
#
# Plik `dodatkowe/lipsum.txt` zawiera przykładowy tekst z generatora
# http://lipsum.pl/. Używając programu awk, proszę przygotować narzędzie,
# które rozbije tekst w podanym pliku wejściowym w taki sposób, aby każda
# linia miała mniej niż 80 znaków (przy czym staramy się zmakymalizować
# liczbę znaków w każdej linii jak to możliwe). Jako wynik programu wyświetlić
# tekst po przekształceniu.
#

awk '
    {
        currcolumn = 0;
        for(i=1; i <= NF; i++) {
            currlen = length($i);

            if(currcolumn + currlen > 80) {
                printf "\n" $i " ";
                currcolumn = currlen + 1;
            }
            else {
                printf $i " ";
                currcolumn += currlen + 1;
            }
        }
    }

' dodatkowe/lipsum.txt

    # {
    #     rest = $0;
    #     lastword = 0;
    #     currlinelen = length;

    #     while(rest != "") {
    #         if(currlinelen > 80) {
    #             lastword += 1;
    #             currlen = 0;
    #             for(i=0; i <= NF; i++) {
    #                 currlen = index(rest, $i)
    #                 if(currlen > 80) {
    #                     break;
    #                 }
    #                 lastword = i;
    #             }
    #         }

    #         for(i=0; i <= lastword; i++) printf $i " ";
    #         print "";

    #         breakpoint = index(rest, $lastword) - 1;
    #         currlinelen = currlinelen - breakpoint;

    #         substr(rest, breakpoint)

    #         for(i=lastword; i <= NF; i++) printf $i " ";
    #         print "";
    #     }
    # }
