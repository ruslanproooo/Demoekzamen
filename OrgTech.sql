-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Хост: localhost
-- Время создания: Окт 29 2024 г., 10:17
-- Версия сервера: 10.4.32-MariaDB
-- Версия PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `База2`
--

-- --------------------------------------------------------

--
-- Структура таблицы `comments`
--

CREATE TABLE `comments` (
  `IDcomment` int(11) NOT NULL,
  `massage` varchar(255) NOT NULL,
  `masterID` int(11) NOT NULL,
  `requestID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `comments`
--

INSERT INTO `comments` (`IDcomment`, `massage`, `masterID`, `requestID`) VALUES
(1, 'Интересно...', 2, 1),
(2, 'Будем разбираться!', 3, 2),
(3, 'Сделаем всё на высшем уровне!', 3, 3);

-- --------------------------------------------------------

--
-- Структура таблицы `orgTechTypes`
--

CREATE TABLE `orgTechTypes` (
  `IDorgTechTypes` int(11) NOT NULL,
  `orgTechType` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `orgTechTypes`
--

INSERT INTO `orgTechTypes` (`IDorgTechTypes`, `orgTechType`) VALUES
(1, 'Компьютер'),
(2, 'Ноутбук'),
(3, 'Принтер');

-- --------------------------------------------------------

--
-- Структура таблицы `requests`
--

CREATE TABLE `requests` (
  `IDrequest` int(255) NOT NULL,
  `startDate` date NOT NULL,
  `orgTechTypeID` int(255) NOT NULL,
  `orgTechModel` varchar(255) NOT NULL,
  `problemDescription` text NOT NULL,
  `requestStatusID` int(255) NOT NULL,
  `completionDate` date NOT NULL,
  `repairPart` varchar(255) NOT NULL,
  `masterID` int(255) NOT NULL,
  `clientID` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `requests`
--

INSERT INTO `requests` (`IDrequest`, `startDate`, `orgTechTypeID`, `orgTechModel`, `problemDescription`, `requestStatusID`, `completionDate`, `repairPart`, `masterID`, `clientID`) VALUES
(1, '2023-06-06', 1, 'DEXP Aquilon O286', 'Перестал работать', 1, '2023-01-01', '', 2, 7),
(2, '2023-05-05', 1, 'DEXP Atlas H388', 'Перестал работать', 1, '2023-01-01', '', 3, 8),
(3, '2023-07-07', 2, 'MSI GF76 Katana', 'Выключается', 2, '2023-01-01', '', 3, 9),
(4, '2023-08-02', 2, 'MSI Modern 15', 'Выключается', 3, '2023-01-01', '', 0, 8),
(5, '2023-08-02', 3, 'HP Laserjet Pro', 'Перестал включаться', 3, '2023-01-01', '', 0, 9);

-- --------------------------------------------------------

--
-- Структура таблицы `requestStatuses`
--

CREATE TABLE `requestStatuses` (
  `IDrequestStatus` int(11) NOT NULL,
  `requestStatus` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `requestStatuses`
--

INSERT INTO `requestStatuses` (`IDrequestStatus`, `requestStatus`) VALUES
(1, 'В процессе ремонта'),
(2, 'Готовы к выдаче'),
(3, 'Новая заявка');

-- --------------------------------------------------------

--
-- Структура таблицы `types`
--

CREATE TABLE `types` (
  `IDtype` int(11) NOT NULL,
  `type` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `types`
--

INSERT INTO `types` (`IDtype`, `type`) VALUES
(1, 'Менеджер'),
(2, 'Мастер'),
(3, 'Оператор'),
(4, 'Заказчик');

-- --------------------------------------------------------

--
-- Структура таблицы `user`
--

CREATE TABLE `user` (
  `id` int(255) NOT NULL,
  `fio` text NOT NULL,
  `phone` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `typeID` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `user`
--

INSERT INTO `user` (`id`, `fio`, `phone`, `username`, `password`, `typeID`) VALUES
(1, 'Носов Иван Михайлович', '89210563123', 'login1', 'pass1', 1),
(2, 'Ильин Александр Андреевич', '89535078989', 'login2', 'pass2', 2),
(3, 'Никифоров Иван Дмитриевич', '89210673849', 'login3', 'pass3', 2),
(4, 'Елисеев Артем Леонидович', '899905663745', 'login4', 'pass4', 3),
(5, 'Титов Сергей Кириллович', '89994563847', 'login5', 'pass5', 3),
(6, 'Григорьев Семен Викторович', '89219567849', 'login11', 'pass11', 4),
(7, 'Сорокин Дмитрий Ильич', '89219567849', 'login12', 'pass12', 4),
(8, 'Белоусов Егор Ярославович', '89219567849', 'login13', 'pass13', 4),
(9, 'Суслов Михаил Александрович', '89219567849', 'login14', 'pass14', 4),
(10, 'Васильев Вячеслав Александрович', '89219567849', 'login15', 'pass15', 2);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`IDcomment`),
  ADD KEY `masterID` (`masterID`),
  ADD KEY `requestID` (`requestID`);

--
-- Индексы таблицы `orgTechTypes`
--
ALTER TABLE `orgTechTypes`
  ADD PRIMARY KEY (`IDorgTechTypes`);

--
-- Индексы таблицы `requests`
--
ALTER TABLE `requests`
  ADD PRIMARY KEY (`IDrequest`),
  ADD KEY `orgTechTypeID` (`orgTechTypeID`),
  ADD KEY `clientID` (`clientID`),
  ADD KEY `masterID` (`masterID`),
  ADD KEY `requestStatusID` (`requestStatusID`);

--
-- Индексы таблицы `requestStatuses`
--
ALTER TABLE `requestStatuses`
  ADD PRIMARY KEY (`IDrequestStatus`);

--
-- Индексы таблицы `types`
--
ALTER TABLE `types`
  ADD PRIMARY KEY (`IDtype`);

--
-- Индексы таблицы `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `typeID` (`typeID`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `comments`
--
ALTER TABLE `comments`
  MODIFY `IDcomment` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `orgTechTypes`
--
ALTER TABLE `orgTechTypes`
  MODIFY `IDorgTechTypes` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `requests`
--
ALTER TABLE `requests`
  MODIFY `IDrequest` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `requestStatuses`
--
ALTER TABLE `requestStatuses`
  MODIFY `IDrequestStatus` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `types`
--
ALTER TABLE `types`
  MODIFY `IDtype` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `user`
--
ALTER TABLE `user`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`requestID`) REFERENCES `requests` (`IDrequest`),
  ADD CONSTRAINT `comments_ibfk_2` FOREIGN KEY (`masterID`) REFERENCES `user` (`id`);

--
-- Ограничения внешнего ключа таблицы `orgTechTypes`
--
ALTER TABLE `orgTechTypes`
  ADD CONSTRAINT `orgTechTypes_ibfk_1` FOREIGN KEY (`IDorgTechTypes`) REFERENCES `requests` (`orgTechTypeID`);

--
-- Ограничения внешнего ключа таблицы `requests`
--
ALTER TABLE `requests`
  ADD CONSTRAINT `requests_ibfk_1` FOREIGN KEY (`clientID`) REFERENCES `user` (`id`);

--
-- Ограничения внешнего ключа таблицы `requestStatuses`
--
ALTER TABLE `requestStatuses`
  ADD CONSTRAINT `requestStatuses_ibfk_1` FOREIGN KEY (`IDrequestStatus`) REFERENCES `requests` (`requestStatusID`);

--
-- Ограничения внешнего ключа таблицы `types`
--
ALTER TABLE `types`
  ADD CONSTRAINT `types_ibfk_1` FOREIGN KEY (`IDtype`) REFERENCES `user` (`typeID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
