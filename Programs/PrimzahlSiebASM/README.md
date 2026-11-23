1) Analyse der Aufgabestellung: In der Aufgabe sollen alle Primzahlen von 2 bis 1000 mit dem Sieb des Eratosthenes gefunden und gespeichert werden. Aufgeteilt ist nach „Teile und herrsche“ Prinzip, in den Teilfunktionen Sieb und Abspeichern. Vielfache einer kleinsten Primzahl wird ab kleinste Primzahl mal sich selbst gestrichen und die Schleife stoppt, sobald die kleinste Primzahl mal sich selbst größer als 1000 wird. Am Ende wird das Feld gelesen und in den Primzahlen gespeichert. 

2) Pseudocode: Sei kleinste Primzahl Pr; Sei 0 keine Primzahlen; Sei 1 potenzielle Primzahlen 
Teilfunktion: Sieb:
  1. Feld mit Index von 0 bis 1000 wird angelegt.
  2. 0 und 1 wird auf 0 und 2 bis 1000 auf 1.
  3. Pr = 2 setzen.
  4. Solange Pr*Pr <= 1000
Teilfunktion Abspeichern: Index auf den Beginn des Speicherort für Primzahlen. Falls Feld == 1, dann Wert an die Zieladresse schreiben.Zieladresse um 4 Bytes erhöhen.

3) Datentypen: DCB Für Wert, z.B 0 oder 1, der anzeigt ob es Primzahl ist oder nicht- für Zahlen von 0 bis 1000. Insgesamt 1001 Einträge, je 1 Byte. Die gefundenen Primzahlen (2 bis 1000) werden in 2 Bytes (Halfword) oder 4 Bytes (Word) pro Zahl gespeichert. 
