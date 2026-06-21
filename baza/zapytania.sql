-- Zapytanie 1: lista zleceń z danymi klienta i auta
SELECT 
    K.imie, K.nazwisko, 
    P.marka, P.model, P.nr_rejestracyjny,
    Z.data_przyjecia, Z.opis_usterki, Z.status
FROM Zlecenie Z
JOIN Pojazd P ON Z.id_pojazdu = P.id_pojazdu
JOIN Klient K ON P.id_klienta = K.id_klienta;

-- Zapytanie 2: zlecenia przypisane do mechanika Marka Zająca
SELECT 
    M.imie, M.nazwisko,
    P.marka, P.model,
    Z.opis_usterki, Z.status
FROM Zlecenie Z
JOIN Mechanik M ON Z.id_mechanika = M.id_mechanika
JOIN Pojazd P ON Z.id_pojazdu = P.id_pojazdu
WHERE M.id_mechanika = 1;

-- Zapytanie 3: faktury z kwotami i powiązanymi zleceniami
SELECT 
    F.id_faktury,
    K.imie, K.nazwisko,
    Z.opis_usterki,
    F.kwota_netto, F.kwota_brutto,
    F.data_wystawienia
FROM Faktura F
JOIN Zlecenie Z ON F.id_zlecenia = Z.id_zlecenia
JOIN Pojazd P ON Z.id_pojazdu = P.id_pojazdu
JOIN Klient K ON P.id_klienta = K.id_klienta;