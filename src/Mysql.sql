-- Tạo cơ sở dữ liệu sendo
-- CREATE DATABASE IF NOT EXISTS sendo;

-- Sử dụng cơ sở dữ liệu sendo
USE psomwqdghosting_sendo;

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
    type varchar(50),
    FOREIGN KEY (type_attribute_id) REFERENCES Type_Attributes(type_attribute_id)
);

insert into Attributes(attribute_name,type_attribute_id,type) values 
('Phương thức vận chuyển',2,'checkbox'),
('Loại shop',2,'checkbox'),
('Ưu đãi',2,'checkbox'),
('Khoản giá',3,'checkbox'),
('Đánh giá',3,'checkbox'),
('Màu sắc',4,'dropbox'),
('Phong cách',2,'checkbox'),
('Họa tiết',2,'checkbox'),
('Chất liệu vãi',2,'checkbox'),
('Chiều dài tay áo',2,'checkbox'),
('Chuyên dài váy ',2,'checkbox'),
('Kích thước ',2,'dropbox'),
('Kiểu cổ áo',2,'checkbox'),
('Đơn vị',2,'dropbox');
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
(1,'Hỏa tốc'),
(1, 'Nhanh'),
(1, 'Tiêu chuẩn'),
(2, 'SendMall'),
(2, 'Shop+'),
(2, 'Shop tự giao'),
(2, 'Shop uy tín'),
(3, 'SĂN SALE SHOP'),
(3, 'SENDO SELECT'),
(3, "Flash Sale"),
(3, "Siêu Voucher"),
(3, "Mua trước trả sau"),
(3, "Mua gói siêu hời"),
(3, "Mua nhiều giảm giá"),
(3, "Freeship"),
(3, "Khuyến mãi"),
(3, "Khuyến mãi app"),
(3, "Trả góp 0%"),
(4, 'Dưới 70k'),
(4, '70k - 100k'),
(4, '100k - 200k'),
(4, '200k - 250k'),
(5, '5 sao'),
(5, '4-5 sao'),
(5, '3-5 sao'),
(6, 'rgb(153, 153, 153)'),
(6, 'rgb(255, 0, 0)'),
(6, ' rgb(255, 192, 203)'),
(6, ' rgb(255, 255, 255)'),
(6, 'rgb(0, 0, 0)'),
(6, ' rgb(128, 64, 0)'),
(6, ' rgb(255, 255, 0)'),
(6, ' rgb(254, 241, 206)'),
(6, ' rgb(255, 0, 255)'),
(6, ' rgb(0, 128, 255)'),
(7, 'Dễ thương'),
(7, 'Gợi cảm'),
(7, 'Cổ điển'),
(7, 'Tự do'),
(7, 'Nhẹ nhàng'),
(7, 'Bánh bèo'),
(7, 'Công sở'),
(7, 'Năng động'),
(7, 'Lịch sự'),
(7, 'Khác'),
(8, 'Hoa lá'),
(8, 'Hoạt hình'),
(8, 'Chấm bi'),
(8, 'Caro'),
(8, 'Trơn'),
(8, 'Sọc kẻ'),
(8, 'Ký tự'),
(8, 'Hình động vật'),
(8, 'Họa tiết lạ'),
(8, 'Khác'),
(9, 'Voan'),
(9, 'Khác'),
(9, 'Thun lạnh'),
(9, 'Cát'),
(9, 'Ni'),
(9, 'Thun'),
(9, 'Ren'),
(9, 'Lụa'),
(9, 'Kate'),
(9, 'Cotton thun'),
(10, 'Tay ngắn'),
(10, 'Tay lửng'),
(10, 'Tay dài'),
(10, 'Không tay'),
(11, 'Qua gối'),
(11, 'Chạm/qua mắt cá'),
(11, 'Trên gối'),
(11, 'Ngang gối'),
(12, '5XL'),
(12, 'S'),
(12, 'M'),
(12, '3XL'),
(12, '2XL'),
(12, '27'),
(12, 'L'),
(12, '4XL'),
(12, 'Free size'),
(12, 'XL'),
(13, 'Cổ vuông'),
(13, 'Cổ V'),
(13, 'Khác'),
(13, 'Cổ tim'),
(13, 'Bẹt vai'),
(14, 'Cái'),
(14, 'Bộ'),
(14, 'Chiếc'),
(14, 'Đôi'),
(14, 'Hộp'),
(14, 'Cuốn'),
(14, 'Chai'),
(14, 'Thùng');

CREATE TABLE IF NOT EXISTS shop (
    idShop INT PRIMARY KEY AUTO_INCREMENT,
    phone nvarchar(20),
    password nvarchar(50),
    tenshop NVARCHAR(50),
    imageShop text,
    imageBannerShop text,
    userFollow INT DEFAULT 0,
    diachi NVARCHAR(20),
    descriptionText NVARCHAR(100)
);
insert into shop(tenshop,imageShop,imageBannerShop,userFollow,diachi,descriptionText,password)
values 
('BaoTech','https://assets.manutd.com/AssetPicker/images/0/0/15/106/1010387/HIB_ArticleHeader_copy1628866331672_large.jpg','https://assets.manutd.com/AssetPicker/images/0/0/15/106/1010387/HIB_ArticleHeader_copy1628866331672_large.jpg',100,'Quảng Nam','Uy tín tỷ lệ với chất lượng','abc123'),
('MinhTech','https://assets.manutd.com/AssetPicker/images/0/0/15/106/1010387/HIB_ArticleHeader_copy1628866331672_large.jpg','https://assets.manutd.com/AssetPicker/images/0/0/15/106/1010387/HIB_ArticleHeader_copy1628866331672_large.jpg',100,'Đà Nẵng','Uy tín tỷ lệ với chất lượng','abc123'),
('TuanTech','https://assets.manutd.com/AssetPicker/images/0/0/15/106/1010387/HIB_ArticleHeader_copy1628866331672_large.jpg','https://assets.manutd.com/AssetPicker/images/0/0/15/106/1010387/HIB_ArticleHeader_copy1628866331672_large.jpg',100,'Ninh Bình','Uy tín tỷ lệ với chất lượng','abc123'),
('TrangTech','https://assets.manutd.com/AssetPicker/images/0/0/15/106/1010387/HIB_ArticleHeader_copy1628866331672_large.jpg','https://assets.manutd.com/AssetPicker/images/0/0/15/106/1010387/HIB_ArticleHeader_copy1628866331672_large.jpg',100,'Đăk Lăk','Uy tín tỷ lệ với chất lượng','abc123');
-- Tạo bảng itemforCate
CREATE TABLE IF NOT EXISTS shopSendo  (
    shopmail_id  INT PRIMARY KEY AUTO_INCREMENT,
    idShop int,
    taxcode varchar(40),
    cccd varchar(50),
    email NVARCHAR(50),
     FOREIGN KEY (idShop) REFERENCES shop(idShop)
);
CREATE TABLE IF NOT EXISTS shopSendmail  (
    shopmail_id  INT PRIMARY KEY AUTO_INCREMENT,
    idShop int,
	nameshopowner NVARCHAR(50),
    namecompany NVARCHAR(50),
    taxcode varchar(40),
    businesstype nvarchar(50),
    brandtype nvarchar(50),
    url varchar(50),
    codebusiness varchar(50),
    cccd varchar(50),
    email NVARCHAR(50),
    FOREIGN KEY (idShop) REFERENCES shop(idShop)
);
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
    password nvarchar(100),
    googleId varchar(100), 
    emailUser varchar(50),
    created_at date,
	last_login date,
    dateOB date
);
INSERT INTO customers (idCustomers, nameCustomers, imageUser, nameUser, phoneNumber,password, emailUser, dateOB)
VALUES (1, 'pvb', '1.jpg', 'pvb', '0904973022','abc123', 'baopam21@gmail.com', STR_TO_DATE('17-11-2003', '%d-%m-%Y'));

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
create table if not exists products_attribute (
	id_Attribute_Products INT PRIMARY KEY AUTO_INCREMENT,
    idProduct int,
	attribute_id int,
	value VARCHAR(255),
    FOREIGN KEY (idProduct) REFERENCES products(idProduct),
    FOREIGN KEY (attribute_id) REFERENCES attributes(attribute_id)
);
CREATE TABLE Images (
    image_id INT PRIMARY KEY AUTO_INCREMENT,
    idProduct INT,
    imageProduct VARCHAR(255),
    is_main BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (idProduct) REFERENCES products(idProduct)
);
CREATE TABLE Videos (
    video_id INT PRIMARY KEY AUTO_INCREMENT,
    idProduct INT,
    video VARCHAR(255),
    FOREIGN KEY (idProduct) REFERENCES products(idProduct)
);
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
    dateBegin date,
    dateEnd date,
    properties TEXT,
    unit NVARCHAR(20),
    descriptionDetail TEXT,
    origin NVARCHAR(30),
    mass int,
    slmua INT,
    length int,
    large int,
    height int,
    idComment int,
    state boolean,
    FOREIGN KEY (idProduct) REFERENCES products(idProduct),
    FOREIGN KEY (idComment) REFERENCES comments(idComment)
);

insert into detailProduct(idProduct,descriptionProduct,trademark,properties,unit,descriptionDetail,origin,mass,slmua,idComment,dateBegin,dateEnd,length,height,large,state)
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
',null,700,3,1,STR_TO_DATE('17-11-2003', '%d-%m-%Y'),STR_TO_DATE('17-11-2024', '%d-%m-%Y'),5,5,5,true);

CREATE TABLE sizes (
    size_id INT PRIMARY KEY AUTO_INCREMENT,
    size_name VARCHAR(50) NOT NULL
);
INSERT INTO sizes (size_id, size_name) VALUES (1, 'XS');
INSERT INTO sizes (size_id, size_name) VALUES (2, 'S');
INSERT INTO sizes (size_id, size_name) VALUES (3, 'M');
INSERT INTO sizes (size_id, size_name) VALUES (4, 'L');
INSERT INTO sizes (size_id, size_name) VALUES (5, 'XL');
INSERT INTO sizes (size_id, size_name) VALUES (6, 'XXL');
INSERT INTO sizes (size_id, size_name) VALUES (7, '35');
INSERT INTO sizes (size_id, size_name) VALUES (8, '36');
INSERT INTO sizes (size_id, size_name) VALUES (9, '37');
INSERT INTO sizes (size_id, size_name) VALUES (10, '38');
INSERT INTO sizes (size_id, size_name) VALUES (11, '39');
INSERT INTO sizes (size_id, size_name) VALUES (12, '40');
INSERT INTO sizes (size_id, size_name) VALUES (13, '41');
INSERT INTO sizes (size_id, size_name) VALUES (14, '42');
INSERT INTO sizes (size_id, size_name) VALUES (15, '43');
INSERT INTO sizes (size_id, size_name) VALUES (16, '44');
create table colors (
	color_id INT PRIMARY KEY AUTO_INCREMENT,
    color_name VARCHAR(50) NOT NULL	
);
INSERT INTO colors (color_name) VALUES ('Red');
INSERT INTO colors (color_name) VALUES ('Green');
INSERT INTO colors (color_name) VALUES ('Blue');
INSERT INTO colors (color_name) VALUES ('Black');
INSERT INTO colors (color_name) VALUES ('White');
INSERT INTO colors (color_name) VALUES ('Yellow');
INSERT INTO colors (color_name) VALUES ('Cyan');
INSERT INTO colors (color_name) VALUES ('Magenta');
INSERT INTO colors (color_name) VALUES ('Maroon');
INSERT INTO colors (color_name) VALUES ('Olive');
INSERT INTO colors (color_name) VALUES ('Lime');
INSERT INTO colors (color_name) VALUES ('Navy');
INSERT INTO colors (color_name) VALUES ('Purple');
INSERT INTO colors (color_name) VALUES ('Teal');
INSERT INTO colors (color_name) VALUES ('Silver');
INSERT INTO colors (color_name) VALUES ('Gray');
INSERT INTO colors (color_name) VALUES ('Orange');
INSERT INTO colors (color_name) VALUES ('Brown');
INSERT INTO colors (color_name) VALUES ('Pink');
INSERT INTO colors (color_name) VALUES ('Gold');
INSERT INTO colors (color_name) VALUES ('Beige');
INSERT INTO colors (color_name) VALUES ('Coral');
INSERT INTO colors (color_name) VALUES ('Turquoise');
INSERT INTO colors (color_name) VALUES ('Violet');
INSERT INTO colors (color_name) VALUES ('Indigo');
INSERT INTO colors (color_name) VALUES ('Mint');
INSERT INTO colors (color_name) VALUES ('Lavender');
INSERT INTO colors (color_name) VALUES ('Salmon');
INSERT INTO colors (color_name) VALUES ('Crimson');
INSERT INTO colors (color_name) VALUES ('Khaki');
INSERT INTO colors (color_name) VALUES ('Peach');
INSERT INTO colors (color_name) VALUES ('Azure');
INSERT INTO colors (color_name) VALUES ('Ivory');
INSERT INTO colors (color_name) VALUES ('Chartreuse');

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
    value_voucher int ,
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
insert into cart(idCustomer,idProduct,quanlityCart) values (1,2,1);
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
CREATE TABLE IF NOT EXISTS size_cate (
    id_size_cate INT PRIMARY KEY AUTO_INCREMENT,
    madm1 int,
    size_id int,
    FOREIGN KEY (madm1) REFERENCES danhmuc1(madm1),
    FOREIGN KEY (size_id) REFERENCES sizes(size_id)
);
-- Thời trang nữ (dm1 = 1) liên kết với size quần áo từ XS đến XXL
INSERT INTO size_cate (madm1, size_id) VALUES (1, 1);  -- XS
INSERT INTO size_cate (madm1, size_id) VALUES (1, 2);  -- S
INSERT INTO size_cate (madm1, size_id) VALUES (1, 3);  -- M
INSERT INTO size_cate (madm1, size_id) VALUES (1, 4);  -- L
INSERT INTO size_cate (madm1, size_id) VALUES (1, 5);  -- XL
INSERT INTO size_cate (madm1, size_id) VALUES (1, 6);  -- XXL
-- Thời trang nam (madm1 = 2) liên kết với size quần áo từ XS đến XXL
INSERT INTO size_cate (madm1, size_id) VALUES (2, 1);  -- XS
INSERT INTO size_cate (madm1, size_id) VALUES (2, 2);  -- S
INSERT INTO size_cate (madm1, size_id) VALUES (2, 3);  -- M
INSERT INTO size_cate (madm1, size_id) VALUES (2, 4);  -- L
INSERT INTO size_cate (madm1, size_id) VALUES (2, 5);  -- XL
INSERT INTO size_cate (madm1, size_id) VALUES (2, 6);  -- XXL
-- Giày dép - Túi xách (madm1 = 4) liên kết với size giày từ 35 đến 44
INSERT INTO size_cate (madm1, size_id) VALUES (4, 7);  -- 35
INSERT INTO size_cate (madm1, size_id) VALUES (4, 8);  -- 36
INSERT INTO size_cate (madm1, size_id) VALUES (4, 9);  -- 37
INSERT INTO size_cate (madm1, size_id) VALUES (4, 10); -- 38
INSERT INTO size_cate (madm1, size_id) VALUES (4, 11); -- 39
INSERT INTO size_cate (madm1, size_id) VALUES (4, 12); -- 40
INSERT INTO size_cate (madm1, size_id) VALUES (4, 13); -- 41
INSERT INTO size_cate (madm1, size_id) VALUES (4, 14); -- 42
INSERT INTO size_cate (madm1, size_id) VALUES (4, 15); -- 43
INSERT INTO size_cate (madm1, size_id) VALUES (4, 16); -- 44

CREATE TABLE IF NOT EXISTS valuesAttr_product (
    id_valuesAttr_product INT PRIMARY KEY AUTO_INCREMENT,
    idProduct int,
    attribute_value_id int,
    FOREIGN KEY (idProduct) REFERENCES products(idProduct),
    FOREIGN KEY (attribute_value_id) REFERENCES Attribute_Values(attribute_value_id)
);
CREATE TABLE delivery_methods (
    id INT AUTO_INCREMENT PRIMARY KEY,
    method_name VARCHAR(255) NOT NULL,
    description TEXT NOT NULL,
    estimated_delivery_time VARCHAR(255) NOT NULL,
    applicable_area VARCHAR(255) NOT NULL
);

-- Tạo bảng phụ cho các tùy chọn ngày giao hàng
CREATE TABLE delivery_options (
    id INT AUTO_INCREMENT PRIMARY KEY,
    delivery_method_id INT,
    option_name VARCHAR(255) NOT NULL,
    description TEXT NOT NULL,
    FOREIGN KEY (delivery_method_id) REFERENCES delivery_methods(id)
);

-- Chèn dữ liệu mẫu vào bảng chính
INSERT INTO delivery_methods (method_name, description, estimated_delivery_time, applicable_area)
VALUES
    ('Chuyển phát tiêu chuẩn', 'Hình thức giao hàng phổ biến với giá cước hợp lý.', '1-3 ngày', 'Toàn quốc'),
    ('Chuyển phát hỏa tốc', 'Hình thức giao hàng nhanh nhất, phù hợp với nhu cầu nhận hàng ngay trong ngày.', 'Trong ngày hoặc ngày kế tiếp', 'Nội thành Hà Nội, TP.HCM (không bao gồm các huyện Bình Chánh, Cần Giờ, Củ Chi, Hóc Môn)'),
    ('Giao qua bưu cục', 'Dành cho các shop có địa chỉ kho hàng tại TP.HCM và Hà Nội. Shop chủ động mang hàng hóa đến điểm gửi.', '1-3 ngày', 'TP.HCM, Hà Nội'),
    ('Sendo vận chuyển', 'Hàng hóa được vận chuyển bởi các đối tác vận chuyển của ', '1-3 ngày', 'Toàn quốc'),
    ('Shop tự vận chuyển', 'Áp dụng cho các mặt hàng cồng kềnh, nội thất lớn. Shop tự vận chuyển hàng hóa đến người mua.', 'Tùy thuộc vào shop', 'Toàn quốc');

-- Chèn dữ liệu mẫu vào bảng phụ
INSERT INTO delivery_options (delivery_method_id, option_name, description)
VALUES
    (1, 'Thứ 2 - Thứ 6 (8-18h)', 'Phù hợp với địa chỉ văn phòng/cơ quan.'),
    (1, 'Cả tuần (trừ CN & ngày lễ)', 'Phù hợp với địa chỉ nhà riêng, luôn có người nhận. Giao hàng từ 8:00 - 18:00'),
    (2, 'Thứ 2 - Thứ 6', 'Giao hàng trong ngày hoặc ngày kế tiếp.'),
    (2, 'Cả tuần', 'Giao hàng trong ngày hoặc ngày kế tiếp, kể cả cuối tuần.'),
    (3, 'Thứ 2 - Thứ 6', 'Shop mang hàng đến điểm gửi.'),
    (4, 'Thứ 2 - Thứ 6 (8-18h)', 'Giao hàng từ 8:00 - 18:00'),
    (4, 'Cả tuần (trừ CN & ngày lễ)', 'Giao hàng từ 8:00 - 18:00, trừ Chủ Nhật và ngày lễ.'),
    (5, 'Tùy thuộc vào shop', 'Shop tự vận chuyển hàng hóa đến người mua.');
CREATE TABLE payment_categories (
    id INT AUTO_INCREMENT PRIMARY KEY,
    category_name VARCHAR(255) NOT NULL
);
INSERT INTO payment_categories (category_name)
VALUES
    ('Sendo Gợi Ý'),
    ('Mua Trước Trả Sau');
-- Tạo bảng chính cho các phương thức thanh toán
CREATE TABLE payment_methods (
    id INT AUTO_INCREMENT PRIMARY KEY,
    method_name VARCHAR(255) NOT NULL,
    description TEXT NOT NULL,
    image text,
    category_id INT,
    FOREIGN KEY (category_id) REFERENCES payment_categories(id)
);
INSERT INTO payment_methods (method_name, description,image, category_id)
VALUES
    ('Ví MoMo', 'Thanh toán qua ví điện tử MoMo','https://media3.scdn.vn/img4/2021/06_08/TgFdj5SXwtFP3STJ6mfk.png', 1),
    ('Tiền mặt (COD)', 'Thanh toán khi nhận hàng','https://media3.scdn.vn/img4/2021/03_31/fMfdU81WB18wSe2LKOWW.png', 1),
    ('Ví SenPay', 'Thanh toán qua ví điện tử SenPay','https://media3.scdn.vn/img4/2021/05_14/oposINBx6SyQhflKKhUX.png', 1),
     ('Thanh toán kết hợp', 'Số dư trong Ví SenPay phải có ít nhất 1.000đ để thanh toán.','https://media3.scdn.vn/img4/2021/05_17/3TrUQZxPPqe9RqgEJ0D4.png', 1),
    ('Muadee', 'Áp dụng cho tổng thanh toán từ 200.000đ trở lên.','https://media3.scdn.vn/img4/2022/12_23/KwKYYua9Mcu9cCakmLwI.png', 2);
CREATE TABLE Orders (
    id INT AUTO_INCREMENT PRIMARY KEY,
    idCustomers INT,
    total_price DECIMAL(10, 2) NOT NULL,
    status VARCHAR(50) NOT NULL,
    state VARCHAR(50) NOT NULL,
    payment_method_id INT,
    transform_method_id INT,
    transform_option_id INT,
    address_id INT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (idCustomers) REFERENCES customers(idCustomers),
    FOREIGN KEY (transform_method_id) sREFERENCES delivery_methods(id),
    FOREIGN KEY (transform_option_id) REFERENCES delivery_options(id),
    FOREIGN KEY (payment_method_id) REFERENCES payment_methods(id),
    FOREIGN KEY (address_id) REFERENCES addressGetPro(id)
);
CREATE TABLE OrderItems (
    id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT,
    idProduct INT,
    quantity INT NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (order_id) REFERENCES Orders(id),
    FOREIGN KEY (idProduct) REFERENCES products(idProduct)
);
insert into psomwqdghosting_sendo.Attributes(attribute_name,type_attribute_id,type)
values
('Dáng váy',2,'checkbox'),
('Chiều dài áo',2,'checkbox'),
('Chất liệu',2,'checkbox'),
('Kiểu vạt áo',2,'checkbox'),
('Xuất xứ',2,'checkbox'),
('Mút áo',2,'checkbox'),
('Loại cài áo',2,'checkbox'),
('Loại áo ngực',2,'checkbox'),
('Kiểu áo',2,'checkbox'),
('Kiểu dáng',2,'checkbox'),
('Có mũ',2,'checkbox'),
('Túi áo',2,'checkbox'),
('Dung tích',2,'checkbox'),
('Hãng sản xuất',2,'checkbox'),
('Phân loại',2,'checkbox'),
('Nguồn năng lượng',2,'checkbox'),
('Tính năng',2,'checkbox'),
('Phương thức bảo hành',2,'checkbox'),
('Bảo hành',2,'checkbox'),
('Loại da',2,'checkbox'),
('Màu Mùi',2,'checkbox'),
('Dạng sản phẩm',2,'checkbox'),
('Đối tượng sử dụng',2,'checkbox'),
('Nhãn Hiệu',2,'checkbox'),
('Tông Màu Son',2,'checkbox'),
('Tông màu',2,'checkbox'),
('Loại nước hoa',2,'checkbox'),
('Loại bột',2,'checkbox'),
('Loại kem dưỡng da',2,'checkbox'),
('Mùi hương',2,'checkbox'),
('loại gót',2,'checkbox'),
('Loại đế',2,'checkbox'),
('Độ cao',2,'checkbox'),
('Chiều cao',2,'checkbox'),
('Chất liệu giày',2,'checkbox'),
('Khả năng chống nước',2,'checkbox'),
('Loại dây',2,'checkbox'),
('Mặt đồng hồ',2,'checkbox'),
('Kiểu khóa',2,'checkbox'),
('Độ chịu nước',2,'checkbox'),
('Chất liệu mặt kính',2,'checkbox'),
('Loại máy',2,'checkbox'),
('Đường kính mặt nam',2,'checkbox'),
('Chỉ số chống thấm',2,'checkbox'),
('Size',2,'checkbox'),
('Chất liệu kính',2,'checkbox'),
('Khu vực giao hàng',2,'checkbox'),
('Loại hạt giống',2,'checkbox'),
('Loại cưa',2,'checkbox'),
('Loại cần siết',2,'checkbox'),
('Loại vam cảo',2,'checkbox'),
('Chức năng',2,'checkbox'),
('Công suất',2,'checkbox'),
('Thời gian sử dụng pin',2,'checkbox'),
('Kiểu đui đèn',2,'checkbox'),
('Kiểu bóng đèn',2,'checkbox'),
('Chiều dài',2,'checkbox'),
('Đặc tính',2,'checkbox'),
('Loại thang',2,'checkbox'),
('Chủ đề tranh',2,'checkbox'),
('Loại tranh',2,'checkbox'),
('Dịp tặng hoa',2,'checkbox'),
('Không gian',2,'checkbox'),
('Tương thích với',2,'checkbox'),
('Loại cổng sạc',2,'checkbox'),
('Độ dài dây',2,'checkbox'),
('Dung lượng pin',2,'checkbox'),
('Chuẩn USB',2,'checkbox'),
('Interface',2,'checkbox'),
('Loại đĩa',2,'checkbox'),
('Dung lượng bộ nhớ',2,'checkbox'),
('Loại thẻ',2,'checkbox'),
('Loại USB',2,'checkbox'),
('Số cổng mạng',2,'checkbox'),
('Loại đầu số',2,'checkbox'),
('Nhà mạng',2,'checkbox'),
('Loại SIM',2,'checkbox'),
('Loại SIM số',2,'checkbox'),
('Loại màn hình',2,'checkbox'),
('Loại cổng ra',2,'checkbox'),
('Loại cáp',2,'checkbox'),
('Loại cổng vào',2,'checkbox'),
('Số cổng ra',2,'checkbox'),
('Loại mũ',2,'checkbox'),
('Loại dầu',2,'checkbox'),
('Dòng xe tương thích',2,'checkbox'),
('Hãng xe',2,'checkbox'),
('Khu vực nhận xe',2,'checkbox'),
('Loại hộp số',2,'checkbox'),
('Dòng xe',2,'checkbox'),
('Năm sản xuất',2,'checkbox'),
('Nhiên Liệu',2,'checkbox'),
('Số chỗ ngồi',2,'checkbox'),
('Tình trạng sản phẩm',2,'checkbox'),
('Số camera',2,'checkbox'),
('Kích thước màn hình',2,'checkbox'),
('Độ phân giải',2,'checkbox'),
('Độ tuổi',2,'checkbox'),
('Loại Đèn',2,'checkbox'),
('Hình dạng gương',2,'checkbox'),
('Chất Liệu Lốp Xe',2,'checkbox'),
('Nguồn gốc',2,'checkbox'),
('Nguồn điện',2,'checkbox'),
('Loại hình lưu trú',2,'checkbox'),
('Nơi nhận',2,'checkbox'),
('Thời gian',2,'checkbox'),
('Quốc gia',2,'checkbox'),
('Địa điểm',2,'checkbox'),
('Tour bao gồm',2,'checkbox'),
('Loại tour',2,'checkbox'),
('Loại máy in',2,'checkbox'),
('Loại kết nối',2,'checkbox'),
('Cổng kết nối',2,'checkbox'),
('Loại ổ cứng',2,'checkbox'),
('Ổ cứng',2,'checkbox'),
('Hệ điều hành',2,'checkbox'),
('RAM',2,'checkbox'),
('Vi xử lý',2,'checkbox');
INSERT INTO psomwqdghosting_sendo.Attribute_Values (attribute_id, value)
VALUES
(15, 'Váy suông'),
(15, 'Váy chữ A'),
(15, 'Váy bodycon'),
(15, 'Váy xòe'),
(15, 'Váy maxi'),
(15, 'Váy midi'),
(15, 'Váy mullet'),
(15, 'Váy peplum'),
(15, 'Váy slip dress'),
(15, 'Váy wrap dress'),
(15, 'Váy dạ hội'),
(15, 'Váy cocktail'),
(15, 'Váy công chúa'),
(15, 'Váy liền thân'),
(16, 'Áo ngắn tay'),
(16, 'Áo lửng'),
(16, 'Áo dài tay'),
(16, 'Áo dài ngang hông'),
(16, 'Áo dài qua hông'),
(16, 'Áo dài ngang đùi'),
(16, 'Áo dài quá gối'),
(16, 'Áo dài chấm gót'),
(16, 'Áo sơ sinh'),
(16, 'Áo cho bé'),
(16, 'Áo dài tay cho bé'),
(16, 'Áo ngắn tay cho bé'),
(16, 'Áo lửng cho bé'),
(16, 'Áo ngắn tay thể thao'),
(16, 'Áo dài tay thể thao'),
(16, 'Áo lửng thể thao'),
(16, 'Áo dài ngang hông thể thao'),
(16, 'Áo dài qua hông thể thao'),
(17, 'Vải cotton'),
(17, 'Lụa'),
(17, 'Denim'),
(17, 'Polyester'),
(17, 'Satin'),
(17, 'Len'),
(17, 'Da thật'),
(17, 'Da PU'),
(17, 'Chiffon'),
(17, 'Vải Oxford'),
(17, 'Thun cotton'),
(17, 'Lông vũ'),
(17, 'Da bò'),
(17, 'Da lộn'),
(17, 'Vải dù'),
(17, 'Flannel'),
(17, 'Tweed'),
(17, 'Silicon'),
(17, 'Nhựa'),
(17, 'Thủy tinh'),
(17, 'Kim loại không gỉ'),
(17, 'Gỗ tự nhiên'),
(17, 'Sợi thủy tinh'),
(17, 'Đá massage'),
(17, 'Nhựa PVC'),
(17, 'Da mềm'),
(17, 'Da tổng hợp'),
(17, 'Vải canvas'),
(17, 'Vải bố'),
(17, 'Nhựa dẻo'),
(17, 'Tơ tằm'),
(17, 'Da rắn'),
(17, 'Da cá sấu'),
(17, 'Thép không gỉ'),
(17, 'Bạc'),
(17, 'Vàng'),
(17, 'Kim loại mạ vàng'),
(17, 'Đá quý'),
(17, 'Ngọc trai'),
(17, 'Gỗ'),
(17, 'Đồng'),
(17, 'Nhựa cao cấp'),
(17, 'Kim loại'),
(17, 'Kính cường lực'),
(17, 'Nhôm'),
(17, 'Carbon'),
(17, 'Mica'),
(17, 'Cao su'),
(17, 'Sợi carbon'),
(17, 'Nhựa ABS'),
(17, 'Nhựa PC'),
(17, 'Silicone'),
(17, 'Kim loại đúc'),
(17, 'Nhôm đúc'),
(17, 'Thép'),
(17, 'Gốm'),
(17, 'Nhựa PET'),
(17, 'Nhựa chịu nhiệt'),
(17, 'Thép không gỉ'),
(17, 'Nhôm'),
(17, 'Gốm sứ'),
(17, 'Kim loại mạ crôm'),
(17, 'Kính'),
(17, 'Nhựa PP'),
(17, 'Gỗ công nghiệp'),
(17, 'Gỗ sồi'),
(17, 'Gỗ thông'),
(17, 'Gỗ cao su'),
(17, 'Gỗ bạch đàn'),
(17, 'Nhựa composite'),
(17, 'Gốm sứ'),
(17, 'Đá tự nhiên'),
(17, 'Thép sơn tĩnh điện'),
(17, 'Nhựa ABS'),
(17, 'Nhựa polycarbonate'),
(17, 'Kim loại đúc'),
(17, 'Nhôm'),
(17, 'Thủy tinh'),
(17, 'Da'),
(17, 'Vải lưới'),
(17, 'Gỗ'),
(17, 'Giấy tái chế'),
(17, 'Giấy cao cấp'),
(17, 'Vải bố'),
(17, 'Da tổng hợp'),
(17, 'Gỗ tự nhiên'),
(17, 'Thủy tinh'),
(17, 'Nhựa PVC'),
(17, 'Nhựa PP'),
(17, 'Kim loại'),
(17, 'Thủy tinh'),
(17, 'Gỗ'),
(17, 'Nhựa PE'),
(17, 'Nhựa PET'),
(17, 'Bông'),
(17, 'Da thật'),
(17, 'Nhựa ABS'),
(17, 'Nhựa cao cấp'),
(17, 'Kim loại'),
(17, 'Gỗ công nghiệp'),
(17, 'Thép không gỉ'),
(17, 'Đá granite'),
(17, 'Nhựa POM'),
(17, 'Cao su'),
(17, 'Da thật'),
(17, 'Da PU'),
(17, 'Vải cao cấp'),
(17, 'Vải lanh'),
(17, 'Da cá sấu'),
(17, 'Da rắn'),
(17, 'Da lộn'),
(17, 'Vải nỉ');
