-- dat lai cot id cua bang product ve 1
DBCC CHECKIDENT (Product, RESEED, 0)

use DBdoancoso -- thay ten database cua ban

-- nhap du lieu vao bang Category
INSERT INTO Category (Name, IsDeleted)
VALUES ('Apple', 0);
INSERT INTO Category (Name, IsDeleted)
VALUES ('OPPO', 0);
INSERT INTO Category (Name, IsDeleted)
VALUES ('Samsung', 0);
INSERT INTO Category (Name, IsDeleted)
VALUES ('Vivo', 0);
INSERT INTO Category (Name, IsDeleted)
VALUES ('Xiaomi', 0);

-- nhap du lieu vao bang product
-- apple
INSERT INTO Product (Name, Description, Price, ImageUrl, CategoryId, IsDeleted)
VALUES (N'iPhone 12 Pro Max 128GB', N'Mạnh mẽ, siêu nhanh với chip A14, RAM 6GB, mạng 5G tốc độ cao
Rực rỡ, sắc nét, độ sáng cao - Màn hình OLED cao cấp, Super Retina XDR hỗ trợ HDR10, Dolby Vision
Chụp ảnh siêu đỉnh - Night Mode , thuật toán Deep Fusion, Smart HDR 3, camera LiDar
Bền bỉ vượt trội - Kháng nước, kháng bụi IP68, mặt lưng Ceramic Shield', 23490000.00, N'~\images\Apple\iPhone 12 Pro Max 128GB.jpg', 1, 0);
INSERT INTO Product (Name, Description, Price, ImageUrl, CategoryId, IsDeleted)
VALUES (N'iPhone 11 64GB', N'Màu sắc phù hợp cá tính - 6 màu sắc bắt mắt để lựa chọn
Hiệu năng mượt mà, ổn định - Chip A13, RAM 4GB
Bắt trọn khung hình - Camera kép hỗ trợ góc rộng, chế độ Night Mode
Yên tâm sử dụng - Kháng nước, kháng bụi IP68, kính cường lực Gorilla', 9890000.00, N'~\images\Apple\iPhone 11 64GB.png', 1, 0);
INSERT INTO Product (Name, Description, Price, ImageUrl, CategoryId, IsDeleted)
VALUES (N'iPhone 11 128GB', N'Màu sắc phù hợp cá tính - 6 màu sắc bắt mắt để lựa chọn
Hiệu năng mượt mà, ổn định - Chip A13, RAM 4GB
Bắt trọn khung hình - Camera kép hỗ trợ góc rộng, chế độ Night Mode
Yên tâm sử dụng - Kháng nước, kháng bụi IP68, kính cường lực Gorilla Glass', 11290000.00, N'~\images\Apple\iPhone 11 128GB.png', 1, 0);
INSERT INTO Product (Name, Description, Price, ImageUrl, CategoryId, IsDeleted)
VALUES (N'iPhone 12 64GB', N'Mạnh mẽ, siêu nhanh với chip A14, RAM 4GB, mạng 5G tốc độ cao
Rực rỡ, sắc nét, độ sáng cao - Màn hình OLED cao cấp, Super Retina XDR hỗ trợ HDR10, Dolby Vision
Chụp đêm ấn tượng - Night Mode cho 2 camera, thuật toán Deep Fusion, Smart HDR 3
Bền bỉ vượt trội - Kháng nước, kháng bụi IP68, mặt lưng Ceramic Shield', 12190000.00, N'~\images\Apple\iPhone 12 64GB.png', 1, 0);
INSERT INTO Product (Name, Description, Price, ImageUrl, CategoryId, IsDeleted)
VALUES (N'iPhone 13 128GB', N'Hiệu năng vượt trội - Chip Apple A15 Bionic mạnh mẽ, hỗ trợ mạng 5G tốc độ cao
Không gian hiển thị sống động - Màn hình 6.1" Super Retina XDR độ sáng cao, sắc nét
Trải nghiệm điện ảnh đỉnh cao - Camera kép 12MP, hỗ trợ ổn định hình ảnh quang học
Tối ưu điện năng - Sạc nhanh 20 W, đầy 50% pin trong khoảng 30 phút', 13990000.00, N'~\images\Apple\iPhone 13 128GB.png', 1, 0);
INSERT INTO Product (Name, Description, Price, ImageUrl, CategoryId, IsDeleted)
VALUES (N'iPhone 13 Pro Max 256GB', N'Hiệu năng vượt trội - Chip Apple A15 Bionic mạnh mẽ, hỗ trợ mạng 5G tốc độ cao
Không gian hiển thị sống động - Màn hình 6.1" Super Retina XDR độ sáng cao, sắc nét
Trải nghiệm điện ảnh đỉnh cao - Camera kép 12MP, hỗ trợ ổn định hình ảnh quang học
Tối ưu điện năng - Sạc nhanh 20 W, đầy 50% pin trong khoảng 30 phút', 23990000.00, N'~\images\Apple\iPhone 13 Pro Max 256GB.png', 1, 0);
INSERT INTO Product (Name, Description, Price, ImageUrl, CategoryId, IsDeleted)
VALUES (N'iPhone 14 128GB', N'Tuyệt đỉnh thiết kế, tỉ mỉ từng đường nét - Nâng cấp toàn diện với kiểu dáng mới, nhiều lựa chọn màu sắc trẻ trung
Nâng tầm trải ngiệm giải trí đỉnh cao - Màn hình 6,1"" cùng tấm nền OLED có công nghệ Super Retina XDR cao cấp
Chụp ảnh chuyên nghiệp hơn - Cụm 2 camera 12 MP đi kèm nhiều chế độ và chức năng chụp hiện đại
Hiệu năng hàng đầu thế giới - Apple A15 Bionic 6 nhân xử lí nhanh, ổn định', 17390000.00, N'~\images\Apple\iPhone 14 128GB.png', 1, 0);
INSERT INTO Product (Name, Description, Price, ImageUrl, CategoryId, IsDeleted)
VALUES (N'iPhone 14 Plus 128GB', N'Trải nghiệm thị giác ấn tượng - Màn hình lớn 6.7" sắc nét với công nghệ Super Retina XDR
Sử dụng lâu dài với viên pin lớn giúp phát video liên tục lên tới 26 giờ
Tuyệt đỉnh thiết kế, tỉ mỉ từng đường nét - Nâng cấp toàn diện với kiểu dáng mới, nhiều lựa chọn màu sắc trẻ trung
Hiệu năng hàng đầu thế giới - Apple A15 Bionic 6 nhân xử lí nhanh, ổn định', 19790000.00, N'~\images\Apple\iPhone 14 Plus 128GB.png', 1, 0);
INSERT INTO Product (Name, Description, Price, ImageUrl, CategoryId, IsDeleted)
VALUES (N'iPhone 14 Pro Max 512GB', N'Màn hình Dynamic Island - Sự biến mất của màn hình tai thỏ thay thế bằng thiết kế viên thuốc, OLED 6,7 inch, hỗ trợ always-on display
Cấu hình iPhone 14 Pro Max mạnh mẽ, hiệu năng cực khủng từ chipset A16 Bionic
Làm chủ công nghệ nhiếp ảnh - Camera sau 48MP, cảm biến TOF sống động
Pin liền lithium-ion kết hợp cùng công nghệ sạc nhanh cải tiến', 35190000.00, N'~\images\Apple\iPhone 14 Pro Max 512GB.png', 1, 0);
INSERT INTO Product (Name, Description, Price, ImageUrl, CategoryId, IsDeleted)
VALUES (N'iPhone 14 Pro Max 256GB', N'Màn hình Dynamic Island - Sự biến mất của màn hình tai thỏ thay thế bằng thiết kế viên thuốc, OLED 6,7 inch, hỗ trợ always-on display
Cấu hình iPhone 14 Pro Max mạnh mẽ, hiệu năng cực khủng từ chipset A16 Bionic
Làm chủ công nghệ nhiếp ảnh - Camera sau 48MP, cảm biến TOF sống động
Pin liền lithium-ion kết hợp cùng công nghệ sạc nhanh cải tiến', 28490000.00, N'~\images\Apple\iPhone 14 Pro Max 256GB.png', 1, 0);
--oppo
INSERT INTO Product (Name, Description, Price, ImageUrl, CategoryId, IsDeleted)
VALUES (N'OPPO A17K', N'Chuẩn nét từng khung hình - Trang bị màn hình LCD 6.56 inch với độ phân giải HD+
Hiệu năng cải tiến, bứt phá tốc độ - Chip Helio G35, RAM 4GB và bộ nhớ trong 64GB
Trọn vẹn năng lượng suốt cả ngày - Viên pin lớn 5000 mAh, sạc 10W
Bảo mật nâng cao với mở khoá vân tay cạnh viền, mở khoá khuôn mặt', 2790000.00, N'~\images\OPPO\OPPO A17K.png', 2, 0);
INSERT INTO Product (Name, Description, Price, ImageUrl, CategoryId, IsDeleted)
VALUES (N'OPPO A18 4GB 128GB', N'Hiệu năng vượt trội với chip Helio G85 - Giúp bạn xử lý các tác vụ mượt mà không cần phải lo lắng có bị giật, lag.
Độ phân giải HD+ sặc nét cùng tần số quét 90Hz, mang lại những hình ảnh sống động và mượt mà nhất.
Dung lượng pin 5000 mAh mạnh mẽ - Đảm bảo bạn sẽ luôn kết nối và sử dụng trong nhiều giờ liền.
Thiết kế thời trang và hiện đại với các cạnh viền được vát phẳng và bo tròn ở các góc.', 3690000.00, N'~\images\OPPO\OPPO A18 4GB 128GB.png', 2, 0);
INSERT INTO Product (Name, Description, Price, ImageUrl, CategoryId, IsDeleted)
VALUES (N'OPPO A77s 8GB 128GB', N'Nâng tầm trải nghiệm thị giác - Tấm nền IPS LCD với kích thước 6.56 inch, tần số quét 90Hz
Năng lượng tiếp sức cho cả ngày dài - 5000 mAh, sạc siêu nhanh SuperVOOC 33 W
Long lanh từ trong ra ngoài với thiết kế OPPO Glow, mặt lưng hoàn thiện từ thủy tinh hữu cơ
Trải nghiệm ổn định mọi tác vụ - Chip Snapdragon 680 8, RAM 8 GB và khả năng mở rộng RAM', 5190000.00, N'~\images\OPPO\OPPO A77s 8GB 128GB.png', 2, 0);
INSERT INTO Product (Name, Description, Price, ImageUrl, CategoryId, IsDeleted)
VALUES (N'OPPO A57 4GB 128GB', N'Không gian hiển thị chất lượng - Màn hình IPS LCD 6.56 inches sắc nét
Cấu hình ổn định, thách thức mọi tác vụ - MediaTek Helio G35
Camera chụp ảnh chuyên nghiệp - Cụm camera 13 MP, đa dạng chế độ và filter
Năng lượng bất tận - Dung lượng pin 5000 mAh, sạc nhanh 33W', 2590000.00, N'~\images\OPPO\OPPO A57 4GB 128GB.png', 2, 0);
INSERT INTO Product (Name, Description, Price, ImageUrl, CategoryId, IsDeleted)
VALUES (N'Oppo A74 8GB 128GB', N'Không gian hiển thị chất lượng - Màn hình IPS LCD 6.56 inches sắc nét
Cấu hình ổn định, thách thức mọi tác vụ - MediaTek Helio G35
Camera chụp ảnh chuyên nghiệp - Cụm camera 13 MP, đa dạng chế độ và filter
Năng lượng bất tận - Dung lượng pin 5000 mAh, sạc nhanh 33W', 3390000.00, N'~\images\OPPO\Oppo A74 8GB 128GB.png', 2, 0);
INSERT INTO Product (Name, Description, Price, ImageUrl, CategoryId, IsDeleted)
VALUES (N'OPPO Find N2', N'OPPO Find N2 trang bị hàng loạt thông số cấu hình cao như chip Snapdragon 8+ Gen 1, kết hợp 12GB RAM, tấm nền AMOLED, kích thước màn hình chính 7.1 inch, camera lên tới 50MP, dung lượng pin 4.520 mAh, sạc nhanh 67W.', 9999999999.00, N'~\images\OPPO\OPPO Find N2.png', 2, 0);
INSERT INTO Product (Name, Description, Price, ImageUrl, CategoryId, IsDeleted)
VALUES (N'OPPO Find N2 Flip 8Gb 256GB', N'Thiết kế bền bỉ cho phép gập đến 400.000 lần, giúp dễ dàng gấp gọn và mang theo
Màn hình phụ kích thước 3.26 inch cho khả năng hiển thị trực quan và nhiều chi tiết
Hệ thống ống kính chất lượng cao với cảm biến Sony IMX890 có độ phân giải 50MP
Hiệu năng mạnh mẽ với vi xử lý MediaTek 9000+ kết hợp RAM 8GB và ROM 256GB', 16990000.00, N'~\images\OPPO\OPPO Find N2 Flip 8Gb 256GB.png', 2, 0);
INSERT INTO Product (Name, Description, Price, ImageUrl, CategoryId, IsDeleted)
VALUES (N'OPPO Reno7 5G (8GB 256GB)', N'Trải nghiệm mọi tác vụ mượt mà - Chip MediaTek Dimensity 900 5G mạnh mẽ, RAM khủng 8 GB
Ghi lại những câu chuyện sống động màu sắc - Camera chính 64MP, camera selfie độ phân giải cao
Năng lượng bền bỉ cho cả ngày dài - Viên pin lớn 4500 mAh cùng sạc nhanh 65 W
Màn hình giải trí bất tận - Màn hình AMOLED 6.4"", tần số quét 90 Hz cho hình ảnh sống động, sắc nét', 7590000.00, N'~\images\OPPO\OPPO Reno7 5G (8GB 256GB).png', 2, 0);
INSERT INTO Product (Name, Description, Price, ImageUrl, CategoryId, IsDeleted)
VALUES (N'OPPO Reno 7 Pro', N'Đã mắt hơn với màn hình chất lượng - Màn hình AMOLED 6.5 inch cực lớn, hỗ trợ HDR 10+
Chiến game mượt mà - chip MediaTek Dimensity 1200 Max 8 nhân mạnh mẽ, RAM lớn đến 12GB
Chụp hình chuyên nghiệp hơn - Camera chính 50 MP, camera góc rộng 8 MP và camera macro 2 MP
Sạc nhanh trong tích tắc - Dung lượng 4500 mAh, công nghệ sạc SuperVOOC 2.0 có công suất tối đa 65W', 9990000.00, N'~\images\OPPO\OPPO Reno 7 Pro.png', 2, 0);
INSERT INTO Product (Name, Description, Price, ImageUrl, CategoryId, IsDeleted)
VALUES (N'OPPO Reno11 F 5G 8GB 256GB', N'OPPO Reno11 F 5G cung cấp trải nghiệm hiển thị, xử lý siêu mượt mà với màn hình AMOLED 6.7 inch hiện đại cùng chipset MediaTek Dimensity 7050 mạnh mẽ. Hệ thống quay chụp trên thế hệ Reno11 F 5G này được cải thiện hơn thông qua cụm 3 camera với độ phân giải lần lượt là 64MP, 8MP và 2MP. Ngoài ra, cung cấp năng lượng cho thế hệ OPPO smartphone này là viên pin 5000mAh cùng sạc nhanh 67W, mang tới trải nghiệm liền mạch suốt ngày dài.',  8990000.00, N'~\images\OPPO\OPPO Reno11 F 5G 8GB 256GB.png', 2, 0);
--samsung
INSERT INTO Product (Name, Description, Price, ImageUrl, CategoryId, IsDeleted)
VALUES (N'Samsung Galaxy S24 Ultra 12GB 256GB', N'Mở khoá giới hạn tiềm năng với AI - Hỗ trợ phiên dịch cuộc gọi, khoanh vùng tìm kiếm, Trợ lí Note và chình sửa anh
Tuyệt tác thiết kế bền bỉ và hoàn hảo - Vỏ ngoài bằng titan mới cùng màu sắc lấy cảm hứng từ chất liệu đá tự nhiên
Tích hợp S-Pen cực nhạy - Thoải mát viết, chạm thật chính xác trên màn hình cùng nhiều tính năng tiện ích
Nắm trong tay trọn bộ chi tiết chân thực nhất - Camera 200MP hỗ trợ khả năng xử lý AI cải thiện độ nét và tông màu', 28690000.00, N'~\images\Samsung\Samsung Galaxy S24 Ultra 12GB 256GB.webp', 2, 0);