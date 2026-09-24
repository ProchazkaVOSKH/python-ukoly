# Kalkulačka spropitného
print("Vítejte v kalkulačce spropitného!")

# vstup
ucet = float(input("Zadej celkovou částku účtu: "))
procento_spropitneho = int(input("Zadej výši spropitného v procentech: "))
pocet_lidi = int(input("Zadej počet lidí: "))

# výpočet
spropitne = ucet * procento_spropitneho / 100   # výpočet spropitného
celkova_suma = ucet + spropitne                 # výpočet celkové částky k zaplacení
podil = round(celkova_suma / pocet_lidi, 2)     # zaokrouhlení na 2 desetinná místa

# výstup
print(f"Každý člověk by měl zaplatit: {podil} Kč")
