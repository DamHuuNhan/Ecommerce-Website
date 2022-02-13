-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th2 08, 2021 lúc 10:25 AM
-- Phiên bản máy phục vụ: 10.4.11-MariaDB
-- Phiên bản PHP: 7.2.30

SET FOREIGN_KEY_CHECKS=0;
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: tsun
--
CREATE DATABASE IF NOT EXISTS tsun DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci;
USE tsun;


-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng mp_cart
--

CREATE TABLE mp_cart (
  id int(11) NOT NULL,
  id_user int(11) NOT NULL,
  date_created datetime NOT NULL DEFAULT current_timestamp(),
  date_modify datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci COMMENT='Cart';

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng mp_cart_detail
--

CREATE TABLE mp_cart_detail (
  id_cart int(11) NOT NULL,
  id_product int(11) NOT NULL,
  quantity int(11) NOT NULL,
  date_created datetime NOT NULL DEFAULT current_timestamp(),
  date_modify datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci COMMENT='Cart detail';

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng mp_order
--

CREATE TABLE mp_order (
  id int(11) NOT NULL,
  id_user int(11) NOT NULL,
  total_price int(11) NOT NULL,
  status varchar(50) COLLATE utf8mb4_vietnamese_ci DEFAULT 'Chờ xác nhận',
  ship_phone varchar(10) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  ship_address varchar(200) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  date_created datetime NOT NULL DEFAULT current_timestamp(),
  date_modify datetime NOT NULL DEFAULT current_timestamp(),
  ship_name varchar(40) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  ship_fee int(11) NOT NULL,
  ship_city varchar(50) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  ship_province varchar(50) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  id_shipper int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci COMMENT='Order';

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng mp_order_detail
--

CREATE TABLE mp_order_detail (
  id_order int(11) NOT NULL,
  id_product int(11) NOT NULL,
  quantity int(11) NOT NULL,
  price int(11) NOT NULL,
  date_created datetime NOT NULL DEFAULT current_timestamp(),
  date_modify datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci COMMENT='Order detail';

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng mp_product
--

CREATE TABLE mp_product (
  id int(11) NOT NULL,
  name varchar(100) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  price int(11) NOT NULL,
  img mediumblob DEFAULT NULL,
  short_discription text COLLATE utf8mb4_vietnamese_ci NOT NULL,
  discription text COLLATE utf8mb4_vietnamese_ci NOT NULL,
  date_created datetime NOT NULL DEFAULT current_timestamp(),
  status varchar(10) COLLATE utf8mb4_vietnamese_ci NOT NULL DEFAULT 'ACTIVE',
  date_modify datetime NOT NULL DEFAULT current_timestamp(),
  stock int(11) NOT NULL,
  id_type int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci COMMENT='Product';

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng mp_shipper
--

CREATE TABLE mp_shipper (
  id int(11) NOT NULL,
  Name varchar(100) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  Phone varchar(10) COLLATE utf8mb4_vietnamese_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng mp_type_product
--

CREATE TABLE mp_type_product (
  id int(11) NOT NULL,
  name varchar(100) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  status varchar(10) COLLATE utf8mb4_vietnamese_ci NOT NULL DEFAULT 'ACTIVE',
  date_created datetime NOT NULL DEFAULT current_timestamp(),
  date_modify datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci COMMENT='Type of product';

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng mp_user
--

CREATE TABLE mp_user (
  id int(11) NOT NULL,
  account varchar(100) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  password varchar(100) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  img longblob DEFAULT NULL,
  date_created datetime NOT NULL DEFAULT current_timestamp(),
  date_modify datetime NOT NULL DEFAULT current_timestamp(),
  full_name varchar(100) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  email varchar(100) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  phone varchar(10) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  address varchar(200) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  city varchar(50) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  province varchar(50) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  status varchar(10) COLLATE utf8mb4_vietnamese_ci NOT NULL DEFAULT 'ACTIVE',
  date_last_access datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci COMMENT='User';

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng mp_cart
--
ALTER TABLE mp_cart
  ADD PRIMARY KEY (id),
  ADD KEY id_user (id_user);

--
-- Chỉ mục cho bảng mp_cart_detail
--
ALTER TABLE mp_cart_detail
  ADD PRIMARY KEY (id_cart,id_product),
  ADD KEY id_product (id_product);

--
-- Chỉ mục cho bảng mp_order
--
ALTER TABLE mp_order
  ADD PRIMARY KEY (id),
  ADD KEY id_user (id_user);

--
-- Chỉ mục cho bảng mp_order_detail
--
ALTER TABLE mp_order_detail
  ADD PRIMARY KEY (id_order,id_product),
  ADD KEY id_product (id_product);

--
-- Chỉ mục cho bảng mp_product
--
ALTER TABLE mp_product
  ADD PRIMARY KEY (id),
  ADD KEY mp_product_ibfk_1 (id_type);

--
-- Chỉ mục cho bảng mp_shipper
--
ALTER TABLE mp_shipper
  ADD PRIMARY KEY (id);

--
-- Chỉ mục cho bảng mp_type_product
--
ALTER TABLE mp_type_product
  ADD PRIMARY KEY (id),
  ADD UNIQUE KEY name (name);

--
-- Chỉ mục cho bảng mp_user
--
ALTER TABLE mp_user
  ADD PRIMARY KEY (id),
  ADD UNIQUE KEY account (account);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng mp_cart
--
ALTER TABLE mp_cart
  MODIFY id int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng mp_order
--
ALTER TABLE mp_order
  MODIFY id int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng mp_product
--
ALTER TABLE mp_product
  MODIFY id int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng mp_shipper
--
ALTER TABLE mp_shipper
  MODIFY id int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng mp_type_product
--
ALTER TABLE mp_type_product
  MODIFY id int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng mp_user
--
ALTER TABLE mp_user
  MODIFY id int(11) NOT NULL AUTO_INCREMENT;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng mp_cart
--
ALTER TABLE mp_cart
  ADD CONSTRAINT mp_cart_ibfk_1 FOREIGN KEY (id_user) REFERENCES mp_user (id);

--
-- Các ràng buộc cho bảng mp_cart_detail
--
ALTER TABLE mp_cart_detail
  ADD CONSTRAINT mp_cart_detail_ibfk_1 FOREIGN KEY (id_cart) REFERENCES mp_cart (id),
  ADD CONSTRAINT mp_cart_detail_ibfk_2 FOREIGN KEY (id_product) REFERENCES mp_product (id);

--
-- Các ràng buộc cho bảng mp_order_detail
--
ALTER TABLE mp_order_detail
  ADD CONSTRAINT mp_order_detail_ibfk_1 FOREIGN KEY (id_order) REFERENCES mp_order (id),
  ADD CONSTRAINT mp_order_detail_ibfk_2 FOREIGN KEY (id_product) REFERENCES mp_product (id);

--
-- Các ràng buộc cho bảng mp_product
--
ALTER TABLE mp_product
  ADD CONSTRAINT mp_product_ibfk_1 FOREIGN KEY (id_type) REFERENCES mp_type_product (id);
SET FOREIGN_KEY_CHECKS=1;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
