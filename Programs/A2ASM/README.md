"Anw01" Die Speicheradresse von VariableA wird in das Register R0 geladen.
"Anw02" Es wird auf die Speicheradresse zugegriffen, auf die R0 zeigt. Dort wird das niederwertigste Byte (0xef, wegen Little-Endian) gelesen und in R2 gespeichert.
"Anw03" Es wird auf die Adresse R0+1 zugegriffen. Dort liegt das höchstwertige Byte 0xbe (zweite Teil von 0xbeef), das in R3 geladen wird.
"Anw04" LSL verschiebt den Wert in R2 um acht Bit nach links.
"Anw05" orr verknüpft die Werte in R2 und R3 durch or und fügt die beiden Bytes zusammen.
"Anw06" Der Wert in R2 wird an die Adresse geschrieben, auf die R0 zeigt, dadurch werden beide Bytes von VariableA überschrieben.
"Anw07" Der konstante Wert 0xaffe wird direkt in R5 geladen, ohne Speicherzugriff. 
"Anw08" Der Wert in R5 wird an die Adresse geschrieben, auf die R0 zeigt, also in VariableA.
"Anw09" Die Speicheradresse von VariableB wird in R1 geladen.