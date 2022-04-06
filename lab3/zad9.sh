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
# Zadanie 9.
# Odszukać w katalogu `dane/` i jego bezpośrednich podkatalogach (uwzględnić
# tylko jeden poziom wgłąb) wszystkie wiszące dowiązania miękkie i podjąć próbę
# ich naprawy – zakładamy, że nazwy wskazywanych przez nie plików są poprawne,
# ale doszło do jakiegoś zamieszania w strukturze katalogów. Należy odszukać
# pasujących plików zwykłych, a jeśli takie istnieją – wyświetlić nazwę
# dowiązania, dwukropek i po spacji: najkrótszą poprawną ścieżkę względną
# do niego od istniejącego dowiązania (na przykład: bravo: ../icao/bravo).
#

shopt -s globstar

basedir=$(realpath .)

for file in dane/{*,*/*}; do
    if [ ! -e "$file" ]; then
        # echo -n "$file->"
        # readlink "$file"

        pushd "$(dirname "$file")" > /dev/null || exit

            for candidate in {*/*,../**}; do
                [ "$(realpath --relative-to="$basedir" "$(dirname -- "$candidate")")" == "$(dirname "$file")" ] && continue
                if [ "$(basename "$candidate")" == "$(basename "$file")" ]; then
                    # echo "$(realpath --relative-to="$basedir" "$(dirname "$candidate")") == $(dirname "$file")"
                    echo "$(basename "$file"): $candidate"
                    break
                fi
            done

        popd > /dev/null || exit
    fi
done
