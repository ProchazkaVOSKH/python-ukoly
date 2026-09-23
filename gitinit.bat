@echo off
:: Nastavení kódování pro správné načtení jména z domény
chcp 852 > nul

:: Odskok do lokálního adresáře (vyhne se chybám na síťových discích)
pushd %TEMP%

:: Získání jména z AD (používáme maskování diakritiky pro stabilitu)
set FULLNAME=
for /f "tokens=3,*" %%a in ('net user %USERNAME% /domain ^| findstr /R /C:"p..jmen."') do set FULLNAME=%%b

:: Pokud net user selže, použije se login
if "%FULLNAME%"=="" set FULLNAME=%USERNAME%

:: Přepnutí na UTF-8 pro zápis do konfigurace Gitu
chcp 65001 > nul

:: Nastavení Gitu bez výpisu chyb (2>nul)
git config --global user.name "%FULLNAME%" 2>nul
git config --global user.email "%USERNAME%@student.voskh.cz" 2>nul

:: Volitelné: Oprava zobrazení českých názvů souborů v Gitu
git config --global core.quotepath false 2>nul

:: Návrat do původního adresáře
popd

:: Konec bez čekání na klávesu
git config user.name
git config user.email
pause