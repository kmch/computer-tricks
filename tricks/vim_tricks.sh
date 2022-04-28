# RELOAD/REFRESH FILE
:edit
##

#
:%s/,/./g # replace commas with dots in all lines
:s/,/./g # as above but only in current line
# if our string contains / we have to write \/ (escape operator) instead of / in this string
# e.g. if look for path /usr/bin to replace it with ~ we would write:
:%s/\/usr\/bin/~/g
##


# To enable proper behavior of backspace key
# add:
set backspace=2
# to ~/.vimrc file
##

#Fix arrow keys that display A B C D on remote shell
1) Open Vim editor,
2) Get the path of your home directory by typing :echo $HOME
3) Check if you have .vimrc file in $HOME location,(if you dont have create it)
4) Add the following line line to .vimrc file
   set nocompatible
        or
     set nocp
##

# szybki podgląd pliku
shift+F3
## wyjście - F10

#
komentowanie wielu linii
1. Esc
2. Ctrl+V
3. zaznacz strzalkami blokowego
4. Shift+i
5. #
6. Esc
##

#
:f - pokaż nazwę pliku i liczbę wierszy
##


esc      - go into command ("normal") mode
 :q      - quit vim
 :q!     - quit vim without saving
 :wq     - write (save) and quit
 :x      - write and quit (shorter than :wq)
 
 :help   - vim manual
i        - switch to INSERT mode
i - Wstawianie tekstu przed kursorem.
a - Wstawianie tekstu za kursorem.
A - Wstawianie tekstu na końcu linii.
o - Wstawianie tekstu do nowej (następnej) linii.
O - Wstawianie tekstu do nowej (poprzedniej) linii
G - kursor na koniec pliku
gg - na początek pliku
esc, line_no, shift-g - go to line

:new - otwiera nowy plik
:split - dzieli ten sam plik na 2 oknami
:split inny_plik - otwiera inny_plik w podzielonym oknie
ctrl+w, w - przechodzi między oknami plików.
:n  -  edytuj następny otwarty plik
:N  -  edytuj poprzedni następny plik (albo :p, :prev dla innych wersji vima)

:set nu  -  numeracja wierszy
:set nu! -  wyłączenie numeracji
:n       -  przesuwa kursor do wiersza n - tego (:12 - Przesuwa kursor do wiersza 12)
ctrl+o   -  przesuwa kursor do ostatniego położenia. Można wrócić 100 kroków wstecz,         
            nawet chyba do poprzednich plików!
ctrl+i   -  to samo ale wprzód
            
u        - undo
ctrl+r   - redo
r        - czeka na znak, na który zamieni znak znajdujący się pod kursorem
ctrl+v   - tryb zaznaczania blokowego

(wewnątrz vima - vim buffer)
x        - wytnij/usuń
y        - kopiuj
p        - wklej
(do schowka systemowego - UWAGA!!! TRZEBA BYĆ W TRYBIE WPISYWANIA ('i'))
[wytnij nie działa]
ctrl+shift+c  -  kopiuj
ctrl+shift+v  -  wklej

V       - selects entire lines 
v       - selects range of text
ctrl+v  - selects columns


dd - Usunięcie całego wiersza niezależnie od położenia kursora.

/nazwa, enter    -   szuka nazwy 
?nazwa, enter    -   to samo, tylko od końca pliku
/, enter         -   nastepne znalezione
n                -   następne znalezione
N                -   poprzednie znalezione
