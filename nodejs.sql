-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th9 13, 2023 lúc 08:05 AM
-- Phiên bản máy phục vụ: 10.4.25-MariaDB
-- Phiên bản PHP: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `nodejs`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `thuTu` int(11) NOT NULL,
  `anHien` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `category`
--

INSERT INTO `category` (`id`, `name`, `thuTu`, `anHien`) VALUES
(1, 'Series P', 1, 1),
(2, 'Series S', 2, 1),
(3, 'Series T', 3, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `url_hinh` varchar(255) NOT NULL,
  `price` double NOT NULL,
  `description` varchar(2000) NOT NULL,
  `solanxem` int(255) NOT NULL,
  `hot` tinyint(1) NOT NULL,
  `capnhat` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `id_cate` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `product`
--

INSERT INTO `product` (`id`, `name`, `url_hinh`, `price`, `description`, `solanxem`, `hot`, `capnhat`, `id_cate`) VALUES
(1, 'P1C/04 CAIPI', 'images/w1.webp', 1600000, 'Mới đây, thương hiệu SevenFriday vừa cho ra mắt một thiết kế mới nhất mang một cái tên đặc biệt nhiều “vị” – P1C/04 CAIPI.\r\nCaipi – tên đầy đủ Caipirinha là thức uống cocktail nổi bật đến từ Brazil với vị chủ đạo từ hương chanh thanh mát. Khoan nói chuyện khác, các bạn hãy cùng đọc những dòng này cùng chúng tôi, nhắm mắt lại, và tưởng tượng cảnh này nào:', 1, 0, '2023-07-20 09:06:39', 1),
(2, 'S1/01', 'images/w5.webp', 1600000, 'Đây là 1 trong những thắc mắc hàng đầu vì ở mỗi nơi lại có nguồn tin khác nhau. \r\nViệc hiểu rõ nguồn gốc xuất xứ sẽ cho người dùng yên tâm hơn về sản phẩm. \r\nNhưng trước khi trả lời cho câu hỏi trên, chúng ta cần phải tìm hiểu về lịch sử đồng hồ SevenFriday', 24, 1, '2023-07-20 04:41:50', 2),
(3, 'P3C/12 BEACH CLUB', 'images/w7.webp', 2100000, 'Đây là 1 trong những thắc mắc hàng đầu vì ở mỗi nơi lại có nguồn tin khác nhau. \r\nViệc hiểu rõ nguồn gốc xuất xứ sẽ cho người dùng yên tâm hơn về sản phẩm. \r\nNhưng trước khi trả lời cho câu hỏi trên, chúng ta cần phải tìm hiểu về lịch sử đồng hồ SevenFriday', 0, 0, '2023-07-20 04:43:05', 1),
(4, 'P3C/03', 'images/w6.webp', 1500000, 'Đây là 1 trong những thắc mắc hàng đầu vì ở mỗi nơi lại có nguồn tin khác nhau. \r\nViệc hiểu rõ nguồn gốc xuất xứ sẽ cho người dùng yên tâm hơn về sản phẩm. \r\nNhưng trước khi trả lời cho câu hỏi trên, chúng ta cần phải tìm hiểu về lịch sử đồng hồ SevenFriday', 0, 1, '2023-07-20 04:44:09', 1),
(5, 'PS3/02 RUBY CARBON', 'images/w8.webp', 1900000, 'Đây là 1 trong những thắc mắc hàng đầu vì ở mỗi nơi lại có nguồn tin khác nhau. \r\nViệc hiểu rõ nguồn gốc xuất xứ sẽ cho người dùng yên tâm hơn về sản phẩm. \r\nNhưng trước khi trả lời cho câu hỏi trên, chúng ta cần phải tìm hiểu về lịch sử đồng hồ SevenFriday', 0, 0, '2023-07-20 04:44:56', 1),
(6, 'T3/05 RED TIGER', 'images/w2.webp', 800000, 'Đây là 1 trong những thắc mắc hàng đầu vì ở mỗi nơi lại có nguồn tin khác nhau. \r\nViệc hiểu rõ nguồn gốc xuất xứ sẽ cho người dùng yên tâm hơn về sản phẩm. \r\nNhưng trước khi trả lời cho câu hỏi trên, chúng ta cần phải tìm hiểu về lịch sử đồng hồ SevenFriday', 0, 0, '2023-07-20 04:45:39', 3),
(7, 'T1/08 BAUHAUS INSPIRED', 'images/w3.webp', 1550000, 'Đây là 1 trong những thắc mắc hàng đầu vì ở mỗi nơi lại có nguồn tin khác nhau. \r\nViệc hiểu rõ nguồn gốc xuất xứ sẽ cho người dùng yên tâm hơn về sản phẩm. \r\nNhưng trước khi trả lời cho câu hỏi trên, chúng ta cần phải tìm hiểu về lịch sử đồng hồ SevenFriday', 1, 1, '2023-07-20 04:46:34', 3),
(8, 'S1/02 M', 'images/w9.webp', 1200000, 'Đây là 1 trong những thắc mắc hàng đầu vì ở mỗi nơi lại có nguồn tin khác nhau. \r\nViệc hiểu rõ nguồn gốc xuất xứ sẽ cho người dùng yên tâm hơn về sản phẩm. \r\nNhưng trước khi trả lời cho câu hỏi trên, chúng ta cần phải tìm hiểu về lịch sử đồng hồ SevenFriday', 1, 1, '2023-07-20 04:52:00', 2);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user`
--

CREATE TABLE `user` (
  `idUser` int(11) NOT NULL,
  `ho` varchar(50) NOT NULL,
  `ten` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(100) NOT NULL,
  `email` varchar(255) NOT NULL,
  `sothich` varchar(2000) NOT NULL,
  `tinh` varchar(100) NOT NULL,
  `vaitro` tinyint(1) NOT NULL,
  `locked` tinyint(1) NOT NULL,
  `reset_password_token` varchar(100) NOT NULL,
  `reset_password_expire` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `user`
--

INSERT INTO `user` (`idUser`, `ho`, `ten`, `username`, `password`, `email`, `sothich`, `tinh`, `vaitro`, `locked`, `reset_password_token`, `reset_password_expire`) VALUES
(1, 'Phan Châu Khánh', 'Duy', 'duyne', '12345', 'duyphan@gmai.com', 'mãi yêu mình em', 'Bình Dương', 1, 0, '', NULL),
(2, 'Phan Tô Duy', 'Tú', 'tuneh', '12345', 'duytu@gmail.com', 'thích cười', 'Tp hcm', 0, 0, '', NULL),
(3, 'Nguyễn Đức', 'Dương', 'ducduong', '12345', 'duong123@gmail.com', 'thích ăn thích nói thích đủ thứ', 'Đồng Nai', 0, 0, '', NULL),
(4, 'Nguyễn Hữu', 'Lộc', 'locne123', '12345', 'loc@gmail.com', 'thích tè le hột me', 'TP HCM', 0, 0, '', NULL),
(5, 'Phạm Quang', 'Minh', 'minhne123', '12345', 'minh123@gmail.com', 'thích kiếm tiền', 'Bình Phước', 1, 0, '', NULL),
(9, 'Nguyễn Trần', 'Abc', 'abcssss', '12345', 'abcdef@gmail.com', 'thích gì cũng đc', 'hcm', 0, 0, '', NULL),
(10, 'Nguyễn Văn', 'Tèo', 'teone123', '123456', 'teo@gmail.com', 'thíchhhh', 'Đà nắng', 0, 0, '', NULL),
(11, 'Trần Thị', 'Công', 'congneh1234', '123456', 'congcong@gmail.com', 'thích mấy em gái xinh', 'Đồng Nai', 0, 0, '', NULL),
(30, '', '', 'abc', '$2b$10$dlEJGhT0uWlygKx7O4817Or1bznJF67kctdv/W.UOxhEopSl6/MVm', '', '', '', 0, 0, '', NULL),
(31, '', '', 'vvv', '$2b$10$PhPheyxN3qpZ7s7A7Ha3q.ly2W3L59hnNMmmsANjUROXMhNLIE90a', '', '', '', 0, 0, '', NULL),
(32, '', '', 'fff', '$2b$10$MJh.1HEHzFVhdSUn4OUccuxceATLiTTiADEgGxxAYtUAAhvp2tggi', '', '', '', 0, 0, '', NULL),
(33, 'Phan Châu Khánh ', 'Duy', 'pckd', '$2b$10$lDkXw4XXGM7EhmLDeW9ctej.lfqfLpn8v2s5zW/ip.Ca9md0rVHxG', 'duyphan925@gmail.com', 'ngắm mưa', '', 0, 0, '', NULL),
(34, 'Phan Châu Khánh ', 'Duy', 'duy123', '$2b$10$hu.VBMpqJTGkC1zBx5zPGedj/F/KEyJZL.S0Odo1qbw/FczHfJRcO', 'duyphan925@gmail.com', 'â', '', 0, 0, '', NULL);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`idUser`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT cho bảng `user`
--
ALTER TABLE `user`
  MODIFY `idUser` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
