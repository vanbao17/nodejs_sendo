-- Tạo cơ sở dữ liệu sendo
CREATE DATABASE IF NOT EXISTS sendo;

-- Sử dụng cơ sở dữ liệu sendo
USE sendo;

-- Tạo bảng danhmuc1
CREATE TABLE IF NOT EXISTS danhmuc1 (
    madm1 INT PRIMARY KEY AUTO_INCREMENT,
    tendm1 NVARCHAR(50)
);

INSERT INTO danhmuc1 (madm1, tendm1) VALUES
(1, N'Thời trang nữ'),
(2, N'Thời trang nam'),
(3, N'Sức khỏe - Làm đẹp'),
(4, N'Giày dép - Túi xách'),
(5, N'Đồng hồ - Trang sức'),
(6, N'Điện thoại - Laptop'),
(7, N'Phụ kiện công nghệ'),
(8, N'Điện gia dụng - Điện máy'),
(9, N'Nhà cửa - Tân trang nhà'),	
(10, N'Tivi - Âm thanh - Camera'),
(11, N'Đời sống - Sách - VPP'),
(12, N'Bách hóa - Thú cưng'),
(13, N'Mẹ & bé - Đồ chơi'),
(14, N'Tiện ích'),
(15, N'Vay tiền mặt'),
(16, N'Vé máy bay - Tour - Dịch vụ'),
(17, N'Ô tô - Xe máy - Xe đạp'),
(18, N'Thể thao - Dã ngoại');
-- Tạo bảng danhmuc2
CREATE TABLE IF NOT EXISTS danhmuc2 (
    madm2 INT PRIMARY KEY AUTO_INCREMENT,
    tendm2 NVARCHAR(50),
    madm1 INT,
    FOREIGN KEY (madm1) REFERENCES danhmuc1(madm1)
);

INSERT INTO danhmuc2 (madm2, tendm2, madm1)
VALUES
(1, N'Đầm, váy', 1),
(2, N'Quần nữ', 1),
(3, N'Phụ kiện thời trang', 1),
(4, N'Phụ kiện tóc nữ', 1),
(5, N'Nón', 1),
(6, N'Áo nữ', 1),
(7, N'Set bộ, jumpsuit', 1),
(8, N'Chân váy', 1),
(9, N'Đồ bơi, đồ đi biển', 1),
(10, N'Áo khoác nữ', 1),
(11, N'Đồ mặc nhà, đồ ngủ', 1),
(12, N'Đồ lót nữ', 1),
(13, N'Quần áo thể thao nữ', 1),
(14, N'Đồ đôi nam nữ', 1),
(15, N'Vải may mặc', 1),
(16, N'Áo sơ mi nam', 2),
(17, N'Áo thun, áo polo nam', 2),
(18, N'Áo khoác nam', 2),
(19, N'Quần dài nam', 2),
(20, N'Quần Jeans nam', 2),
(21, N'Quần short nam', 2),
(22, N'Quần áo big size nam', 2),
(23, N'Đồ lót và đồ ngủ nam', 2),
(24, N'Phụ kiện thời trang', 2),
(25, N'Quần áo thể thao nam', 2),
(26, N'Dưỡng da mặt', 3),
(27, N'Nước hoa', 3),
(28, N'Trang điểm mặt', 3),
(29, N'Trang điểm môi', 3),
(30, N'Trang điểm đôi mắt', 3),
(31, N'Dụng cụ trang điểm', 3),
(32, N'Làm sạch da mặt', 3),
(33, N'Chăm sóc cơ thể', 3),
(34, N'Chăm sóc tóc', 3),
(35, N'Mặt nạ dưỡng da', 3),
(36, N'Thiết bị chăm sóc cá nhân', 3),
(37, N'Thực phẩm chức năng', 3),
(38, N'Mỹ phẩm nam', 3),
(39, N'Lăn, xịt khử mùi cho nam', 3),
(40, N'Mỹ phẩm organic', 3),
(41, N'Chăm sóc sức khỏe', 3),
(42, N'Thiết bị massage', 3),
(43, N'Vật tư y tế', 3),
(44, N'Dụng cụ chuyên khoa', 3),
(45, N'Giày neaker nữ', 4),
(46, N'Giày cao gót nữ', 4),
(47, N'Giày lười, giày mọi nữ', 4),
(48, N'Sandal nữ', 4),
(49, N'Dép nữ', 4),
(50, N'Giày boot nữ', 4),
(51, N'Ví bóp nữ', 4),
(52, N'Túi xách nữ', 4),
(53, N'Giày neaker nam', 4),
(54, N'Giày tây', 4),
(55, N'Giày lười, giày mọi nam', 4),
(56, N'Giày tăng chiều cao nam', 4),
(57, N'Dép nam', 4),
(58, N'Giày boot nam', 4),
(59, N'Ví, bóp nam', 4),
(60, N'Túi xách nam', 4),
(61, N'Giày thể thao', 4),
(62, N'Giày thể thao chuyên dụng', 4),
(63, N'Phụ kiện giày dép', 4),
(64, N'Giày, dép nhựa đi mưa', 4),
(65, N'Balo', 4),
(66, N'Vali - túi xách du lịch', 4),
(67, N'Túi Laptop, ipad, điện thoại', 4);

-- Tạo bảng danhmuc3
CREATE TABLE IF NOT EXISTS danhmuc3 (
    madm3 INT PRIMARY KEY AUTO_INCREMENT,
    tendm3 NVARCHAR(50),
    madm2 INT,
    madm1 INT,
    FOREIGN KEY (madm2) REFERENCES danhmuc2(madm2),
    FOREIGN KEY (madm1) REFERENCES danhmuc1(madm1)
);
INSERT INTO danhmuc3 (madm3, tendm3, madm2,madm1)
VALUES
(1, N'Đầm suông', 1,1),
(2, N'Đầm xòe', 1,1),
(3, N'Đầm maxi', 1,1),
(4, N'Đầm ôm', 1,1),
(5, N'Quần jean nữ', 2,1),
(6, N'Quần baggy', 2,1),
(7, N'Quần legging nữ', 2,1),
(8, N'Quần short nữ', 2,1),
(9, N'Áo sơ mi', 6,1),
(10, N'Áo thun, áo polo', 6,1),
(11, N'Áo kiểu nữ', 6,1),
(12, N'Áo trễ vai', 6,1),
(13, N'Áo khoác chống nắng', 10,1),
(14, N'Áo khoác kiểu nữ', 10,1),
(15, N'Áo khoác vest, blazer', 10,1),
(16, N'Áo khoác jean', 10,1),
(17, N'Bộ đồ bơi', 9,1),
(18, N'Quần áo cover-up', 9,1),
(19, N'Găng tay nữ', 5,1),
(20, N'Tất, vớ nữ', 5,1),
(21, N'Kính râm, kính mát nữ', 5,1),
(22, N'Gọng kính', 5,1),
(23, N'Kính áp tròng', 5,1),
(24, N'Khăn choàng cổ nữ', 5,1),
(25, N'Nơ cổ, cài áo nữ', 5,1),
(26, N'Áo sơ mi nam trơn', 16,2),
(27, N'Áo sơ mi nam caro', 16,2),
(28, N'Áo sơ mi nam họa tiết', 16,2),
(29, N'Áo sơ mi nam kẻ sọc', 16,2),
(30, N'Áo thun dài tay', 17,2),
(31, N'Áo polo nam', 17,2),
(32, N'Áo thun nam ngắn tay', 17,2),
(33, N'Áo hoodie nam', 17,2),
(34, N'Áo khoác dù nam', 18,2),
(35, N'Áo khoác kaki nam', 18,2),
(36, N'Áo khoác nam chống nắng', 18,2),
(37, N'Áo khoác jeans nam', 18,2),
(38, N'Quần kaki nam', 19,2),
(39, N'Quần tây', 19,2),
(40, N'Áo vest nam', 19,2),
(41, N'Bộ đồ vest', 19,2),
(42, N'Bộ quần áo thể thao nam', 25,2),
(43, N'Áo thể thao, tập gym', 25,2),
(44, N'Quần thể thao, tập gym', 25,2),
(45, N'Kính râm, kính mát nam', 24,2),
(46, N'Mũ lưỡi trai', 24,2),
(47, N'Thắt lưng nam', 24,2),
(48, N'Găng tay nam', 24,2),
(49, N'Vớ, tất nam', 24,2),
(50, N'Cà vạt', 24,2),
(51, N'Khăn choàng cổ nam', 24,2),
(52, N'Kem dưỡng da', 26,3),
(53, N'Điều trị, chăm sóc da mụn', 26,3),
(54, N'Kem làm trắng', 26,3),
(55, N'Dưỡng vùng mắt', 26,3),
(56, N'Kem chống nắng', 26,3),
(57, N'Sửa rửa mặt', 32,3),
(58, N'Dụng cụ tai mũi họng', 44,3),
(59, N'Nước hoa hồng, toner', 32,4),
(60, N'Cân sức khỏe', 41,4),
(61, N'Máy đo huyết áp', 41,4),
(62, N'Vớ, đai, nịt y khoa', 41,4),
(63, N'Tóc giả nữ', 34,4),
(64, N'Kem ủ, hấp tóc', 34,4),
(65, N'Gel tạo kiểu tóc', 34,4),
(66, N'Gối massage', 42,4),
(67, N'Máy massage cầm tay', 42,4),
(68, N'Đai massage', 42,4),
(69, N'Lược điện', 36,5),
(70, N'Máy, dụng cụ cạo râu, lông', 36,5),
(71, N'Máy tạo kiểu tóc', 36,5),
(72, N'Máy xông mặt', 36,5),
(73, N'Bao cao su', 39,5),
(74, N'Xe lăn, xe điện', 43,5),
(75, N'Giày búp bê', 48,5),
(76, N'Túi xách tay nữ', 52,5),
(77, N'Túi đeo chéo nữ', 52,5),
(78, N'Túi bản to, đeo vai', 52,5),
(79, N'Túi xách tay cặp nam', 60,6),
(80, N'Túi đeo chéo nam', 60,6),
(81, N'Túi bao tử đeo bụng', 60,6),
(82, N'Giày chạy bộ, tập gym', 61,6),
(83, N'Giày đá bóng', 61,6),
(84, N'Giày cầy lông', 61,6),
(85, N'Balo nam', 65,6),
(86, N'Balo nữ', 65,6);
-- Tạo bảng shop
create table  IF NOT EXISTS Type_Attributes (
	type_attribute_id  INT PRIMARY KEY AUTO_INCREMENT,
    type_name nvarchar(30)
);
insert into Type_Attributes(type_name) values 
('dropDown'),
('checkBox'),
('inputFilter'),
('filterColor');
create table  IF NOT EXISTS Attributes (
	attribute_id  INT PRIMARY KEY AUTO_INCREMENT,
    attribute_name nvarchar(50),
    type_attribute_id int,
    FOREIGN KEY (type_attribute_id) REFERENCES Type_Attributes(type_attribute_id)
);

insert into Attributes(attribute_name,type_attribute_id) values 
('Địa điểm',2),
('Phương thức vận chuyển',2),
('Loại shop',2),
('Ưu đãi',2),
('Khoản giá',3),
('Đánh giá',3),
('Màu sắc',4),
('Phong cách',2),
('Họa tiết',2),
('Chất liệu vãi',2),
('Chiều dài tay áo',2),
('Chuyên dài váy ',2),
('Kích thước ',2),
('Kiểu cổ áo',2);
create table  IF NOT EXISTS Category_Attributes  (
	Category_Attributes_id INT PRIMARY KEY AUTO_INCREMENT,
	madm1   int,
    attribute_id  int,
    FOREIGN KEY (attribute_id) REFERENCES Attributes(attribute_id),
    FOREIGN KEY (madm1) REFERENCES danhmuc1(madm1)
);
insert into Category_Attributes(madm1,attribute_id) values
(1,1),
(1,2),
(1,3),
(1,4),
(1,5),
(1,6),
(1,7),
(1,8),
(1,9),
(1,10),
(1,11),
(1,12),
(1,13),
(1,14);
create table  IF NOT EXISTS Attribute_Values   (
	attribute_value_id    INT PRIMARY KEY AUTO_INCREMENT,
    attribute_id  int,
    value text,
    FOREIGN KEY (attribute_id) REFERENCES Attributes(attribute_id)
);
insert into Attribute_Values(attribute_id,value) values 
(1, 'Hà Nội'),
(1, 'Hồ Chí Minh'),
(1, 'Lâm Đồng'),
(1, 'An Giang'),
(1, 'Bình Dương'),
(1, 'Nam Định'),
(1, 'Cần Thơ'),
(1, 'Bình Thuận'),
(1, 'Đồng Nai'),
(1, 'Nghệ An'),
(2,'Hỏa tốc'),
(2, 'Nhanh'),
(2, 'Tiêu chuẩn'),
(3, 'SendMall'),
(3, 'Shop+'),
(3, 'Shop tự giao'),
(3, 'Shop uy tín'),
(4, "SĂN SALE SHOP"),
(4, "SENDO SELECT"),
(4, "Flash Sale"),
(4, "Siêu Voucher"),
(4, "Mua trước trả sau"),
(4, "Mua gói siêu hời"),
(4, "Mua nhiều giảm giá"),
(4, "Freeship"),
(4, "Khuyến mãi"),
(4, "Khuyến mãi app"),
(4, "Trả góp 0%"),
 (5, 'Dưới 70k'),
(5, '70k - 100k'),
(5, '100k - 200k'),
(5, '200k - 250k'),
(6, '5 sao'),
(6, '4-5 sao'),
(6, '3-5 sao'),
(7, 'rgb(153, 153, 153)'),
(7, 'rgb(255, 0, 0)'),
(7, ' rgb(255, 192, 203)'),
(7, ' rgb(255, 255, 255)'),
(7, 'rgb(0, 0, 0)'),
(7, ' rgb(128, 64, 0)'),
(7, ' rgb(255, 255, 0)'),
(7, ' rgb(254, 241, 206)'),
(7, ' rgb(255, 0, 255)'),
(7, ' rgb(0, 128, 255)'),
(8, 'Dễ thương'),
(8, 'Gợi cảm'),
(8, 'Cổ điển'),
(8, 'Tự do'),
(8, 'Nhẹ nhàng'),
(8, 'Bánh bèo'),
(8, 'Công sở'),
(8, 'Năng động'),
(8, 'Lịch sự'),
(8, 'Khác'),
(9, 'Hoa lá'),
(9, 'Hoạt hình'),
(9, 'Chấm bi'),
(9, 'Caro'),
(9, 'Trơn'),
(9, 'Sọc kẻ'),
(9, 'Ký tự'),
(9, 'Hình động vật'),
(9, 'Họa tiết lạ'),
(9, 'Khác'),
(10, 'Voan'),
(10, 'Khác'),
(10, 'Thun lạnh'),
(10, 'Cát'),
(10, 'Ni'),
(10, 'Thun'),
(10, 'Ren'),
(10, 'Lụa'),
(10, 'Kate'),
(10, 'Cotton thun'),
(11, 'Tay ngắn'),
(11, 'Tay lửng'),
(11, 'Tay dài'),
(11, 'Không tay'),
(12, 'Qua gối'),
(12, 'Chạm/qua mắt cá'),
(12, 'Trên gối'),
(12, 'Ngang gối'),
(13, '5XL'),
(13, 'S'),
(13, 'M'),
(13, '3XL'),
(13, '2XL'),
(13, '27'),
(13, 'L'),
(13, '4XL'),
(13, 'Free size'),
(13, 'XL'),
(14, 'Cổ vuông'),
(14, 'Cổ V'),
(14, 'Khác'),
(14, 'Cổ tim'),
(14, 'Bẹt vai');
CREATE TABLE IF NOT EXISTS shop (
    idShop INT PRIMARY KEY AUTO_INCREMENT,
    tenshop NVARCHAR(50),
    imageShop text,
    imageBannerShop text,
    userFollow INT,
    diachi NVARCHAR(20),
    descriptionText NVARCHAR(100)
);
insert into shop(tenshop,imageShop,imageBannerShop,userFollow,diachi,descriptionText)
values 
('BaoTech','https://assets.manutd.com/AssetPicker/images/0/0/15/106/1010387/HIB_ArticleHeader_copy1628866331672_large.jpg','https://assets.manutd.com/AssetPicker/images/0/0/15/106/1010387/HIB_ArticleHeader_copy1628866331672_large.jpg',100,'Quảng Nam','Uy tín tỷ lệ với chất lượng'),
('MinhTech','https://assets.manutd.com/AssetPicker/images/0/0/15/106/1010387/HIB_ArticleHeader_copy1628866331672_large.jpg','https://assets.manutd.com/AssetPicker/images/0/0/15/106/1010387/HIB_ArticleHeader_copy1628866331672_large.jpg',100,'Đà Nẵng','Uy tín tỷ lệ với chất lượng'),
('TuanTech','https://assets.manutd.com/AssetPicker/images/0/0/15/106/1010387/HIB_ArticleHeader_copy1628866331672_large.jpg','https://assets.manutd.com/AssetPicker/images/0/0/15/106/1010387/HIB_ArticleHeader_copy1628866331672_large.jpg',100,'Ninh Bình','Uy tín tỷ lệ với chất lượng'),
('TrangTech','https://assets.manutd.com/AssetPicker/images/0/0/15/106/1010387/HIB_ArticleHeader_copy1628866331672_large.jpg','https://assets.manutd.com/AssetPicker/images/0/0/15/106/1010387/HIB_ArticleHeader_copy1628866331672_large.jpg',100,'Đăk Lăk','Uy tín tỷ lệ với chất lượng');
-- Tạo bảng itemforCate
CREATE TABLE IF NOT EXISTS itemforCate (
    idItemCate INT PRIMARY KEY AUTO_INCREMENT,
    nameItemCate NVARCHAR(20),
    imagesItem NVARCHAR(30),
    route varchar(70)
);
insert into itemforcate(nameItemCate,imagesItem,route)
values 
('Hóa đơn điện','1.png','thanh-toan-hoa-don'),
('Mua thẻ cào','2.png','the-cao'),
('Mua thẻ game','3.png','the-game'),
('Mua hộ vietlott','4.png','mua-ho-vietlott'),
('Bao bay giá rẻ','5.png','ve-may-bay'),
('Ưu đãi đối tác','6.png','uu-dai-doi-tac'),
('Nạp tiền điện thoại','7.png','nap-tien'),
('Hóa đơn nước ','8.png','thanh-toan-hoa-don'),
('Hóa đơn internet','9.png','thanh-toan-hoa-don'),
('Vé tàu','10.png','ve-tau'),
('Đặt gas online','11.png','gas-online'),
('Đặt nước online','12.png','nuoc-uong');

-- Tạo bảng customers
CREATE TABLE IF NOT EXISTS customers (
    idCustomers INT PRIMARY KEY AUTO_INCREMENT,
    nameCustomers NVARCHAR(50),
	imageUser varchar(50),
    nameUser nvarchar(50),
    phoneNumber varchar(11),
    emailUser varchar(50),
    dateOB date
);
INSERT INTO sendo.customers (idCustomers, nameCustomers, imageUser, nameUser, phoneNumber, emailUser, dateOB)
VALUES (1, 'pvb', '1.jpg', 'pvb', '0904973022', 'baopam21@gmail.com', STR_TO_DATE('17-11-2003', '%d-%m-%Y'));

-- Tạo bảng products
CREATE TABLE IF NOT EXISTS products (
    idProduct INT PRIMARY KEY AUTO_INCREMENT,
    nameProduct text,
    imageProduct text,
    video VARCHAR(100),
    selledQuality int,
    QuanlityExists INT,
    status NVARCHAR(20),
    priceDefault INT,
    priceSale INT,
    datePublic date,
    madm1 int,
    madm2 int,
    madm3 INT,
    idShop INT,
    FOREIGN KEY (idShop) REFERENCES shop(idShop),
    FOREIGN KEY (madm3) REFERENCES danhmuc3(madm3),
    FOREIGN KEY (madm2) REFERENCES danhmuc2(madm2),
    FOREIGN KEY (madm1) REFERENCES danhmuc1(madm1)
);
insert into products(nameProduct,imageProduct,video,selledQuality,QuanlityExists,status,priceDefault,priceSale,datePublic,madm1,madm2,madm3,idShop)
values ('Đèn LED dây 2835 12V cuộn 5m - siêu sáng, Ánh sáng trắng (6000k), vàng (3000k), trung tính (4000k) - 3350_110733356','https://media3.scdn.vn/img4/2023/02_06/H9zZ9nyjgJA2b3PZX9YP_simg_de2fe0_250x250_maxb.jpg',null,100,100,'Đang bán',null,53000,'2003-11-17',2,16,26,1),
('SƠ MI NỮ THANH LỊCH TV64-1020 - TV64-1020','https://media3.scdn.vn/img4/2020/10_16/FqMDu9sImwFBa9FNaY14_simg_de2fe0_250x250_maxb.jpg',null,100,100,'Đang bán',500000,290000,'2003-11-17',1,6,9,1),
('Serum dưỡng da trắng sáng Black Rose - 2980_71251259','https://media3.scdn.vn/img3/2019/2_24/w8qzjS_simg_de2fe0_250x250_maxb.jpg',null,100,100,'Đang bán',null,249000,'2003-11-17',3,26,52,1),
('Quần Jeans Baggy Lưng Thun Nữ_JEANSBAGGY - JEANSBAGGY','https://media3.scdn.vn/img3/2019/6_3/AnzotP_simg_de2fe0_250x250_maxb.jpg',null,100,100,'Đang bán',500000,290000,'2003-11-17',1,6,9,2),
('Đồng Hồ Nam Hegner Dây Kim Loại HW-1655NM , full box, chống xước, chống nước, hàng phân phối chính thức, bảo hành 36T - HW-1655','https://media3.scdn.vn/img4/2020/11_24/HKQPXeatPgPPU0d31L55_simg_de2fe0_250x250_maxb.jpg',null,100,100,'Đang bán',500000,290000,'2003-11-17',1,6,9,1),
('Opppo A31 Ram 6g bộ nhớ 128 gb mới 100% - OPPO 5V - 2A','https://media3.scdn.vn/img4/2022/09_28/jZb9ul7ZnqJGy0ODQ6fz_simg_de2fe0_250x250_maxb.jpg',null,100,100,'Đang bán',500000,290000,'2003-11-17',1,6,9,1),
('Iphone XSMAX 64gb Quốc tế mới 99 % - iPhone màu vàng 123','https://media3.scdn.vn/img4/2022/09_23/EzjLbTj4tu2FBr9R1hoR_simg_de2fe0_250x250_maxb.jpg',null,100,100,'Đang bán',500000,290000,'2003-11-17',1,6,9,1);
-- Tạo bảng rate
CREATE TABLE IF NOT EXISTS rate (
    idrate INT PRIMARY KEY AUTO_INCREMENT,
    idProduct INT,
    FOREIGN KEY (idProduct) REFERENCES products(idProduct)
);
CREATE TABLE IF NOT EXISTS comments (
    idComment INT PRIMARY KEY AUTO_INCREMENT,
    timePublic DATETIME,
    intHelpful INT,
    contentComment NVARCHAR(100),
    imageComment varchar(50),
    idProduct int,
    idCustomers INT,
    rateCount int,
    FOREIGN KEY (idProduct) REFERENCES products(idProduct),
    FOREIGN KEY (idCustomers) REFERENCES customers(idCustomers)
);
insert into comments(timePublic,intHelpful,contentComment,imageComment,idProduct,idCustomers,rateCount)
values('2022-01-09 14:30:00',null,'Gía hơi chát',null,3,null,5);
-- Tạo bảng detailProduct
CREATE TABLE IF NOT EXISTS detailProduct (
    idDetailProduct INT PRIMARY KEY AUTO_INCREMENT,
    idProduct INT,
    descriptionProduct TEXT,
    trademark VARCHAR(10),
    properties text,
    unit NVARCHAR(20),
    descriptionDetail TEXT,
    origin NVARCHAR(30),
    slmua INT,
    idComment int,
    FOREIGN KEY (idProduct) REFERENCES products(idProduct),
    FOREIGN KEY (idComment) REFERENCES comments(idComment)
);
insert into detailProduct(idProduct,descriptionProduct,trademark,properties,unit,descriptionDetail,origin,slmua,idComment)
values (2,'SƠ MI THANH LỊCH TV64-1020Sọc đứng thon gọn mặc lên tự tin hẳnĐƯỢC KIỂM TRA HÀNG KHI NHẬN #Freeship #mienphivanchuyen cho #Bills từ 500k (khi đặt trực tiếp qua shop) Hỗ trợ đổi và trả hàng trong vòng 48hĐịa chỉ : THỜI TRANG TRUNG NIÊN VÀ BIGSIZE ANIT...','OEM','<div className={cx("item")}><span className={cx("title-attribute")}>Chất vải</span><span className={cx("attribute")}>Vải dù</span></div><div className={cx("item")}><span className={cx("title-attribute")}>Chất vải</span><span className={cx("attribute")}>Vải dù</span></div>',null,'
    <div class="product-description">
        <h1>SƠ MI THANH LỊCH TV64-1020</h1>
        <p>Sọc đứng thon gọn mặc lên tự tin hẳn. ĐƯỢC KIỂM TRA HÀNG KHI NHẬN</p>
        <p>#Freeship #mienphivanchuyen cho #Bills từ 500k (khi đặt trực tiếp qua shop)</p>
        <p>Hỗ trợ đổi và trả hàng trong vòng 48h</p>
        <p>Địa chỉ: THỜI TRANG TRUNG NIÊN VÀ BIGSIZE ANITAGREEN<br>74 Trần Bình Trọng, An Phú Ninh Kiều, Cần Thơ.</p>
        <p>Điện thoại: 02923.734.968 (7.30-21.30)</p>
        <p>ZALO/Facetime: 0939.767.189</p>
    </div>

    <div class="size-chart">
        <h2>Size Chart:</h2>
        <ul>
            <li>+ S: Ngực 84 (45-50KG)</li>
            <li>+ M: Ngực 88 (51-55KG)</li>
            <li>+ L: Ngực 92 (56-58KG)</li>
            <li>+ XL: Ngưc 96 (59-62KG)</li>
            <li>+ XXL: Ngực 100(63-65KG)</li>
            <li>+ 3XL: Ngực 104 (66-69KG)</li>
            <li>+ 4XL: Ngực 108 (70-74KG)</li>
            <li>+ 5XL: Ngực 112(75-78KG)</li>
            <li>+ 6XL: Ngực 116-120 (79-85KG)</li>
        </ul>
    </div>
',null,3,1);

CREATE TABLE sizes (
    size_id INT PRIMARY KEY AUTO_INCREMENT,
    size_name VARCHAR(50) NOT NULL
);
create table colors (
	color_id INT PRIMARY KEY AUTO_INCREMENT,
    color_name VARCHAR(50) NOT NULL	
);

CREATE TABLE product_sizes (
    idProduct INT,
    size_id INT,
    PRIMARY KEY (idProduct, size_id),
    FOREIGN KEY (idProduct) REFERENCES products(idProduct),
    FOREIGN KEY (size_id) REFERENCES sizes(size_id)
);
CREATE TABLE product_colors (
    idProduct INT,
    color_id INT,
    PRIMARY KEY (idProduct, color_id),
    FOREIGN KEY (idProduct) REFERENCES products(idProduct),
    FOREIGN KEY (color_id) REFERENCES colors(color_id)
);
CREATE TABLE product_images (
    image_id INT PRIMARY KEY AUTO_INCREMENT,
    idProduct INT,
    image_path VARCHAR(255) NOT NULL,
    FOREIGN KEY (idProduct) REFERENCES products(idProduct) ON DELETE CASCADE ON UPDATE CASCADE
);
-- Tạo bảng addressGetPro
CREATE TABLE IF NOT EXISTS addressGetPro (
    id INT PRIMARY KEY AUTO_INCREMENT,
    tt NVARCHAR(30),
    qh NVARCHAR(30),
    px NVARCHAR(30),
    loaidiachi INT,
    idCustomers INT,
    FOREIGN KEY (idCustomers) REFERENCES customers(idCustomers)
);


-- Tạo bảng inforBasic
CREATE TABLE IF NOT EXISTS inforBasic (
    id INT PRIMARY KEY AUTO_INCREMENT,
    title NVARCHAR(20),
    detail NVARCHAR(30),
    idDetailProduct INT,
    FOREIGN KEY (idDetailProduct) REFERENCES detailProduct(idDetailProduct)
);

-- Tạo bảng imagesforDtail
CREATE TABLE IF NOT EXISTS imagesforDtail (
    id INT PRIMARY KEY AUTO_INCREMENT,
    images VARCHAR(100),
    idDetailProduct INT,
    FOREIGN KEY (idDetailProduct) REFERENCES detailProduct(idDetailProduct)
);


create table usersfollowshop (
	idUFS int primary key auto_increment,
    idShop int,
    idCustomers INT,
    FOREIGN KEY (idCustomers) REFERENCES customers(idCustomers),
	FOREIGN KEY (idShop) REFERENCES shop(idShop)
);

-- Tạo bảng vouchersShop
CREATE TABLE IF NOT EXISTS vouchersShop (
    idVoucher INT PRIMARY KEY AUTO_INCREMENT,
    nameVoucher NVARCHAR(20),
    hsd DATETIME,
    idShop INT,
    FOREIGN KEY (idShop) REFERENCES shop(idShop)
);

-- Tạo bảng detailVoucher
CREATE TABLE IF NOT EXISTS detailVoucher (
    id INT PRIMARY KEY AUTO_INCREMENT,
    timeBegin DATETIME,
    timeEnd DATETIME,
    dkApply NVARCHAR(50),
    idVoucher INT,
    FOREIGN KEY (idVoucher) REFERENCES vouchersShop(idVoucher)
);

-- Tạo bảng cart
CREATE TABLE IF NOT EXISTS cart (
    idCart INT PRIMARY KEY AUTO_INCREMENT,
    idCustomer INT,
    idProduct INT,
    quanlityCart INT,
    FOREIGN KEY (idCustomer) REFERENCES customers(idCustomers),
    FOREIGN KEY (idProduct) REFERENCES products(idProduct)
);
insert into sendo.cart(idCustomer,idProduct,quanlityCart) values (1,2,1);
-- Tạo bảng offer
CREATE TABLE IF NOT EXISTS offer (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nameOffer NVARCHAR(10),
    images NVARCHAR(20),
    idProduct INT,
    FOREIGN KEY (idProduct) REFERENCES products(idProduct)
);

-- Tạo bảng powerForCustomer
CREATE TABLE IF NOT EXISTS powerForCustomer (
    id INT PRIMARY KEY AUTO_INCREMENT,
    namePower NVARCHAR(10),
    images NVARCHAR(20),
    idProduct INT,
    FOREIGN KEY (idProduct) REFERENCES products(idProduct)
);

-- Tạo bảng tienich
CREATE TABLE IF NOT EXISTS tienich (
    id INT PRIMARY KEY AUTO_INCREMENT,
    tentienich NVARCHAR(10),
    images NVARCHAR(10)
);




