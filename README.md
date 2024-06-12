
# Dokumentacja projektu "Pyszne2.0"

## 1. Opis projektu
Aplikacja Pyszne jest systemem do zamawiania jedzenia online. Umożliwia użytkownikom przeglądanie menu restauracji, składanie zamówień oraz śledzenie statusu zamówienia. Platforma jest zaprojektowana tak, aby obsługiwać różne role użytkowników: klientów, kurierów oraz administratorów.

Klienci mogą przeglądać dostępne restauracje, wybierać dania z menu, składać zamówienia i śledzić ich status w czasie rzeczywistym. Kurierzy mają dostęp do specjalnego panelu, który umożliwia im zarządzanie przypisanymi zamówieniami, aktualizowanie statusu zamówień oraz przeglądanie historii dostaw. Administratorzy posiadają uprawnienia do zarządzania zawartością platformy - mogą dodawać, edytować i usuwać restauracje oraz zarządzać ich menu. Dzięki temu system jest w stanie efektywnie obsługiwać cały proces zamawiania i dostarczania jedzenia, zapewniając użytkownikom wygodę i kontrolę nad zamówieniami, a restauracjom i kurierom sprawną organizację pracy.

## 2. Analiza wymagań

### 2.1 Wymagania funkcjonalne

- **Rejestracja użytkowników:** System musi umożliwiać użytkownikom rejestrację poprzez podanie nazwy użytkownika, adresu e-mail i hasła.
- **Logowanie użytkowników:** System musi umożliwiać zalogowanie się zarejestrowanym użytkownikom przy użyciu adresu e-mail i hasła.
- **Przeglądanie restauracji:** Użytkownicy muszą mieć możliwość przeglądania listy dostępnych restauracji.
- **Przeglądanie menu restauracji:** Użytkownicy muszą mieć możliwość przeglądania menu wybranej restauracji.
- **Składanie zamówień:** Użytkownicy muszą mieć możliwość składania zamówień z menu wybranych restauracji.
- **Śledzenie statusu zamówienia:** Użytkownicy muszą mieć możliwość śledzenia statusu swojego zamówienia.
- **Zarządzanie zamówieniami:** Kurierzy muszą mieć możliwość zarządzania przypisanymi do nich zamówieniami.
- **Zarządzanie restauracjami i menu:** Administratorzy muszą mieć możliwość dodawania, edytowania i usuwania restauracji oraz ich menu.
- **Wylogowanie użytkowników:** Użytkownicy muszą mieć możliwość wylogowania się z systemu.
- **Zmiana danych użytkownika:** System musi umożliwiać użytkownikom zmianę swoich danych osobowych oraz hasła.
- **Filtrowanie restauracji:** Użytkownicy muszą mieć możliwość filtrowania restauracji według różnych kryteriów, takich jak kuchnia, ocena, lokalizacja itp.
- **Powiadomienia o statusie zamówienia:** Użytkownicy muszą otrzymywać powiadomienia o zmianie statusu ich zamówienia.

### 2.2 Wymagania niefunkcjonalne

- **Skalowalność:** System musi być skalowalny, aby obsłużyć rosnącą liczbę użytkowników i zamówień.
- **Wydajność:** Operacje na danych, takie jak przeglądanie menu, składanie zamówień oraz zarządzanie restauracjami, powinny być wykonywane szybko i efektywnie.
- **Bezpieczeństwo:** System musi zapewniać bezpieczeństwo danych użytkowników, w tym haszowanie haseł i zabezpieczenie tokenów JWT.
- **Niezawodność:** System musi być niezawodny i dostępny przez większość czasu, minimalizując przestoje.
- **Łatwość użycia:** Interfejs użytkownika powinien być intuicyjny i łatwy w użyciu.
- **Zgodność z przeglądarkami:** Aplikacja frontendowa powinna być zgodna z najnowszymi wersjami popularnych przeglądarek internetowych.
- **Dokumentacja:** System musi być dobrze udokumentowany, aby ułatwić deweloperom jego rozwój i utrzymanie.
- **Responsywność:** Aplikacja musi być responsywna, dostosowując się do różnych rozmiarów ekranów i urządzeń.
- **Integracja z systemem płatności:** W przyszłości planowana jest integracja z systemem płatności online, co musi być uwzględnione w projektowaniu systemu.
- **Odzyskiwanie danych:** System musi mieć mechanizmy odzyskiwania danych w przypadku awarii.

### 2.3 Zaimplementowane wymagania funkcjonalne
- **Użytkownik**:
  - Może przeglądać listę restauracji.
  - Może przeglądać menu wybranej restauracji.
  - Może składać zamówienia.
- **Kurier**:
  - Może zalogować się do systemu.
  - Może zarządzać zamówieniami.
  - Może wyświetlić dostępne zamówienia.
  - Może podjąć zamówienie.
  - Może wyświetlić zrealizowane dostawy.
- **Administrator**:
  - Może zarządzać restauracjami i menu.

## 3. Wireframes
Wireframes przedstawiają wygląd aplikacji i interakcje użytkownika z systemem. 


## 4. Diagramy UML (klas)
Przedstawiają strukturę klas i ich zależności.

## 5. Szczegóły implementacji

### 5.1 Opis technologii
- **Node.js**: Środowisko uruchomieniowe JavaScript na serwerze.
- **Express**: Framework dla Node.js do tworzenia aplikacji webowych.
- **React**: Biblioteka JavaScript do budowania interfejsów użytkownika.
- **MySQL**: Relacyjna baza danych.

### 5.2 Struktura katalogów
```
backend/
├── config/
│ └── config.json
├── models/
│ ├── dania.js
│ ├── index.js
│ ├── menu.js
│ ├── restauracje.js
│ ├── użytkownicy.js
│ ├── zamówienia.js
│ └── zamówienie_danie.js
├── routes/
│ ├── autoryzacja.js
│ ├── kurierzy.js
│ ├── menu.js
│ ├── restauracje.js
│ └── zamówienia.js
├── index.js
├── package-lock.json
└── package.json

frontend/
├── node_modules/
├── public/
└── src/
├── pages/
│ ├── Home.js
│ ├── Kurier.js
│ ├── Logowanie.js
│ ├── Rejestracja.js
│ ├── Restauracja.js
│ └── Zamówienie.js
├── App.css
├── App.js
└── index.js
├── package-lock.json
└── package.json
```

### 5.3 Kroki instalacji i uruchomienia

#### Baza danych:
Uruchom lokalny serwer SQL. Utwórz pustą bazę danych o nazwie `www_projekt_2`. Przekopiuj do niej kod z pliku `www_projekt_2.sql'.
```
mysql -u root -p
DROP DATABASE www_projekt_2;
CREATE DATABASE www_projekt_2;
exit
mysql -u root -p www_projekt_2 < www_projekt_2.sql
```

#### Serwer:
Przejdź do katalogu `/backend`, zainstaluj pakiety:
```
npm install
```
Następnie uruchom serwer:
```
npm start
```
Serwer zostanie uruchomiony pod adresem `localhost:3001`.

#### Klient:
Przejdź do katalogu `/frontend`, zainstaluj pakiety:
```
npm install
```
Następnie uruchom serwer:
```
npm start
```
Serwer zostanie uruchomiony pod adresem `localhost:3000`.

#### Logowanie:
W bazie danych utworzone są domyślnie 4 konta kurierów:
- Użytkownik: `kamil@slimak.pl`, Hasło: `test123`
- Użytkownik: `piotr@bozek.pl`, Hasło: `bmwe46`
- Użytkownik: `karol@slimak.pl`, Hasło: `test123`
- Użytkownik: `ola@bozek.pl`, Hasło: `bmwe46`

## 6. Przykłady użycia

### 6.1 Scenariusze użycia
#### Przykład 1: Przeglądanie restauracji
1. Użytkownik otwiera aplikację.
2. Użytkownik przegląda listę dostępnych restauracji.
3. Użytkownik wybiera restaurację, aby zobaczyć jej menu.

#### Przykład 2: Składanie zamówienia
1. Użytkownik wybiera dania z menu restauracji.
2. Użytkownik dodaje wybrane dania do koszyka.
3. Użytkownik finalizuje zamówienie i podaje dane dostawy.

#### Przykład 3: Zarządzanie zamówieniami przez kuriera
1. Kurier loguje się do systemu przy użyciu swojego konta.
2. Kurier przechodzi do panelu zarządzania zamówieniami.
3. Kurier przegląda listę przypisanych do niego zamówień.
4. Kurier wybiera zamówienie, aby zobaczyć jego szczegóły.
5. Kurier aktualizuje status zamówienia na "W trakcie dostawy".
6. Kurier dostarcza zamówienie do klienta.
7. Kurier aktualizuje status zamówienia na "Dostarczone".

#### Przykład 4: Śledzenie statusu zamówienia przez użytkownika
1. Użytkownik otwiera aplikację.
2. Użytkownik przechodzi do sekcji "Moje zamówienia".
3. Użytkownik wybiera zamówienie, aby zobaczyć jego szczegóły.
4. Użytkownik sprawdza aktualny status zamówienia (np. "Przygotowywane", "W trakcie dostawy", "Dostarczone").

#### Przykład 5: Zarządzanie restauracjami i menu przez administratora
1. Administrator loguje się do systemu przy użyciu swojego konta.
2. Administrator przechodzi do panelu zarządzania restauracjami.
3. Administrator dodaje nową restaurację, wprowadzając jej szczegóły (nazwa, opis, adres, itd.).
4. Administrator przechodzi do panelu zarządzania menu.
5. Administrator dodaje nowe dania do menu wybranej restauracji.
6. Administrator edytuje istniejące dania w menu lub usuwa je, jeśli są nieaktualne.

#### Przykład 6: Przeglądanie historii zamówień
Kurier loguje się do systemu.
Kurier przechodzi do panelu zarządzania zamówieniami.
Kurier wybiera opcję "Historia zamówień".
Kurier przegląda listę wszystkich zrealizowanych zamówień, z ich szczegółami i statusami.

## 7. Testowanie

### 7.1 Plan testów
- **Testy jednostkowe**: Testowanie pojedynczych funkcji i metod.
- **Testy integracyjne**: Testowanie interakcji między różnymi komponentami.
- **Testy systemowe**: Testowanie całego systemu pod kątem spełnienia wymagań.

## 8. Planowany rozwój aplikacji
W przyszłości planowane jest rozszerzenie projektu o dodatkowe funkcjonalności, takie jak:
- Logowanie za pomocą google OAuth
- Integracja z systemem płatności online.
- Ulepszenie interfejsu użytkownika.
- Wprowadzenie systemu rekomendacji dań na podstawie wcześniejszych zamówień.
