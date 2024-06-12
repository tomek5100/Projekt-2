SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";
SET NAMES 'utf8mb4';
SET CHARACTER SET utf8mb4;
SET COLLATION_CONNECTION = 'utf8mb4_unicode_ci';


CREATE TABLE `dania` (
  `id` int(11) NOT NULL,
  `nazwa` varchar(255) COLLATE utf8_polish_ci NOT NULL,
  `cena` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

INSERT INTO `dania` (`id`, `nazwa`, `cena`) VALUES
(1, 'Margherita', '22.00'),
(2, 'Funghi', '24.00'),
(3, 'Capricciosa', '26.00'),
(4, 'Pepperoni', '28.00'),
(5, 'Ostra', '30.00'),
(6, 'Hawajska', '32.00'),
(7, 'Rosół', '15.00'),
(8, 'Kotlet schabowy', '25.00'),
(9, 'Gulasz wołowy', '28.00'),
(10, 'Kebab w picie', '20.00'),
(11, 'Kebab na talerzu', '25.00'),
(12, 'Falafel', '18.00'),
(13, 'Shawarma', '22.00'),
(14, 'Sałatka z kebabem', '19.00'),
(15, 'Hummus z warzywami', '16.00'),
(16, 'Zupa z soczewicy', '14.00'),
(17, 'Pizza Quattro Formaggi', '30.00'),
(18, 'Pizza Prosciutto', '28.00'),
(19, 'Pizza Diavola', '29.00'),
(20, 'Pizza Vegetariana', '27.00');

CREATE TABLE `menu` (
  `id` int(11) NOT NULL,
  `id_restauracja` int(11) DEFAULT NULL,
  `id_danie` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

INSERT INTO `menu` (`id`, `id_restauracja`, `id_danie`) VALUES
(1, 1, 7),
(2, 1, 8),
(3, 1, 9),
(4, 1, 20),
(5, 2, 10),
(6, 2, 11),
(7, 2, 12),
(8, 2, 13),
(9, 2, 14),
(10, 2, 15),
(11, 2, 16),
(12, 3, 1),
(13, 3, 2),
(14, 3, 3),
(15, 3, 4),
(16, 3, 5),
(17, 3, 6),
(18, 3, 17),
(19, 3, 18),
(20, 3, 19);


CREATE TABLE `restauracje` (
  `id` int(11) NOT NULL,
  `nazwa` varchar(255) COLLATE utf8_polish_ci NOT NULL,
  `zdjęcie` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL,
  `opis` text COLLATE utf8_polish_ci DEFAULT NULL,
  `miasto` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL,
  `ulica` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL,
  `numer_lokalu` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

INSERT INTO `restauracje` (`id`, `nazwa`, `zdjęcie`, `opis`, `miasto`, `ulica`, `numer_lokalu`) VALUES
(1, 'Restauracja', 'https://dla-gastronomii.pl/images/porady/kuchnia-restauracja.jpg', 'Restauracja serwująca wykwintne dania kuchni polskiej z nutą nowoczesności. Każde danie przygotowywane jest z najwyższej jakości składników, a wnętrze lokalu zachwyca elegancją i przytulnością.', 'Kraków', 'ul. Smocza', '1A'),
(2, 'Kebabownia', 'https://static.pyszne.pl/images/restaurants/pl/05N0QO11/logo_465x320.png', 'Najlepszy kebab w mieście! Świeże, aromatyczne mięso oraz chrupiące warzywa podawane w pysznej picie lub na talerzu. Idealne miejsce na szybki i smaczny posiłek.', 'Kraków', 'ul. Sławkowska', '21B'),
(3, 'Pizzeria', 'https://www.piramida-steakhouse.pl/wp-content/uploads/2022/06/ab92d16f-22da-4421-aedf-bcc0b5423954.jpg', 'Pizzeria, w której każdy znajdzie coś dla siebie. Od klasycznej Margherity po wyszukane kompozycje smakowe. Wszystkie pizze przygotowywane są na cienkim, chrupiącym cieście z najwyższej jakości składników.', 'Kraków', 'ul. Świętej Anny', '7C');


CREATE TABLE `użytkownicy` (
  `id` int(11) NOT NULL,
  `imię` varchar(255) COLLATE utf8_polish_ci NOT NULL,
  `nazwisko` varchar(255) COLLATE utf8_polish_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_polish_ci NOT NULL,
  `hasło_hash` varchar(60) COLLATE utf8_polish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;


INSERT INTO `użytkownicy` (`id`, `imię`, `nazwisko`, `email`, `hasło_hash`) VALUES
(1, 'Kamil', 'Ślimak', 'kamil@slimak.pl', '$2b$10$4VBCihqbQJCNSoq8/l6RfeFFtwiYQKinIhQrR8LKp5..w3Aorupky'),
(2, 'Piotr', 'Bożek', 'piotr@bozek.pl', '$2b$10$HWaLThaVO1skrS2dOVMPSO0S6ASa6UfKRNiJYpBcfs6x6r3vNkz3G'),
(3, 'Karol', 'Ślimak', 'karol@slimak.pl', '$2b$10$4VBCihqbQJCNSoq8/l6RfeFFtwiYQKinIhQrR8LKp5..w3Aorupky'),
(4, 'Ala', 'Bożek', 'ala@bozek.pl', '$2b$10$HWaLThaVO1skrS2dOVMPSO0S6ASa6UfKRNiJYpBcfs6x6r3vNkz3G');



CREATE TABLE `zamówienia` (
  `id` int(11) NOT NULL,
  `kod` varchar(255) COLLATE utf8_polish_ci NOT NULL,
  `miasto` varchar(255) COLLATE utf8_polish_ci NOT NULL,
  `ulica` varchar(255) COLLATE utf8_polish_ci NOT NULL,
  `numer_mieszkania` varchar(255) COLLATE utf8_polish_ci NOT NULL,
  `cena` decimal(10,2) NOT NULL,
  `status` enum('złożone','w trakcie','zrealizowane','anulowane') COLLATE utf8_polish_ci NOT NULL,
  `id_kurier` int(11) DEFAULT NULL,
  `id_restauracja` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;


CREATE TABLE `zamówienie_danie` (
  `ilość` int(11) NOT NULL,
  `id_zamówienie` int(11) NOT NULL,
  `id_danie` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

ALTER TABLE `dania`
  ADD PRIMARY KEY (`id`);


ALTER TABLE `menu`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `menu_id_danie_id_restauracja_unique` (`id_restauracja`,`id_danie`),
  ADD KEY `id_danie` (`id_danie`);

ALTER TABLE `restauracje`
  ADD PRIMARY KEY (`id`);


ALTER TABLE `użytkownicy`
  ADD PRIMARY KEY (`id`);


ALTER TABLE `zamówienia`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_kurier` (`id_kurier`),
  ADD KEY `id_restauracja` (`id_restauracja`);

ALTER TABLE `zamówienie_danie`
  ADD PRIMARY KEY (`id_zamówienie`,`id_danie`),
  ADD KEY `id_danie` (`id_danie`);


ALTER TABLE `dania`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

ALTER TABLE `menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

ALTER TABLE `restauracje`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;


ALTER TABLE `użytkownicy`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;


ALTER TABLE `zamówienia`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;


ALTER TABLE `menu`
  ADD CONSTRAINT `menu_ibfk_1` FOREIGN KEY (`id_restauracja`) REFERENCES `restauracje` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `menu_ibfk_2` FOREIGN KEY (`id_danie`) REFERENCES `dania` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `zamówienia`
  ADD CONSTRAINT `zamówienia_ibfk_1` FOREIGN KEY (`id_kurier`) REFERENCES `użytkownicy` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `zamówienia_ibfk_2` FOREIGN KEY (`id_restauracja`) REFERENCES `restauracje` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

ALTER TABLE `zamówienie_danie`
  ADD CONSTRAINT `zamówienie_danie_ibfk_1` FOREIGN KEY (`id_zamówienie`) REFERENCES `zamówienia` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `zamówienie_danie_ibfk_2` FOREIGN KEY (`id_danie`) REFERENCES `dania` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;
