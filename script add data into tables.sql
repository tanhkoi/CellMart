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