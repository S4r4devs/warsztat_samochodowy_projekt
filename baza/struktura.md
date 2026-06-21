# Struktura bazy danych — Warsztat Samochodowy

## Tabele i atrybuty

### Klient
| Atrybut | Typ | Opis |
|---|---|---|
| id_klienta | INTEGER | PK, autoincrement |
| imie | VARCHAR(50) | imię klienta |
| nazwisko | VARCHAR(50) | nazwisko klienta |
| telefon | VARCHAR(15) | numer telefonu |
| email | VARCHAR(100) | adres email |

### Mechanik
| Atrybut | Typ | Opis |
|---|---|---|
| id_mechanika | INTEGER | PK, autoincrement |
| imie | VARCHAR(50) | imię mechanika |
| nazwisko | VARCHAR(50) | nazwisko mechanika |
| specjalizacja | VARCHAR(100) | specjalizacja (np. silniki, elektryka) |
| telefon | VARCHAR(15) | numer telefonu |

### Pojazd
| Atrybut | Typ | Opis |
|---|---|---|
| id_pojazdu | INTEGER | PK, autoincrement |
| id_klienta | INTEGER | FK → Klient |
| marka | VARCHAR(50) | marka pojazdu |
| model | VARCHAR(50) | model pojazdu |
| rok_produkcji | INTEGER | rok produkcji |
| nr_rejestracyjny | VARCHAR(10) | numer rejestracyjny, unikalny |

### Zlecenie
| Atrybut | Typ | Opis |
|---|---|---|
| id_zlecenia | INTEGER | PK, autoincrement |
| id_pojazdu | INTEGER | FK → Pojazd |
| id_mechanika | INTEGER | FK → Mechanik |
| data_przyjecia | DATE | data przyjęcia auta |
| data_wydania | DATE | data wydania auta (może być pusta) |
| opis_usterki | TEXT | opis zgłoszonej usterki |
| status | VARCHAR(20) | status zlecenia (w trakcie / zakończone) |

### Faktura
| Atrybut | Typ | Opis |
|---|---|---|
| id_faktury | INTEGER | PK, autoincrement |
| id_zlecenia | INTEGER | FK → Zlecenie, unikalny |
| data_wystawienia | DATE | data wystawienia faktury |
| kwota_netto | DECIMAL(10,2) | kwota bez VAT |
| kwota_brutto | DECIMAL(10,2) | kwota z VAT |

## Związki między tabelami

| Związek | Typ | Opis |
|---|---|---|
| Klient → Pojazd | 1:N | jeden klient może mieć wiele aut |
| Pojazd → Zlecenie | 1:N | jedno auto może mieć wiele zleceń w historii |
| Mechanik → Zlecenie | 1:N | jeden mechanik może obsługiwać wiele zleceń |
| Zlecenie → Faktura | 1:1 | jedno zlecenie ma dokładnie jedną fakturę |