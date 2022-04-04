#!/usr/bin/env bash
#
# Systemy operacyjne 2 – laboratorium nr 3 – semestr letni 2020/2021
#
# Skrypt tworzy środowisko robocze ze wszystkimi niezbędnymi plikami
# na potrzeby realizacji zadań z danego tematu zajęć laboratoryjnych.
#
# Uwaga! Istniejące pliki i katalogi środowiska zostaną usunięte!
#

#
# Czyszczenie
#
if [ -e  'aaa' ] || [ -e 'bbb' ] || [ -e 'ccc' ] || [ -e 'ddd' ]; then
    rm -rf 'aaa' 'bbb' 'ccc' 'ddd'
fi


#
# Bazowa struktura + zadanie 4
#
mkdir -p 'aaa' 'bbb' 'ccc' 'ddd'


#
# Zadanie 1 i 2
#
echo 'Lorem ipsum dolor sit amet enim. Etiam ullamcorper.' > aaa/podstawa


#
# Zadanie 3
#
(
    cd aaa

    let numer=0

    for plik in alfa bravo charlie delta echo foxtrot hotel india juliett; do
        numer=$(( numer + 7 ))
        echo "${numer}" > "${plik}"
    done

    chmod +x alfa charlie delta echo hotel india
    echo 'bad-file' > ../ddd/delta
    echo 'nie-ruszaj-mnie' > ../ddd/india
)


#
# Zadanie 5, 6, 8 i 9
#
(
    cd ccc

    for plik in alfa bravo charlie delta echo foxtrot hotel india juliett; do
        ln -s "../aaa/${plik}" "${plik}"
    done
    ln -s 'aaa/delta' distractor
    ln -sf 'aaa/bravo' bravo
    ln -sf '../aaa/eko' echo
    ln -sf 'aaa/hotel' hotel
    ln -sf 'aaa/hotel' india

    ln -s '../aaa/echo' impostor
    ln -s '../aaa/echo' sus
    ln -s '../aaa/echo' one-and-only
    ln -s '../aaa/bravo' legit

    ln -s 'cezary' cezary
    ln -s 'cyprian' imię
    ln -s '../bbb/barbara' bartek
    ln -s 'bbb/filipa' bezimienna
    ln -s 'bbb/edward' edek
)


#
# Zadanie 7
#
(
    cd bbb

    ln -s 'some-file' adam
    ln -s '/some/other/file/.././.' alina
    ln -s '/this/./is/../yet-another-file' bartek
    ln bartek barbara
    ln -s '/I/am/super/path' cyprian
    ln cyprian celina
    ln -s 'not-this-one' dawid
    ln -s '/./../is/./../this/./.././../overkill' daria
    ln -s '../aaa/echo' edward
    ln -s '../aaa/echo' ewelina
    ln -s 'edward' filip
    ln -s '/etc/passwd' frania
)


#
# Zadanie 10
#
echo 'Defined or undefined' > ddd/wanted
ln ddd/wanted bbb/kopia
ln ddd/wanted bbb/zapasowa
ln ddd/wanted bbb/tego
ln ddd/wanted bbb/pliku
ln ddd/wanted ccc/.hidden
cp ddd/wanted bbb/distractor
cp ddd/wanted bbb/backup
echo 'sin² + cos² = 1' > bbb/cosik
echo '1+2+3+4+... = -1/12' > ccc/matematycznie
echo '1-1+1-1+1-1+... = 1/2' > ccc/tajne\ dane
