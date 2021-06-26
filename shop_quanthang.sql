-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th6 26, 2021 lúc 05:02 AM
-- Phiên bản máy phục vụ: 10.4.19-MariaDB
-- Phiên bản PHP: 7.3.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `shop_quanthang`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `admins`
--

CREATE TABLE `admins` (
  `admin_id` int(10) NOT NULL,
  `admin_name` varchar(255) NOT NULL,
  `admin_email` varchar(255) NOT NULL,
  `admin_password` varchar(255) NOT NULL,
  `admin_image` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `admins`
--

INSERT INTO `admins` (`admin_id`, `admin_name`, `admin_email`, `admin_password`, `admin_image`) VALUES
(2, 'Quan', 'quanbeovodoi@gmail.com', '123', '170118479_721278258540816_2432540928943801251_n.jpg');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `cart`
--

CREATE TABLE `cart` (
  `cart_id` int(10) NOT NULL,
  `product_id` int(10) NOT NULL,
  `ip_add` varchar(255) NOT NULL,
  `p_size` varchar(255) NOT NULL,
  `p_price` varchar(255) NOT NULL,
  `p_quantity` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `categories`
--

CREATE TABLE `categories` (
  `category_id` int(10) NOT NULL,
  `category_title` varchar(255) NOT NULL,
  `category_desc` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `categories`
--

INSERT INTO `categories` (`category_id`, `category_title`, `category_desc`) VALUES
(2, 'Nữ', ''),
(3, 'Nam', '');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `coupons`
--

CREATE TABLE `coupons` (
  `coupon_id` int(100) NOT NULL,
  `product_id` int(100) NOT NULL,
  `coupon_title` varchar(255) NOT NULL,
  `coupon_price` varchar(255) NOT NULL,
  `coupon_code` varchar(255) NOT NULL,
  `coupon_limit` int(100) NOT NULL,
  `coupon_used` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `coupons`
--

INSERT INTO `coupons` (`coupon_id`, `product_id`, `coupon_title`, `coupon_price`, `coupon_code`, `coupon_limit`, `coupon_used`) VALUES
(9, 31, 'Mã giảm giá cho vona Dress', '500.000', 'abc', 4, 3);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `customers`
--

CREATE TABLE `customers` (
  `customer_id` int(10) NOT NULL,
  `customer_name` varchar(255) NOT NULL,
  `customer_email` varchar(255) NOT NULL,
  `customer_phone` varchar(255) NOT NULL,
  `customer_address` varchar(255) NOT NULL,
  `customer_password` varchar(255) NOT NULL,
  `customer_image` text NOT NULL,
  `customer_ip` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `customers`
--

INSERT INTO `customers` (`customer_id`, `customer_name`, `customer_email`, `customer_phone`, `customer_address`, `customer_password`, `customer_image`, `customer_ip`) VALUES
(25, 'Quan', 'quanbeovodoi@gmail.com', '0915327755', 'Ký túc xa đại học Điện Lực', '$2y$10$9WrrZ4MujAl7SNFFVg8rp.HlSphZ9Xgicnj6BEAajeWlVtjNu.A92', 'quan.jpg', '::1');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `customer_orders`
--

CREATE TABLE `customer_orders` (
  `order_id` int(10) NOT NULL,
  `customer_id` int(10) NOT NULL,
  `due_amount` int(100) NOT NULL,
  `invoice_no` int(100) NOT NULL,
  `product_id` int(10) NOT NULL,
  `product_size` varchar(255) NOT NULL,
  `product_quantity` int(10) NOT NULL,
  `order_date` date NOT NULL,
  `order_status` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `customer_orders`
--

INSERT INTO `customer_orders` (`order_id`, `customer_id`, `due_amount`, `invoice_no`, `product_id`, `product_size`, `product_quantity`, `order_date`, `order_status`) VALUES
(124, 25, 499, 1403720672, 28, 'Trung Bình', 1, '2021-06-26', 'Complete'),
(127, 25, 897, 1427322852, 33, 'Trung Bình', 3, '2021-06-26', 'Pending');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `products`
--

CREATE TABLE `products` (
  `product_id` int(10) NOT NULL,
  `product_category_id` int(10) NOT NULL,
  `category_id` int(10) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `product_title` varchar(255) NOT NULL,
  `product_price` varchar(255) NOT NULL,
  `product_image_1` text NOT NULL,
  `product_image_2` text NOT NULL,
  `product_image_3` text NOT NULL,
  `product_keywords` varchar(255) NOT NULL,
  `product_description` varchar(255) NOT NULL,
  `product_label` text NOT NULL,
  `product_sale` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `products`
--

INSERT INTO `products` (`product_id`, `product_category_id`, `category_id`, `date`, `product_title`, `product_price`, `product_image_1`, `product_image_2`, `product_image_3`, `product_keywords`, `product_description`, `product_label`, `product_sale`) VALUES
(19, 1, 2, '2021-06-25 14:33:53', 'Váy Kota', '690.000', 'product_images/72126862_2399196567007918_36652662493544448_o.jpg', 'product_images/60337718_2294678607459715_7587335581248520192_o.jpg', 'product_images/72300551_2399191497008425_479029857280327680_o.jpg', 'dress, vay', '<p>Thanh lịch v&agrave; nữ t&iacute;nh với mẫu đầm Kota Dress . Tone m&agrave;u nude với những đường b&egrave;o tinh tế &ocirc;m gọn v&oacute;c d&aacute;ng vừa sang trọng vừa ph&ugrave; hợp với mọi v&oacute;c d&aacute;ng .</p>', 'sale', '590.000'),
(21, 9, 2, '2021-06-25 16:22:44', 'SƠ MI HỌA TIẾT ', '595.000', 'product_images/6_18e55a1a970344eb92c02fda152330d7_master.webp', 'product_images/sm019221212192060457p595____q318721722111100447p993 (1).webp', 'product_images/sm019221212192060457p595____q318721722111100447p993.webp', 'áo', '<p><span style=\"color: #070707; font-family: gmv_din_pro;\"><span style=\"font-size: 14px;\">vải tổng hợp cao cấp mềm mại, kh&ocirc;ng nhăn, bền m&agrave;u.sơ mi thiết kế ngắn tay, cố phối nơ, tone m&agrave;u xanh l&aacute; kết hợp họa tiết, tay bồng nhẹ&lt;', 'sale', '297.000'),
(23, 9, 2, '2021-06-25 14:03:40', 'ÁO NỈ NỮ TAY PHỒNG', '349.000', 'product_images/6tw20c001-se172-1-thumb.jpg', 'product_images/6tw20c001-se172-3.jpg', 'product_images/6tw20c001-sk010-s.jpg', 'áo', '<h1><span style=\"font-size: 14px;\">M&Ocirc; TẢ</span></h1>\r\n<p><span style=\"font-size: 14px;\">&Aacute;o nỉ d&aacute;ng regular</span></p>\r\n<p><span style=\"font-size: 14px;\">Cổ tr&ograve;n, d&agrave;i tay, ống tay rộng tạo phồng</span></p>', 'new', ''),
(24, 9, 2, '2021-06-25 13:55:48', 'ÁO CHỐNG NẮNG NỮ CÓ MŨ', '399.000', 'product_images/c1.jpg', 'product_images/c2.jpg', 'product_images/c3.jpg', 'top skirt', '<p><span style=\"font-size: 14px;\">M&Ocirc; TẢ</span></p>\r\n<p><span style=\"font-size: 14px;\">&Aacute;o kho&aacute;c chống nắng chất liệu polyester pha, antiUV</span></p>\r\n<p><span style=\"font-size: 14px;\">D&aacute;ng regular c&oacute; mũ luồn d&acirc;y dệt', 'sale', '290.000'),
(25, 1, 2, '2021-06-25 14:13:53', 'VÁY LIỀN NỮ KẺ NGANG', '399.000', 'product_images/6ds21s018-pb276-s-1.jpg', 'product_images/6ds21s018-pb276-s-2.jpg', 'product_images/6ds21s018-pk089-1.jpg', 'dress, vay', '<p><span style=\"font-size: 14px;\">V&aacute;y liền chất liệu cotton USA c&oacute; co gi&atilde;n</span></p>\r\n<p><span style=\"font-size: 14px;\">D&aacute;ng đứng, cổ bẻ, tay cộc.</span></p>', 'new', ''),
(26, 9, 2, '2021-06-25 14:23:38', 'Áo thun POLO nữ tay lỡ có cổ phông', '68.000', 'product_images/181d4e633f1c8e6f2a2642a8741fe2a7.jpg', 'product_images/480c63f388d668d6e904742bb7402e98.jpg', 'product_images/2dc82b3c9031a7748e1feea4f5679e49.jpg', 'áo', '<p><span style=\"font-size: 14px;\">&Aacute;o POLO l&agrave; mẫu &aacute;o thun tay lỡ c&oacute; cổ form rộng. Tương tự như &aacute;o thun tay lỡ kh&ocirc;ng cổ, &aacute;o polo dễ mặc, dễ phối đồ, ph&ugrave; hợp với tất cả ho&agrave;n cảnh.</span></p>', 'sale', '36.000'),
(27, 9, 2, '2021-06-25 14:00:32', 'ÁO PHÔNG NỮ COTTON USA IN HÌNH', '300.000', 'product_images/6ts21s030-sk010-1.jpg', 'product_images/6ts21s030-sk010-2-thumb.jpg', 'product_images/6ts21s030-sk010-3.jpg', 'top skirt', '<p><span style=\"color: #333f48; font-family: Montserrat, sans-serif; font-size: 12px;\">&Aacute;o ph&ocirc;ng chất liệu cotton USA in princess</span><br style=\"box-sizing: border-box; color: #333f48; font-family: Montserrat, sans-serif; font-size: 12px;\" /', 'sale', '260.000'),
(28, 1, 2, '2021-06-25 13:48:38', 'VÁY LIỀN NỮ TAY DÀI', '499.000', 'product_images/c1.jpg', 'product_images/c2.jpg', 'product_images/c3.jpg', 'Dress', '<p><span style=\"font-size: 14px;\">M&Ocirc; TẢ</span></p>\r\n<p><span style=\"font-size: 14px;\">V&aacute;y liền chất liệu 100% cotton kẻ caro</span></p>\r\n<p><span style=\"font-size: 14px;\">D&aacute;ng sơ mi, cố đức, tay d&agrave;i, xẻ 2 b&ecirc;n.</span></p>', 'new', ''),
(30, 1, 2, '2020-06-19 00:31:49', 'Dada Dress', '690.000', 'product_images/97478285_2596228327304740_6979566454387507200_o (1).jpg', 'product_images/96809365_2596228173971422_4155707954999328768_o.jpg', 'product_images/96809365_2596228173971422_4155707954999328768_o.jpg', 'dress, vay', '<p>BST mới nhất của Lalla lấy cảm hứng từ bộ phim Crash Landing on You - Hạ c&aacute;nh nơi anh ✈️ với h&igrave;nh ảnh người phụ nữ hiện đại, năng động v&agrave; đầy quyền lực. Chất tơ xốp H&agrave;n b&ecirc;n ngo&agrave;i v&agrave; đầm lụa l&oacute;t b&a', 'sale', '590.000'),
(31, 1, 2, '2021-06-25 13:41:40', ' VÁY LIỀN NỮ CHUN EO', '399.000', 'product_images/b1.jpg', 'product_images/b2.jpg', 'product_images/b3.jpg', 'dress, vay', '<p><span style=\"font-size: 14px;\">M&Ocirc; TẢ</span></p>\r\n<p><span style=\"font-size: 14px;\">V&aacute;y liền chất liệu polyester pha</span></p>\r\n<p><span style=\"font-size: 14px;\">D&aacute;ng fit &amp; flare, cổ tr&ograve;n, tay cộc.</span></p>', 'new', ''),
(32, 9, 2, '2021-06-25 13:36:06', 'ÁO PHÔNG UNISEX NGƯỜI LỚN TRƠN MÀU', '299.000', 'product_images/a1.jpg', 'product_images/a2.jpg', 'product_images/a3.jpg', 'áo', '<p><span style=\"font-size: 14px;\">M&Ocirc; TẢ</span></p>\r\n<p><span style=\"font-size: 14px;\">&Aacute;o ph&ocirc;ng chất liệu cotton trơn.</span></p>\r\n<p><span style=\"font-size: 14px;\">D&aacute;ng regular, cổ tr&ograve;n, tay cộc.</span></p>', 'sale', '99.000'),
(33, 9, 2, '2021-06-21 13:19:03', 'ÁO PHÔNG NỮ RÚT DÂY SƯỜN', '299.000', 'product_images/1.jpg', 'product_images/2.jpg', 'product_images/3.jpg', 'áo', '<p><span style=\"font-size: 14px;\">M&Ocirc; TẢ</span></p>\r\n<p><span style=\"font-size: 14px;\">&Aacute;o ph&ocirc;ng chất liệu polyester pha</span></p>\r\n<p><span style=\"font-size: 14px;\">D&aacute;ng regular, cổ tr&ograve;n, tay cộc, r&uacute;t d&acirc;y sườn', 'new', '');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product_categories`
--

CREATE TABLE `product_categories` (
  `product_category_id` int(10) NOT NULL,
  `product_category_title` varchar(255) NOT NULL,
  `product_category_desc` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `product_categories`
--

INSERT INTO `product_categories` (`product_category_id`, `product_category_title`, `product_category_desc`) VALUES
(1, 'Dress', ''),
(9, 'Top + Skirt', '');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `slides`
--

CREATE TABLE `slides` (
  `slide_id` int(10) NOT NULL,
  `slide_title` varchar(255) NOT NULL,
  `slide_description` varchar(255) NOT NULL,
  `slide_image` text NOT NULL,
  `slide_url` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `slides`
--

INSERT INTO `slides` (`slide_id`, `slide_title`, `slide_description`, `slide_image`, `slide_url`) VALUES
(2, 'QtShop', 'Phong cách thời trang mới', 'slides_images/Thiết-kế-shop-quần-áo-43.jpg', ''),
(14, 'QtShop', 'Giảm giá 50 % mua sắm ngay', 'slides_images/Thiết-kế-shop-quần-áo-45.jpg', ''),
(15, '', '', 'slides_images/Thiết-kế-shop-quần-áo-47.jpg', '');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`admin_id`);

--
-- Chỉ mục cho bảng `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`cart_id`);

--
-- Chỉ mục cho bảng `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`category_id`);

--
-- Chỉ mục cho bảng `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`coupon_id`);

--
-- Chỉ mục cho bảng `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`customer_id`);

--
-- Chỉ mục cho bảng `customer_orders`
--
ALTER TABLE `customer_orders`
  ADD PRIMARY KEY (`order_id`);

--
-- Chỉ mục cho bảng `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`);

--
-- Chỉ mục cho bảng `product_categories`
--
ALTER TABLE `product_categories`
  ADD PRIMARY KEY (`product_category_id`);

--
-- Chỉ mục cho bảng `slides`
--
ALTER TABLE `slides`
  ADD PRIMARY KEY (`slide_id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `admins`
--
ALTER TABLE `admins`
  MODIFY `admin_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `cart`
--
ALTER TABLE `cart`
  MODIFY `cart_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT cho bảng `categories`
--
ALTER TABLE `categories`
  MODIFY `category_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `coupons`
--
ALTER TABLE `coupons`
  MODIFY `coupon_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT cho bảng `customers`
--
ALTER TABLE `customers`
  MODIFY `customer_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT cho bảng `customer_orders`
--
ALTER TABLE `customer_orders`
  MODIFY `order_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=128;

--
-- AUTO_INCREMENT cho bảng `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT cho bảng `product_categories`
--
ALTER TABLE `product_categories`
  MODIFY `product_category_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT cho bảng `slides`
--
ALTER TABLE `slides`
  MODIFY `slide_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
