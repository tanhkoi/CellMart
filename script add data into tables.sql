-- dat lai cot id cua bang product ve 1
DBCC CHECKIDENT (Product, RESEED, 38)

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
Bền bỉ vượt trội - Kháng nước, kháng bụi IP68, mặt lưng Ceramic Shield', 23490000.00, N'\images\Apple\iPhone 12 Pro Max 128GB.jpg', 1, 0);
INSERT INTO Product (Name, Description, Price, ImageUrl, CategoryId, IsDeleted)
VALUES (N'iPhone 11 64GB', N'Màu sắc phù hợp cá tính - 6 màu sắc bắt mắt để lựa chọn
Hiệu năng mượt mà, ổn định - Chip A13, RAM 4GB
Bắt trọn khung hình - Camera kép hỗ trợ góc rộng, chế độ Night Mode
Yên tâm sử dụng - Kháng nước, kháng bụi IP68, kính cường lực Gorilla', 9890000.00, N'\images\Apple\iPhone 11 64GB.png', 1, 0);
INSERT INTO Product (Name, Description, Price, ImageUrl, CategoryId, IsDeleted)
VALUES (N'iPhone 11 128GB', N'Màu sắc phù hợp cá tính - 6 màu sắc bắt mắt để lựa chọn
Hiệu năng mượt mà, ổn định - Chip A13, RAM 4GB
Bắt trọn khung hình - Camera kép hỗ trợ góc rộng, chế độ Night Mode
Yên tâm sử dụng - Kháng nước, kháng bụi IP68, kính cường lực Gorilla Glass', 11290000.00, N'\images\Apple\iPhone 11 128GB.png', 1, 0);
INSERT INTO Product (Name, Description, Price, ImageUrl, CategoryId, IsDeleted)
VALUES (N'iPhone 12 64GB', N'Mạnh mẽ, siêu nhanh với chip A14, RAM 4GB, mạng 5G tốc độ cao
Rực rỡ, sắc nét, độ sáng cao - Màn hình OLED cao cấp, Super Retina XDR hỗ trợ HDR10, Dolby Vision
Chụp đêm ấn tượng - Night Mode cho 2 camera, thuật toán Deep Fusion, Smart HDR 3
Bền bỉ vượt trội - Kháng nước, kháng bụi IP68, mặt lưng Ceramic Shield', 12190000.00, N'\images\Apple\iPhone 12 64GB.png', 1, 0);
INSERT INTO Product (Name, Description, Price, ImageUrl, CategoryId, IsDeleted)
VALUES (N'iPhone 13 128GB', N'Hiệu năng vượt trội - Chip Apple A15 Bionic mạnh mẽ, hỗ trợ mạng 5G tốc độ cao
Không gian hiển thị sống động - Màn hình 6.1" Super Retina XDR độ sáng cao, sắc nét
Trải nghiệm điện ảnh đỉnh cao - Camera kép 12MP, hỗ trợ ổn định hình ảnh quang học
Tối ưu điện năng - Sạc nhanh 20 W, đầy 50% pin trong khoảng 30 phút', 13990000.00, N'\images\Apple\iPhone 13 128GB.png', 1, 0);
INSERT INTO Product (Name, Description, Price, ImageUrl, CategoryId, IsDeleted)
VALUES (N'iPhone 13 Pro Max 256GB', N'Hiệu năng vượt trội - Chip Apple A15 Bionic mạnh mẽ, hỗ trợ mạng 5G tốc độ cao
Không gian hiển thị sống động - Màn hình 6.1" Super Retina XDR độ sáng cao, sắc nét
Trải nghiệm điện ảnh đỉnh cao - Camera kép 12MP, hỗ trợ ổn định hình ảnh quang học
Tối ưu điện năng - Sạc nhanh 20 W, đầy 50% pin trong khoảng 30 phút', 23990000.00, N'\images\Apple\iPhone 13 Pro Max 256GB.png', 1, 0);
INSERT INTO Product (Name, Description, Price, ImageUrl, CategoryId, IsDeleted)
VALUES (N'iPhone 14 128GB', N'Tuyệt đỉnh thiết kế, tỉ mỉ từng đường nét - Nâng cấp toàn diện với kiểu dáng mới, nhiều lựa chọn màu sắc trẻ trung
Nâng tầm trải ngiệm giải trí đỉnh cao - Màn hình 6,1"" cùng tấm nền OLED có công nghệ Super Retina XDR cao cấp
Chụp ảnh chuyên nghiệp hơn - Cụm 2 camera 12 MP đi kèm nhiều chế độ và chức năng chụp hiện đại
Hiệu năng hàng đầu thế giới - Apple A15 Bionic 6 nhân xử lí nhanh, ổn định', 17390000.00, N'\images\Apple\iPhone 14 128GB.png', 1, 0);
INSERT INTO Product (Name, Description, Price, ImageUrl, CategoryId, IsDeleted)
VALUES (N'iPhone 14 Plus 128GB', N'Trải nghiệm thị giác ấn tượng - Màn hình lớn 6.7" sắc nét với công nghệ Super Retina XDR
Sử dụng lâu dài với viên pin lớn giúp phát video liên tục lên tới 26 giờ
Tuyệt đỉnh thiết kế, tỉ mỉ từng đường nét - Nâng cấp toàn diện với kiểu dáng mới, nhiều lựa chọn màu sắc trẻ trung
Hiệu năng hàng đầu thế giới - Apple A15 Bionic 6 nhân xử lí nhanh, ổn định', 19790000.00, N'\images\Apple\iPhone 14 Plus 128GB.png', 1, 0);
INSERT INTO Product (Name, Description, Price, ImageUrl, CategoryId, IsDeleted)
VALUES (N'iPhone 14 Pro Max 512GB', N'Màn hình Dynamic Island - Sự biến mất của màn hình tai thỏ thay thế bằng thiết kế viên thuốc, OLED 6,7 inch, hỗ trợ always-on display
Cấu hình iPhone 14 Pro Max mạnh mẽ, hiệu năng cực khủng từ chipset A16 Bionic
Làm chủ công nghệ nhiếp ảnh - Camera sau 48MP, cảm biến TOF sống động
Pin liền lithium-ion kết hợp cùng công nghệ sạc nhanh cải tiến', 35190000.00, N'\images\Apple\iPhone 14 Pro Max 512GB.png', 1, 0);
INSERT INTO Product (Name, Description, Price, ImageUrl, CategoryId, IsDeleted)
VALUES (N'iPhone 14 Pro Max 256GB', N'Màn hình Dynamic Island - Sự biến mất của màn hình tai thỏ thay thế bằng thiết kế viên thuốc, OLED 6,7 inch, hỗ trợ always-on display
Cấu hình iPhone 14 Pro Max mạnh mẽ, hiệu năng cực khủng từ chipset A16 Bionic
Làm chủ công nghệ nhiếp ảnh - Camera sau 48MP, cảm biến TOF sống động
Pin liền lithium-ion kết hợp cùng công nghệ sạc nhanh cải tiến', 28490000.00, N'\images\Apple\iPhone 14 Pro Max 256GB.png', 1, 0);
--oppo
INSERT INTO Product (Name, Description, Price, ImageUrl, CategoryId, IsDeleted)
VALUES (N'OPPO A17K', N'Chuẩn nét từng khung hình - Trang bị màn hình LCD 6.56 inch với độ phân giải HD+
Hiệu năng cải tiến, bứt phá tốc độ - Chip Helio G35, RAM 4GB và bộ nhớ trong 64GB
Trọn vẹn năng lượng suốt cả ngày - Viên pin lớn 5000 mAh, sạc 10W
Bảo mật nâng cao với mở khoá vân tay cạnh viền, mở khoá khuôn mặt', 2790000.00, N'\images\OPPO\OPPO A17K.png', 2, 0);
INSERT INTO Product (Name, Description, Price, ImageUrl, CategoryId, IsDeleted)
VALUES (N'OPPO A18 4GB 128GB', N'Hiệu năng vượt trội với chip Helio G85 - Giúp bạn xử lý các tác vụ mượt mà không cần phải lo lắng có bị giật, lag.
Độ phân giải HD+ sặc nét cùng tần số quét 90Hz, mang lại những hình ảnh sống động và mượt mà nhất.
Dung lượng pin 5000 mAh mạnh mẽ - Đảm bảo bạn sẽ luôn kết nối và sử dụng trong nhiều giờ liền.
Thiết kế thời trang và hiện đại với các cạnh viền được vát phẳng và bo tròn ở các góc.', 3690000.00, N'\images\OPPO\OPPO A18 4GB 128GB.png', 2, 0);
INSERT INTO Product (Name, Description, Price, ImageUrl, CategoryId, IsDeleted)
VALUES (N'OPPO A77s 8GB 128GB', N'Nâng tầm trải nghiệm thị giác - Tấm nền IPS LCD với kích thước 6.56 inch, tần số quét 90Hz
Năng lượng tiếp sức cho cả ngày dài - 5000 mAh, sạc siêu nhanh SuperVOOC 33 W
Long lanh từ trong ra ngoài với thiết kế OPPO Glow, mặt lưng hoàn thiện từ thủy tinh hữu cơ
Trải nghiệm ổn định mọi tác vụ - Chip Snapdragon 680 8, RAM 8 GB và khả năng mở rộng RAM', 5190000.00, N'\images\OPPO\OPPO A77s 8GB 128GB.png', 2, 0);
INSERT INTO Product (Name, Description, Price, ImageUrl, CategoryId, IsDeleted)
VALUES (N'OPPO A57 4GB 128GB', N'Không gian hiển thị chất lượng - Màn hình IPS LCD 6.56 inches sắc nét
Cấu hình ổn định, thách thức mọi tác vụ - MediaTek Helio G35
Camera chụp ảnh chuyên nghiệp - Cụm camera 13 MP, đa dạng chế độ và filter
Năng lượng bất tận - Dung lượng pin 5000 mAh, sạc nhanh 33W', 2590000.00, N'\images\OPPO\OPPO A57 4GB 128GB.png', 2, 0);
INSERT INTO Product (Name, Description, Price, ImageUrl, CategoryId, IsDeleted)
VALUES (N'Oppo A74 8GB 128GB', N'Không gian hiển thị chất lượng - Màn hình IPS LCD 6.56 inches sắc nét
Cấu hình ổn định, thách thức mọi tác vụ - MediaTek Helio G35
Camera chụp ảnh chuyên nghiệp - Cụm camera 13 MP, đa dạng chế độ và filter
Năng lượng bất tận - Dung lượng pin 5000 mAh, sạc nhanh 33W', 3390000.00, N'\images\OPPO\Oppo A74 8GB 128GB.jpg', 2, 0);
INSERT INTO Product (Name, Description, Price, ImageUrl, CategoryId, IsDeleted)
VALUES (N'OPPO Find N2', N'OPPO Find N2 trang bị hàng loạt thông số cấu hình cao như chip Snapdragon 8+ Gen 1, kết hợp 12GB RAM, tấm nền AMOLED, kích thước màn hình chính 7.1 inch, camera lên tới 50MP, dung lượng pin 4.520 mAh, sạc nhanh 67W.', 9999999999.00, N'\images\OPPO\OPPO Find N2.png', 2, 0);
INSERT INTO Product (Name, Description, Price, ImageUrl, CategoryId, IsDeleted)
VALUES (N'OPPO Find N2 Flip 8Gb 256GB', N'Thiết kế bền bỉ cho phép gập đến 400.000 lần, giúp dễ dàng gấp gọn và mang theo
Màn hình phụ kích thước 3.26 inch cho khả năng hiển thị trực quan và nhiều chi tiết
Hệ thống ống kính chất lượng cao với cảm biến Sony IMX890 có độ phân giải 50MP
Hiệu năng mạnh mẽ với vi xử lý MediaTek 9000+ kết hợp RAM 8GB và ROM 256GB', 16990000.00, N'\images\OPPO\OPPO Find N2 Flip 8Gb 256GB.png', 2, 0);
INSERT INTO Product (Name, Description, Price, ImageUrl, CategoryId, IsDeleted)
VALUES (N'OPPO Reno7 5G (8GB 256GB)', N'Trải nghiệm mọi tác vụ mượt mà - Chip MediaTek Dimensity 900 5G mạnh mẽ, RAM khủng 8 GB
Ghi lại những câu chuyện sống động màu sắc - Camera chính 64MP, camera selfie độ phân giải cao
Năng lượng bền bỉ cho cả ngày dài - Viên pin lớn 4500 mAh cùng sạc nhanh 65 W
Màn hình giải trí bất tận - Màn hình AMOLED 6.4"", tần số quét 90 Hz cho hình ảnh sống động, sắc nét', 7590000.00, N'\images\OPPO\OPPO Reno7 5G (8GB 256GB).png', 2, 0);
INSERT INTO Product (Name, Description, Price, ImageUrl, CategoryId, IsDeleted)
VALUES (N'OPPO Reno 7 Pro', N'Đã mắt hơn với màn hình chất lượng - Màn hình AMOLED 6.5 inch cực lớn, hỗ trợ HDR 10+
Chiến game mượt mà - chip MediaTek Dimensity 1200 Max 8 nhân mạnh mẽ, RAM lớn đến 12GB
Chụp hình chuyên nghiệp hơn - Camera chính 50 MP, camera góc rộng 8 MP và camera macro 2 MP
Sạc nhanh trong tích tắc - Dung lượng 4500 mAh, công nghệ sạc SuperVOOC 2.0 có công suất tối đa 65W', 9990000.00, N'\images\OPPO\OPPO Reno 7 Pro.png', 2, 0);
INSERT INTO Product (Name, Description, Price, ImageUrl, CategoryId, IsDeleted)
VALUES (N'OPPO Reno11 F 5G 8GB 256GB', N'OPPO Reno11 F 5G cung cấp trải nghiệm hiển thị, xử lý siêu mượt mà với màn hình AMOLED 6.7 inch hiện đại cùng chipset MediaTek Dimensity 7050 mạnh mẽ. Hệ thống quay chụp trên thế hệ Reno11 F 5G này được cải thiện hơn thông qua cụm 3 camera với độ phân giải lần lượt là 64MP, 8MP và 2MP. Ngoài ra, cung cấp năng lượng cho thế hệ OPPO smartphone này là viên pin 5000mAh cùng sạc nhanh 67W, mang tới trải nghiệm liền mạch suốt ngày dài.',  8990000.00, N'\images\OPPO\OPPO Reno11 F 5G 8GB 256GB.png', 2, 0);
--samsung
INSERT INTO Product (Name, Description, Price, ImageUrl, CategoryId, IsDeleted)
VALUES (N'Samsung Galaxy S24 Ultra 12GB 256GB', N'Mở khoá giới hạn tiềm năng với AI - Hỗ trợ phiên dịch cuộc gọi, khoanh vùng tìm kiếm, Trợ lí Note và chình sửa anh
Tuyệt tác thiết kế bền bỉ và hoàn hảo - Vỏ ngoài bằng titan mới cùng màu sắc lấy cảm hứng từ chất liệu đá tự nhiên
Tích hợp S-Pen cực nhạy - Thoải mát viết, chạm thật chính xác trên màn hình cùng nhiều tính năng tiện ích
Nắm trong tay trọn bộ chi tiết chân thực nhất - Camera 200MP hỗ trợ khả năng xử lý AI cải thiện độ nét và tông màu', 28690000.00, N'\images\Samsung\Samsung Galaxy S24 Ultra 12GB 256GB.webp', 3, 0);
INSERT INTO Product (Name, Description, Price, ImageUrl, CategoryId, IsDeleted)
VALUES (N'Samsung Galaxy A55 5G 8GB 128GB', N'Chip Exynos 1480 4nm - Sử dụng mượt mà, linh hoạt với các tác vụ nặng nề mà không gặp trở ngại.
Với camera góc rộng 12MP mang đến khả năng thu trọn mọi khung cảnh vào khung hình.
Tần số quét 120Hz - Mỗi hành động trên màn hình đều trở nên mượt mà đáng kinh ngạc.
Pin 5000 mAh kết hợp cùng sạc nhanh 25W - Sử dụng thoải mái trong mọi hoạt động hằng ngày.', 9690000.00, N'\images\Samsung\Samsung Galaxy A55 5G 8GB 128GB.webp', 3, 0);
INSERT INTO Product (Name, Description, Price, ImageUrl, CategoryId, IsDeleted)
VALUES (N'Samsung Galaxy Z Flip5', N'Thần thái nổi bật, cân mọi phong cách- Lấy cảm hứng từ thiên nhiên với màu sắc thời thượng, xu hướng
Thiết kế thu hút ánh nhìn - Gập không kẽ hỡ, dẫn đầu công nghệ bản lề Flex
Tuyệt tác selfie thoả sức sáng tạo - Camera sau hỗ trợ AI xử lí cực sắc nét ngay cả trên màn hình ngoài
Bền bỉ bất chấp mọi tình huống - Đạt chuẩn kháng bụi và nước IPX8 cùng chất liệu nhôm Armor Aluminum giúp hạn chế cong và xước', 19290000.00, N'\images\Samsung\Samsung Galaxy Z Flip5.webp', 3, 0);
INSERT INTO Product (Name, Description, Price, ImageUrl, CategoryId, IsDeleted)
VALUES (N'Samsung Galaxy S23 Ultra', N'Thoả sức chụp ảnh, quay video chuyên nghiệp - Camera đến 200MP, chế độ chụp đêm cải tiến, bộ xử lí ảnh thông minh
Chiến game bùng nổ - chip Snapdragon 8 Gen 2 8 nhân tăng tốc độ xử lí, màn hình 120Hz, pin 5.000mAh
Nâng cao hiệu suất làm việc với Siêu bút S Pen tích hợp, dễ dàng đánh dấu sự kiện từ hình ảnh hoặc video
Thiết kế bền bỉ, thân thiện - Màu sắc lấy cảm hứng từ thiên nhiên, chất liệu kính và lớp phim phủ PET tái chế', 24990000.00, N'\images\Samsung\Samsung Galaxy S23 Ultra.webp', 3, 0);
INSERT INTO Product (Name, Description, Price, ImageUrl, CategoryId, IsDeleted)
VALUES (N'Samsung Galaxy Z Fold5 12GB 256GB', N'Thiết kế tinh tế với nếp gấp vô hình - Cải tiến nếp gấp thẩm mĩ hơn và gập không kẽ hở
Bền bỉ bất chấp mọi tình huống - Đạt chuẩn kháng bụi và nước IPX8 cùng chất liệu nhôm Armor Aluminum giúp hạn chế cong và xước
Mở ra không gian giải trí cực đại với màn hình trong 7.6"" cùng bản lề Flex dẫn đầu công nghệ
Thoải mái sáng tạo mọi lúc - Bút Spen tiện dụng giúp bạn phác hoạ và ghi chép không cần đến sổ tay
Hiệu năng cân mọi tác vụ - Snapdragon® 8 Gen 2 for Galaxy xử lí mượt mà, đa nhiệm mượt mà', 31390000.00, N'\images\Samsung\Samsung Galaxy Z Fold5 12GB 256GB.webp', 3, 0);
INSERT INTO Product (Name, Description, Price, ImageUrl, CategoryId, IsDeleted)
VALUES (N'Samsung Galaxy A35 5G 8GB 128GB', N'Chip Exynos 1380 - Sử dụng mượt mà, linh hoạt với các tác vụ nặng nề mà không gặp trở ngại.
Tần số quét 120Hz - Mỗi hành động trên màn hình đều trở nên mượt mà đáng kinh ngạc.
Với camera góc rộng 8MP mang đến khả năng thu trọn mọi khung cảnh vào khung hình.
Pin 5000 mAh kết hợp cùng sạc nhanh 25W - Sử dụng thoải mái trong mọi hoạt động hằng ngày.', 7990000.00, N'\images\Samsung\Samsung Galaxy A35 5G 8GB 128GB.webp', 3, 0);
INSERT INTO Product (Name, Description, Price, ImageUrl, CategoryId, IsDeleted)
VALUES (N'Samsung Galaxy A15', N'Giải trí đa nội dung - Màn hình lớn 6.5inch với công nghệ Super AMOLED cho hình ảnh sắc nét
Dễ dàng xử lí mọi tác vụ - Chip MediaTek Helio G99 cùng RAM 8GB cực chiến
Thoải mái sử dụng cả ngày - Pin 5000mAh với công nghệ sạc nhanh 25W
Quay chụp chuẩn điện ảnh - Cụm 3 camera sau lên đến 50MP cho hình ảnh chất lượng', 4790000.00, N'\images\Samsung\Samsung Galaxy A15.webp', 3, 0);
INSERT INTO Product (Name, Description, Price, ImageUrl, CategoryId, IsDeleted)
VALUES (N'Samsung Galaxy A23 5G', N'Sở hữu sức mạnh mạnh mẽ, hiệu suất để làm việc nhiều hơn - Snapdragon 695 5G, RAM 4 GB
Màn hình cuộn siêu mượt - Màn hình IPS LCD 6.6 inches, tần số quét 120Hz
Cụm camera thông minh, chụp sắc nét hiệu quả - Camera chính góc rộng 50 MP, chống rung OIS
Viên pin trâu và khả năng kết nối 5G nhanh đỉnh cao - Pin lớn 5000mAh, sạc nhanh 25W', 4400000.00, N'\images\Samsung\Samsung Galaxy A23 5G.webp', 3, 0);
INSERT INTO Product (Name, Description, Price, ImageUrl, CategoryId, IsDeleted)
VALUES (N'Samsung Galaxy A25', N'Rực rỡ mọi góc nhìn - Màn hình Super AMOLED với tần số quét 120Hz cho hình ảnh vượt trội
Trở thanh nhiếp ảnh gia chuyên nghiệp - Camera 50MP, chống rung IOS ổn định mọi địa hình
Pin tràn đầy, sạc trong tích tắc - Pin lớn 5000mAh cùng sạc nhanh 25W
Xử lí tác vụ nhanh và ổn định - Chip Exynos 1280 8 nhân cùng RAM 6GB', 6590000.00, N'\images\Samsung\Samsung Galaxy A25.webp', 3, 0);
INSERT INTO Product (Name, Description, Price, ImageUrl, CategoryId, IsDeleted)
VALUES (N'Samsung Galaxy A05s', N'Hiển thị sống động từng thước phim - Màn hình lớn 6.7" IPS hiển thị sắc nét
Vận hành tác vụ mượt mà như mong đợi - Xử lí tốt hơn với chip Snapdragon 680 và RAM 4GB
Sử dụng thoải mái cả ngày dài - Pin lớn 5000mAh và hỗ trợ sạc nhanh 25W
Ghi lại trọn vẹn mọi khoảnh khắc - Camera sau đến 50MP đi kèm nhiều chế độ chụp và tính năng cải tiến', 3690000.00, N'\images\Samsung\Samsung Galaxy A05s.webp', 3, 0);
INSERT INTO Product (Name, Description, Price, ImageUrl, CategoryId, IsDeleted)
VALUES (N'Samsung Galaxy A54 5G', N'Nâng tầm trải nghiệm chiến game cùng màn hình có tần số quét lên đến 120Hz
Chip Exynos 1380 độc quyền giúp xử lý tốt mọi tác vụ từ cơ bản đến nâng cao
Quay video siêu chống rung và chụp đêm cực ấn tượng với bộ 3 camera 50MP
Thiết kế đặc trưng với mặt kính sang trọng, hỗ trợ kháng nước, bụi chuẩn IP67', 28690000.00, N'\images\Samsung\Samsung Galaxy A54 5G.webp', 3, 0);
-- vivo
INSERT INTO Product (Name, Description, Price, ImageUrl, CategoryId, IsDeleted)
VALUES 
(N'vivo V29E 8GB 256GB', N'Hiệu năng vượt trội với chip Snapdragon 695 - Giúp bạn xử lý các tác vụ mượt mà không cần phải lo lắng có bị giật, lag.
Màn hình Sunlight AMOLED 120Hz - Cho hình ảnh sắc nét, màu sắc tươi sáng, trung thực.
Pin khủng kèm sạc siêu siêu tốc 44W - Giúp bạn sử dụng thoải mái trong vòng hai ngày.
Cụm camera được cải tiến giúp quay video và chụp ra bức ảnh rất tốt, hài hòa, sống động hơn.', 7990000.00, N'\images\Vivo\vivo V29E 8GB 256GB.webp', 4, 0),
(N'Vivo Y36 8GB 128GB', N'Vẻ ngoài đơn giản tạo nên sức hút - Thiết kế nốt ruồi thời thượng so với màn hình giọt nước trước đó.
Màn hình Full HD+ - Hình ảnh hiển thị sắc nét, giúp bạn chiêm ngưỡng những bộ phim, chơi game được tốt hơn.
Snapdragon 680 cùng Raợng 5000 mAh cho phép ngưm 8GB - Đủ sức sử dụng các tác vụ như lướt web, xem phim hay chơi game cấu hình tầm trung.
Pin trâu cho thời gian dùng lâu - dung lười dùng sử dụng thoải mái cả một ngày dài.', 4990000.00, N'\images\Vivo\Vivo Y36 8GB 128GB.png', 4, 0),
(N'vivo V25 Pro 8GB 128GB', N'Thiết kế trẻ trung, mặt lưng đổi màu độc đáo - Đổi màu sắc khi có tia UV chiếu vào
Dẫn đầu xu hướng nhiếp ảnh mới - Hệ thống ba camera lên đến 64MP, đi kèm chống rung quang học OIS
Hiệu năng mạnh mẽ, xử lý đa tác vụ - Bộ vi xử lý Dimensity 1300, RAM 8GB + Mở rộng 8GB
Không gian giải trí cực đỉnh - Màn hình AMOLED có kích thước 6.56 inch, 120Hz', 7690000.00, N'\images\Vivo\vivo V25 Pro 8GB 128GB.png', 4, 0),
(N'vivo Y03 4GB 64GB', N'Trải nghiệm giải trí cực sống động với màn hình rộng 6.56 inch cùng độ phân giải HD.
Dung lượng ấn tượng lên đến 5000 mAh cùng sạc nhanh 15W - Thoải mái sử dụng trong nhiều giờ đồng hồ.
Nhiếp ảnh chuyên nghiệp, nắm giữ tuyệt tác trong tầm tay với camera chính 13MP.
Hỗ trợ cổng sạc Type C giúp sạc đầy thiết bị một cách nhanh chóng, tiết kiệm thời gian, truyền tải dữ liệu đón đầu xu hướng tương lai.', 2990000.00, N'\images\Vivo\vivo Y03 4GB 64GB.png', 4, 0),
(N'Vivo V27e 8GB 256GB', N'Tận hưởng không gian hiển thị đẹp mắt với màn hình AMOLED cùng độ phân giải Full HD+
Bắt trọn, lưu giữ mọi khoảnh khắc cùng hệ thống 3 camera sau với nhiều tính năng hiện đại
Vi xử lý MediaTek Helio G99 kết hợp cùng RAM 8 GB giúp chinh phục nhiều tác vụ mượt mà
Viên pin 4.6000 mAh tích hợp công nghệ sạc nhanh đến 66 W giúp nạp đầy pin trong tích tắc', 7990000.00, N'\images\Vivo\Vivo V27e 8GB 256GB.png', 4, 0),
(N'vivo Y16 4GB 128GB', N'Cuốn hút từ ánh nhìn đầu tiên - Thiết kế khung viền phẳng sang trọng, màu sắc họa tiết ánh sao
Hình ảnh sống động đến bất ngờ - Màn hình IPS LCD 6.51 inch, chế độ bảo vệ mắt thông minh
Hiệu suất ấn tượng với chip MediaTek Helio P35, RAM 4GB + Mở rộng 1GB cho đa nhiệm mượt mà
Hỗ trợ chụp ảnh đa phong cách - Bộ đôi camera kép Chính 13 MP & phụ 2 MP kèm nhiều tính năng thú vị', 3690000.00, N'\images\Vivo\vivo Y16 4GB 128GB.png', 4, 0),
(N'vivo Y17s 4GB 128GB', N'Thiết kế trendy, màu sắc xu hướng - 2 màu sắc Tím Sao Băng, Xanh Rừng Sâu nổi bật phong cách của bạn
Hoàn hảo mọi góc chụp - Camera chính 50MP chụp chân dung và chụp đêm chuyên nghiệp, cho ảnh chất lượng cao
Đa nhiệm mượt, xử lí nhanh - RAM mở rộng giúp máy vận hành và thao tác êm ái nhiều tác vụ cùng lúc
Mở ra không gian giải trí tuyệt hảo - Tần số quét 60Hz, màn hình lớn 6.56", độ sáng tối đa 840nits', 3790000.00, N'\images\Vivo\vivo Y17s 4GB 128GB.png', 4, 0);
--Xiaomi
INSERT INTO Product (Name, Description, Price, ImageUrl, CategoryId, IsDeleted)
VALUES
(N'Redmi A2 2GB 32GB', N'Màu sắc trendy, tự tin chất riêng - Sở hữu màu sắc 3 màu sắc tinh tế và độc đáo phù hợp mọi phong cách thời trang
Cấu hình ổn định, cân tác vụ chuẩn - Chip xử lí MediaTek Helio G36 8 nhân cùng RAM mở rộng +2GB
Chụp ảnh và quay phim chưa bao giờ dễ đến thế - 2 Camera 8GB cùng hàng loạt chế độ chụp thông minh
Pin lâu cho cả ngày dài năng động - Dung lượng pin lớn 5000mAh, sạc tối đa 10W', 1990000.00, N'\images\Xiaomi\Redmi A2 2GB 32GB.webp', 5, 0),
(N'Xiaomi Redmi Note 12 4GB 128GB', N'Trải nghiệm thị giác siêu đã với màn hình 6.67 inch cùng tấm nền AMOLED thời thượng
Chiến game cực mượt với chip Snapdragon mạnh mẽ cùng màn hình tần số quét 120Hz
Năng lượng cho cả ngày dài nhờ vào viên pin lên đến 5000mAh đi kèm sạc nhanh 33W
Lưu giữ mọi khoảnh khắc với 3 camera sau 50 MP và tính năng làm đẹp AI thông minh', 3790000.00, N'\images\Xiaomi\Xiaomi Redmi Note 12 4GB 128GB.webp', 5, 0),
(N'Xiaomi POCO X6 Pro 5G 8GB 256GB', N'Màn hình OLED sống động, tần số 120Hz - Đem đến chất lượng hình ảnh sắc nét, màu sắc sống động.
Hiệu năng đỉnh cao với chip Dimensity 8300 Ultra - Chiến được hầu hết các tựa game mobile phổ biến.
Bộ 3 camera chất lượng, quay chụp sắc nét - Đem đến cho bạn những bức hình chân dung chất lượng cao.
Trang bị pin 5000mAh đi cùng sạc nhanh 67 W giúp bạn thoải mái sử dụng điện thoại suốt cả ngày dài.', 8390000.00, N'\images\Xiaomi\Xiaomi POCO X6 Pro 5G 8GB 256GB.webp', 5, 0),
(N'Xiaomi 12T Pro', N'Kiến tạo siêu khoảnh khắc - Hệ thống camera 200MP, chống rung quang học OIS và ống kính 8P
Thiết kế siêu việt - Trọn vẻ đẹp sang trọng, đẳng cấp, vỏ nhám chống bám vân tay, khung kim loại cứng cáp, độc đáo
Đạt đến sự ưu việt một cách dễ dàng - Chipset Snapdragon 8+ Gen 1 siêu mạnh mẽ cùng RAM 12GB cho đa nhiệm mượt mà
Năng lượng bất tận, khám phá cả ngày - Dung lượng pin 5000mAh, sạc siêu nhanh HyperCharge 120W
Trải nghiệm siêu chân thực - Màn hình lớn CrystalRes AMOLED cùng hệ thống âm thanh SOUND BY Harman Kardon   ', 14690000.00, N'\images\Xiaomi\Xiaomi 12T Pro.webp', 5, 0),
(N'Xiaomi 13 Lite', N'Hệ thống camera hàng đầu - Camera kép selfie cùng khung hình động đem lại những bức ảnh kiệt tác
Thiết kế mỏng nhẹ, đem lại sự thoải mái trong cầm nắm
Đắm chìm vào không gian giải trí sống động - AMOLED 120Hz giúp thao tác cuộn mượt mà
Snapdragon 7 Gen 1 dẫn đầu - Siêu nhanh và tiết kiệm năng lượng, đa nhiệm mượt mà, chiến game cực đã
Sạc nhanh 67W, sạc đầy 100% chỉ trong 40 phút', 8790000.00, N'\images\Xiaomi\Xiaomi 13 Lite.webp', 5, 0),
(N'Xiaomi 13T Pro 5G (12GB - 512GB)', N'Nhiếp ảnh chuyên ngiệp, nắm giữ tuyệt tác trong tầm tay - Cụm camera đến, ống kính Leica với 2 phong cách ảnh
Hiệu năng bất chấp mọi tác vụ - Bộ vi xử lý Dimensity 9200+ Ultra mạnh mẽ cùng RAM 12GB cho đa nhiệm mượt mà
Năng lượng bất tận cả ngày - Pin 5000mAh cùng sạc nhanh 120W, sạc đầy chỉ trong 19 phút
Màn hình sáng rực rỡ, cuộn lướt thật mượt mà - Màn hình 144hz cùng công nghệ AMOLED CrystalRes', 14690000.00, N'\images\Xiaomi\Xiaomi 13T Pro 5G (12GB - 512GB).webp', 5, 0),
(N'Xiaomi 13T 12GB 256GB', N'Nhiếp ảnh chuyên nghiệp, nắm giữ tuyệt tác trong tầm tay - Cụm camera đến, ống kính Leica với 2 phong cách ảnh
Hiệu năng bất chấp mọi tác vụ - Bộ vi xử lý Dimensity 8200 Ultra mạnh mẽ cùng RAM 12GB cho đa nhiệm mượt mà
Năng lượng bất tận cả ngày - Pin 5000mAh cùng sạc nhanh 67W, sạc đầy chỉ trong 42 phút
Màn hình sáng rực rỡ, cuộn lướt thật mượt mà - Màn hình 144hz cùng công nghệ AMOLED CrystalRes', 10290000.00, N'\images\Xiaomi\Xiaomi 13T 12GB 256GB.webp', 5, 0),
(N'Xiaomi 14 (12GB 256GB)', N'Mạnh mẽ cân mọi tác vụ, đa nhiệm cực đỉnh - Chip Snapdragon 8 Gen 3 (4nm) mượt mà đi kèm RAM 12GB
Trải nghiệm hình ảnh sống động - Màn hình 6.36” vừa vặn, công nghệ LTPO OLED, tần số quét 120Hz
Tuyệt tác camera, chụp ảnh sắc nét - Bộ 3 camera 50MP ống kính Leica cùng chống rung OIS
Năng lượng tràn đầy, thoả sức sức tạo - Dung lượng pin lớn 4610mAh, sạc nhanh 90W', 19990000.00, N'\images\Xiaomi\Xiaomi 14 (12GB 256GB).webp', 5, 0),
(N'Xiaomi Redmi 13C 6GB 128GB', N'Chipset Helio G85 cho hiệu năng ổn định - Hoạt động mượt mà cho các tác vụ cơ bản hàng ngày.
Hệ thống camera kép mạnh mẽ - Cải thiện độ chi tiết và độ sắc nét cho từng bức ảnh.
Dung lượng pin khổng lồ lên đến 5000 mAh - Giúp bạn thoải mái trải nghiệm nhiều giờ sử dụng liên tục.
Màn hình lớn kích thước 6.74 inch - Mang lại trải nghiệm xem ấn tượng.', 3290000.00, N'\images\Xiaomi\Xiaomi Redmi 13C 6GB 128GB.webp', 5, 0),
(N'Xiaomi 11T Pro', N'Thu hút mọi ánh nhìn với thiết kế đẹp mắt, mặt lưng và khung nhựa nhẹ được làm bóng.
Công nghệ âm thanh Dolby Atmos - Trải nghiệm âm thanh sống động, chi tiết và mạnh mẽ.
Màn hình lớn Full HD+ đi kèm tần số quét cao 120 Hz - Cho phép người dùng tận hưởng mọi chi tiết một cách rõ ràng.
Hiệu năng mạnh mẽ, phù hợp với nhu cầu sử dụng đa nhiệm của người dùng hiện nay với chip MediaTek Helio G99-Ultra.', 11990000.00, N'\images\Xiaomi\Xiaomi 11T Pro.webp', 5, 0),
(N'Xiaomi Redmi Note 12 Pro 4G 8GB 256GB', N'Màn hình giải trí cực đỉnh - Màn hình AMOLED 6.67 inch Full HD+, 120Hz
Cấu hình vượt trội, cân mọi tựa game - Chip Snapdragon 888 5G, GPU Adreno 660 mạnh mẽ
Trải nghiệm điện ảnh đỉnh cao - Cụm camera sau lên đến 108 MP siêu nét, quay phim 8K
Pin cực lớn, sạc cực nhanh - Viên pin lớn 5000 mAh, sạc nhanh 120W', 5890000.00, N'\images\Xiaomi\Xiaomi Redmi Note 12 Pro 4G 8GB 256GB.webp', 5, 0),
(N'Xiaomi Redmi Note 13 Pro 4G', N'Màn hình 6.67 inch và tấm nền AMOLED mang đến không gian hiển thị hình ảnh đẹp mắt
Vi xử lý  Snapdragon® 732G kết hợp chip đồ hoạ Adreno 618 giúp chiến game mượt mà
Thoả niềm đam mê nhiếp ảnh cùng hệ thống 3 camera với ống kính chính lên đến 50 MP
Viên pin dung lượng 5000 mAh cho khả năng hoạt động cả ngày dài ở các tác vụ cơ bản', 7390000.00, N'\images\Xiaomi\Xiaomi Redmi Note 13 Pro 4G.webp', 5, 0),
(N'Xiaomi Redmi Note 13 Pro Plus 4G', N'Thiết kế hiện đại, trẻ trung với mặt lưng kính thời thượng và khung viền kim loại vuông vức sang trọng
Tấm nền AMOLED cho khả năng hiển thị rõ nét, tần số quét 120Hz giúp mọi thao tác trở nên mượt mà
Chinh chiến mọi tựa game, tha hồ đa nhiệm với bộ vi xử lý Dimensity 1080 5G kết hợp với RAM 8 GB
Bắt trọn mọi khoảnh khắc với cảm biến chính Sony IMX766 độ phân giải 50 MP hỗ trợ chống rung OIS', 6790000.00, N'\images\Xiaomi\Xiaomi Redmi Note 13 Pro Plus 4G.webp', 5, 0);
-- phuong thuc thanh toan
INSERT INTO MethodPayment (Id, Name)
VALUES ('1', 'COD'),
       ('2', 'VNPay'),
       ('3', 'MOMO'),
       ('4', N'Ngân hàng');
