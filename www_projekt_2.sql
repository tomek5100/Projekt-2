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
(1, 'Margharita', '22.00'),
(2, 'Funghi', '22.00'),
(3, 'Capriccioza', '22.00'),
(4, 'Peperoni', '11.00'),
(5, 'Ostra', '11.00'),
(6, 'Hawajska', '11.00'),
(7, 'Rosoł', '11.00'),
(8, 'Kotlet', '22.00'),
(9, 'Gulasz', '22.00'),
(10, 'Kanapka ', '11.00'),
(11, 'Zupa 1', '11.00'),
(12, 'Zupa 2', '22.00'),
(13, 'Zupa 3', '33.00'),
(14, 'Zupa 4', '44.00'),
(15, 'Zupa 5', '55.00'),
(16, 'Zupa 6', '66.00'),
(17, 'Zupa 7', '77.00'),
(18, 'Zupa 8', '88.00'),
(19, 'Zupa 9', '99.00'),
(20, 'Zupa 10', '11.00');


CREATE TABLE `menu` (
  `id` int(11) NOT NULL,
  `id_restauracja` int(11) DEFAULT NULL,
  `id_danie` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;


INSERT INTO `menu` (`id`, `id_restauracja`, `id_danie`) VALUES
(20, 1, 2),
(18, 1, 7),
(19, 1, 8),
(21, 1, 20),
(7, 2, 9),
(8, 2, 10),
(9, 2, 11),
(10, 2, 12),
(11, 2, 13),
(12, 2, 14),
(13, 2, 15),
(14, 2, 16),
(15, 2, 17),
(16, 2, 18),
(17, 2, 19),
(1, 3, 1),
(3, 3, 2),
(2, 3, 3),
(5, 3, 4),
(6, 3, 5),
(4, 3, 6);


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
(1, 'Restauracja', 'https://dla-gastronomii.pl/images/porady/kuchnia-restauracja.jpg', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean eu convallis augue. Phasellus pharetra sit amet, eleifend a quam. Pellentesque ultricies libero vitae lorem euismod fringilla. Vestibulum ut eleifend neque, tincidunt sodales elit. Interdum et malesuada fames ac ante ipsum primis in.', 'Kraków', 'Abfda', '123'),
(2, 'Kebabownia', 'https://static.pyszne.pl/images/restaurants/pl/05N0QO11/logo_465x320.png', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean eu convallis augue. Phasellus pharetra sit amet, eleifend a quam. Pellentesque ultricies libero vitae lorem euismod fringilla. Vestibulum ut eleifend neque, tincidunt sodales elit. Interdum et malesuada fames ac ante ipsum primis in.', 'Kraków', 'gdfgf', '321'),
(3, 'Pizzeria', 'https://www.piramida-steakhouse.pl/wp-content/uploads/2022/06/ab92d16f-22da-4421-aedf-bcc0b5423954.jpg', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean eu convallis augue. Phasellus pharetra sit amet, eleifend a quam. Pellentesque ultricies libero vitae lorem euismod fringilla. Vestibulum ut eleifend neque, tincidunt sodales elit. Interdum et malesuada fames ac ante ipsum primis in.', "Kraków", "dfsdfd", '222');


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
