;1.Teilfunktion Sieb: 
;Feld anlegen und 0 bis 1000 Index geben; 
;Initialisieren 2 bis 1000 so, dass man sieht, dass es potenzielle Primzahlen sind; 
;0 und 1 sind dagegen keine potentiellen Zahlen, daher mit anderen Zeichen markieren. 
;Man startet mit der kleinsten möglichen Primzahl, am Anfang 2. 
;Beim nächsten Versuch überprüft man, wo nicht durchgestrichen wird und bei der kleinstmöglichen Zahl wird wieder angefangen. 
;Danach wird Vielfache von diesen kleinsten möglichen Zahlen gestrichen. Bei 2 sind es z.B 4, 6, 8 usw. 
;Dies dauert so lange, bis Vielfache von der kleinstmöglichen Zahl 1000 überschreitet, dann wird der Durchlauf aufgehört und die nicht gestrichenen Zahlen als Primzahlen gespeichert. 

;2.Teilfunktion Abspeichern: 
;Von 2 bis 1000 durch das Feld gehen, falls es eine Primzahl ist, dann die Zahl speichern. 
