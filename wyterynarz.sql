-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 19 Lis 2019, 19:51
-- Wersja serwera: 10.1.38-MariaDB
-- Wersja PHP: 7.3.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `wyterynarz`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `dane_zwierzaka`
--

CREATE TABLE `dane_zwierzaka` (
  `id_dane` int(11) NOT NULL,
  `id_klient` int(11) DEFAULT NULL,
  `typ` varchar(20) DEFAULT NULL,
  `rasa` varchar(50) DEFAULT NULL,
  `plec` varchar(10) DEFAULT NULL,
  `imie` varchar(50) DEFAULT NULL,
  `wiek` varchar(2) DEFAULT NULL,
  `zdjecie` longblob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `dane_zwierzaka`
--

INSERT INTO `dane_zwierzaka` (`id_dane`, `id_klient`, `typ`, `rasa`, `plec`, `imie`, `wiek`, `zdjecie`) VALUES
(1, 1, 'kot', 'dachowiec', 'kocur', 'kiciula', '7', '');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `diagnoza`
--

CREATE TABLE `diagnoza` (
  `id_diagnoza` int(11) NOT NULL,
  `id_dz_o` int(11) DEFAULT NULL,
  `lekarstwo` varchar(90) DEFAULT NULL,
  `zabieg` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `diagnoza`
--

INSERT INTO `diagnoza` (`id_diagnoza`, `id_dz_o`, `lekarstwo`, `zabieg`) VALUES
(1, 1, 'amfetamina', 'operacja kliniczna zielarska'),
(2, 1, 'amfetamina', 'operacja kliniczna zielarska');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `dz_o`
--

CREATE TABLE `dz_o` (
  `id_dz_o` int(11) NOT NULL,
  `id_dane` int(11) DEFAULT NULL,
  `id_obiaw` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `dz_o`
--

INSERT INTO `dz_o` (`id_dz_o`, `id_dane`, `id_obiaw`) VALUES
(1, 1, 1);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `klient`
--

CREATE TABLE `klient` (
  `id_klient` int(11) NOT NULL,
  `imie` varchar(50) NOT NULL,
  `nazwisko` varchar(50) NOT NULL,
  `telefon` varchar(12) DEFAULT NULL,
  `e_mail` varchar(80) DEFAULT NULL,
  `ulica` varchar(40) DEFAULT NULL,
  `nr_domu` varchar(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `klient`
--

INSERT INTO `klient` (`id_klient`, `imie`, `nazwisko`, `telefon`, `e_mail`, `ulica`, `nr_domu`) VALUES
(1, 'Natalia', 'Kukulska', '123123123', 'natkakuku@onet.pl', 'weso?a', '24');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `obiawy`
--

CREATE TABLE `obiawy` (
  `id_obiaw` int(11) NOT NULL,
  `opis` varchar(500) DEFAULT NULL,
  `przyczyna` varchar(200) DEFAULT NULL,
  `skutek` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `obiawy`
--

INSERT INTO `obiawy` (`id_obiaw`, `opis`, `przyczyna`, `skutek`) VALUES
(1, 'pacjent kuleje i wida? ?lady krwi na futrze', 'spad? w du?ej wysoko?ci na rzeczy', 'z?amana ko?czyna dolna w ?apie');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pracownicy`
--

CREATE TABLE `pracownicy` (
  `id_pracownik` int(11) NOT NULL,
  `imie` varchar(50) NOT NULL,
  `nazwisko` varchar(50) NOT NULL,
  `telefon` varchar(12) DEFAULT NULL,
  `e_mail` varchar(80) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `pracownicy`
--

INSERT INTO `pracownicy` (`id_pracownik`, `imie`, `nazwisko`, `telefon`, `e_mail`) VALUES
(1, 'Robert', 'Kluska', '345345345', 'robercikklusik@gmail.com');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `wizyta`
--

CREATE TABLE `wizyta` (
  `id_wizyta` int(11) NOT NULL,
  `id_diagnoza` int(11) DEFAULT NULL,
  `id_klient` int(11) DEFAULT NULL,
  `id_pracownik` int(11) DEFAULT NULL,
  `cena_usługi` decimal(10,0) DEFAULT NULL,
  `data_wizyty` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `wizyta`
--

INSERT INTO `wizyta` (`id_wizyta`, `id_diagnoza`, `id_klient`, `id_pracownik`, `cena_usługi`, `data_wizyty`) VALUES
(1, 1, 1, 1, '100', '2017-08-08');

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `dane_zwierzaka`
--
ALTER TABLE `dane_zwierzaka`
  ADD PRIMARY KEY (`id_dane`),
  ADD KEY `id_klient` (`id_klient`);

--
-- Indeksy dla tabeli `diagnoza`
--
ALTER TABLE `diagnoza`
  ADD PRIMARY KEY (`id_diagnoza`),
  ADD KEY `id_dz_o` (`id_dz_o`);

--
-- Indeksy dla tabeli `dz_o`
--
ALTER TABLE `dz_o`
  ADD PRIMARY KEY (`id_dz_o`),
  ADD KEY `id_dane` (`id_dane`,`id_obiaw`),
  ADD KEY `id_obiaw` (`id_obiaw`);

--
-- Indeksy dla tabeli `klient`
--
ALTER TABLE `klient`
  ADD PRIMARY KEY (`id_klient`);

--
-- Indeksy dla tabeli `obiawy`
--
ALTER TABLE `obiawy`
  ADD PRIMARY KEY (`id_obiaw`);

--
-- Indeksy dla tabeli `pracownicy`
--
ALTER TABLE `pracownicy`
  ADD PRIMARY KEY (`id_pracownik`);

--
-- Indeksy dla tabeli `wizyta`
--
ALTER TABLE `wizyta`
  ADD PRIMARY KEY (`id_wizyta`),
  ADD KEY `id_diagnoza` (`id_diagnoza`,`id_klient`,`id_pracownik`),
  ADD KEY `id_klient` (`id_klient`),
  ADD KEY `id_pracownik` (`id_pracownik`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT dla tabeli `dane_zwierzaka`
--
ALTER TABLE `dane_zwierzaka`
  MODIFY `id_dane` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT dla tabeli `diagnoza`
--
ALTER TABLE `diagnoza`
  MODIFY `id_diagnoza` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT dla tabeli `dz_o`
--
ALTER TABLE `dz_o`
  MODIFY `id_dz_o` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT dla tabeli `klient`
--
ALTER TABLE `klient`
  MODIFY `id_klient` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT dla tabeli `obiawy`
--
ALTER TABLE `obiawy`
  MODIFY `id_obiaw` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT dla tabeli `pracownicy`
--
ALTER TABLE `pracownicy`
  MODIFY `id_pracownik` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT dla tabeli `wizyta`
--
ALTER TABLE `wizyta`
  MODIFY `id_wizyta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Ograniczenia dla zrzutów tabel
--

--
-- Ograniczenia dla tabeli `dane_zwierzaka`
--
ALTER TABLE `dane_zwierzaka`
  ADD CONSTRAINT `dane_zwierzaka_ibfk_1` FOREIGN KEY (`id_klient`) REFERENCES `klient` (`id_klient`);

--
-- Ograniczenia dla tabeli `diagnoza`
--
ALTER TABLE `diagnoza`
  ADD CONSTRAINT `diagnoza_ibfk_1` FOREIGN KEY (`id_dz_o`) REFERENCES `dz_o` (`id_dz_o`);

--
-- Ograniczenia dla tabeli `dz_o`
--
ALTER TABLE `dz_o`
  ADD CONSTRAINT `dz_o_ibfk_1` FOREIGN KEY (`id_obiaw`) REFERENCES `obiawy` (`id_obiaw`),
  ADD CONSTRAINT `dz_o_ibfk_2` FOREIGN KEY (`id_dane`) REFERENCES `dane_zwierzaka` (`id_dane`);

--
-- Ograniczenia dla tabeli `wizyta`
--
ALTER TABLE `wizyta`
  ADD CONSTRAINT `wizyta_ibfk_1` FOREIGN KEY (`id_klient`) REFERENCES `klient` (`id_klient`),
  ADD CONSTRAINT `wizyta_ibfk_2` FOREIGN KEY (`id_pracownik`) REFERENCES `pracownicy` (`id_pracownik`),
  ADD CONSTRAINT `wizyta_ibfk_3` FOREIGN KEY (`id_diagnoza`) REFERENCES `diagnoza` (`id_diagnoza`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
