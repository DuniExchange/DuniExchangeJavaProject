

--Hiện đang﻿ thiếu 1 trigger thay đổi số vote của user và trigger thay đổi isdisable của Postcategory
------------------------------------------------------------------Khởi tạo cơ sở dữ liệu---------------------------------------------
create database DuniExchange
go
use DuniExchange
go
--drop database DuniExchange
create table UserAccount
(
userID int identity(1,1) not null,
userUserName varchar(20) NOT NULL,
userPassword varchar(max) NOT NULL,
userEmail char(50) NOT NULL,
userFullname nvarchar(70) NOT NULL,
userCreateDate datetime NOT NULL,
userFacebookURL nvarchar(max) NULL,
userAvatarURL nvarchar(max) NULL,
userRating float NOT NULL,
isAdmin bit NULL,
isValidate bit default 0  NOT NULL,
isDisable bit default 0 NOT NULL,
constraint pk_Account primary key (userID),
constraint rating_check Check (userRating between 0 and 5)
)
go
create table Category
(
categoryID int identity(1,1) NOT NULL,
categoryName nvarchar(50) NOT NULL,
categoryIcon nvarchar(50) NULL,
isDisable bit default 0 NOT NULL,
constraint pk_Category primary key(categoryID)
)
go

create table Post
(
postID int identity(1,1) NOT NULL,
postUserID  int NOT NULL,
postTitle nvarchar(MAX) NOT NULL,
postDate datetime NOT NULL,
postDescription nvarchar(MAX) NOT NULL,
postLike int NOT NULL,
postThumbnailURL nvarchar(MAX) NOT NULL,
isDisable bit default 0 NOT NULL,
isUsedExchange int default 0 NOT NULL,
constraint pk_Post primary key (postID),
constraint fk_PostAccount foreign key (postUserID) references UserAccount(userID)
)
--isUsedExchange 0: Chưa đem đi request trao đổi
--isUsedExchange 1: Đã đem đi request trao đổi
--isUsedExchange 2: Đã được trao đổi
go
create table PostCategory
(
postID int NOT NULL,
categoryID int NOT NULL,
constraint pk_CategoryPost primary key (postID,categoryID),
constraint fk_Post foreign key (postID) references Post(postID),
constraint fk_Category foreign key (categoryID) references Category(categoryID)
--constraint fk_CategoryDis foreign key (isDisableCate) references Category(isDisable)
)
go



create table PostImage
(
postID int NOT NULL,
postImageURL nvarchar(1000) NOT NULL,
constraint fk_PostImage foreign key (postID) references Post(postID),
constraint pk_ProductImage primary key (postID, postImageURL)
)
go

create table PostLikeUser(
postID int NOT NULL,
userID int NOT NULL,
constraint pk_PostLikeUser primary key (postID, userID),
constraint fk_PostLike foreign key (PostID) references Post(postID),
constraint fk_User foreign key (userID) references UserAccount(userID)
)
go

create table UserRating(
userRatingID int NOT NULL,
userID int NOT NULL,
rate int NOT NULL,
constraint pk_UserRating primary key (userRatingID, userID),
constraint fk_userRatingID foreign key (userRatingID) references UserAccount(userID),
constraint fk_userID foreign key (userID) references UserAccount(userID)
)
create table Exchange
(
exchangeID int identity(1,1) NOT NULL,
postRequestDate datetime NOT NULL,
firstPostID int NOT NULL,
secondPostID int NOT NULL,
exchangeState int NOT NULL,
responseDate datetime,
constraint pk_Exchange primary key(exchangeID),
constraint fk_ApostID foreign key (firstPostID) references Post(postID),
constraint fk_BpostID foreign key (secondPostID) references Post(postID),
)
--exchangeStae: 0: request  for exchange
--exchangeStae: 1 :request exchange and accept 
--exchangeStae: 2: request exchange but deny
--exchangeStae: 3: request expried
create table ProductComment
(
ProductCommentID int identity(1,1) NOT NULL,
ProductCommentText nvarchar(MAX) NOT NULL,
ProductCommentDate datetime NOT NULL,
postID int NOT NULL,
userID  int NOT NULL,
constraint pk_ProductComment primary key(ProductCommentID),
constraint fk_PostCommentID foreign key (postID) references Post(postID),
constraint fk_UserCommentID foreign key (userID) references UserAccount(userID),
)

create table SystemNotification(
	notiID int identity(1,1) NOT NULL,
	userID int NOT NULL,--noti này là của ai
	firstPostID int,--post của bạn
	secondPostID int,--post ng khác
	notiType int NOT NULL,
	notiDate datetime NOT NULL,
	toUserID int, --ai liên quan tới noti, ai gửi lời mời, ai like...
	expired int,
	seen bit default 0 NOT NULL,
	constraint pk_SystemNotification primary key(notiID),
	constraint fk_userIDs foreign key (userID) references UserAccount(userID),
	constraint fk_firstPostID foreign key (firstPostID) references Post(postID),
	constraint fk_secondPostID foreign key (secondPostID) references Post(postID),
	constraint fk_toUserID foreign key (toUserID) references UserAccount(userID)
)
	--notiType: -1 ,bạn đang đợi exchange
	--notiType: 0 ai đó request exchange bạn	
	--notiType: 1 ,bạn accept exchange của ai đó
	--notiType: 2 ,bạn deny exchange của ai đó
	--notiType: 3 ,ai đó chấp nhận exchange bạn
	--notiType: 4 ,ai đó deny exchange bạn

delete from SystemNotification
delete from exchange
delete from Post

---------------------------------------------------Kết thúc khởi tạo cơ sở dữ liệu-----------------------------------------------




--isvalidate: 1 là user đã xác nhận mail, 0 là user chưa xác nhận mail
---------------------------------------------------Bắt đầu thêm một vài bản ghi cho bảng User------------------------
insert into UserAccount(userUserName,userPassword,userEmail,userFullname,isAdmin,usercreateDate,userfacebookURL, userAvatarURL,isValidate,userRating) values
('quang','$2a$12$h5ig0gmoeE13KBu8Ji4wguSp1diqUKFytj5bVjJpdZom/RFNxQe4K','quanglnnde150066@fpt.edu.vn',N'Nhật Quang LNN',1,GETDATE(),
'www.facebook.com/profile.php?id=100008194183640','/DuniExchange/resource/img/avatar/quang.png',1,0),
('minky','$2a$12$HKf98jZ2JPg5CDCLH7/GuuPO4tRP0JAhe/jmakU.1JnO8Rz.sTJui','tinhhhde150357@fpt.edu.vn',N'Hồ Hữu Tình',1,GETDATE(),
'www.facebook.com/minky.lg2d','/DuniExchange/resource/img/avatar/minky.png',1,0),
('trang','$2a$12$uEAYVuMEuSu6MhbIjHX.M.yWpt/Pd23O91LHXIlOdcbdl69hdw2xS','trangttude150338@fpt.edu.vn',N'Uyên Trang',1,GETDATE(),
'www.facebook.com/profile.php?id=100009267167030','/DuniExchange/resource/img/avatar/trang.png',1,0),
('khoi','$2a$12$BFtT6wdESrTNT4JMhROjnO83hDnCEIwCG1K4sIHCWx6kh2IwO0M06','khoinmde10323@fpt.edu.vn',N'Mạnh Khôi',1,GETDATE(),
'www.facebook.com/profile.php?id=100011319337285','/DuniExchange/resource/img/avatar/khoi.jpg',1,0),
('dat','$2a$12$h5ig0gmoeE13KBu8Ji4wguSp1diqUKFytj5bVjJpdZom/RFNxQe4K','dathdde150170@fpt.edu.vn',N'Đắc Đạt',1,GETDATE(),
'www.facebook.com/profile.php?id=100042160700182','/DuniExchange/resource/img/avatar/Avt-Dat.jpg',1,0)
--quang 123
--minky ykniM
--trang banana
--khoi abcd
--dat 
select * from UserAccount

---------------------------------------------------Kết thúc thêm một vài bản ghi cho bảng User------------------------

---------------------------------------------------Bắt đầu thêm một vài bản ghi cho bảng Category------------------------
insert into Category(categoryName,categoryIcon) values
(N'Thời trang','far fa-shopping-bag'),
(N'Điện tử','far fa-tv'),
(N'Đồ gia dụng','far fa-shopping-basket'),
(N'Giải trí','far fa-gamepad'),
(N'Thực phẩm','far fa-burger-soda'),
(N'Sách','far fa-book'),
(N'Mỹ phẩm','far fa-air-freshener'),
(N'Đồng hồ','far fa-clock'),
(N'Cây, hạt giống & củ' , 'far fa-salad'),
(N'Phụ kiện' , 'far fa-gem'),
(N'Người yêu' , 'far fa-heart'),
(N'Thú cưng' , 'far fa-paw')

select * from Category
---------------------------------------------------Kết thúc thêm một vài bản ghi cho bảng Category------------------------
--delete Post
---------------------------------------------------Bắt đầu thêm một vài bản ghi cho bảng Post------------------------
insert into Post(postUserID,postTitle,postDate,postDescription,postLike,postThumbnailURL) values
(1,N'Chiếc áo phông sặc sỡ, suýt nữa thành đồ gia truyền nhưng nay được đem ra đổi',GETDATE()
,N'Đây là chiếc áo có màu sắc sặc sỡ, được các chuyên gia Trung Quốc lấy cảm hứng từ các thương hiệu nổi tiếng như Gu Sì, Chà Neo,Luonvuituoi , bla bla (giới thiệu sản phẩm)',
3467,'/DuniExchange/resource/img/product-img/AoNhieuMau.jfif'),

(2,N'Combo sách làm giàu chưa đọc, còn nguyên tem',GETDATE(),
N'Bộ sách "Dạy con làm giàu" gồm 13 cuốn được viết bởi Robert T.Kiyosaki được tái bản bằng tiếng Việt hướng dẫn cách làm giàu nhưng chưa đọc ',
1742,'/DuniExchange/resource/img/product-img/SachLamGiau.jpg'),

(3,N'Gói kẹo Chipchip ',GETDATE(),N'Gói kẹo Chipchip mới ăn được một nửa, còn HSD, rất ngon',
4257,'/DuniExchange/resource/img/product-img/candyChip.jfif'),

(4,N'Điện thoại siêu nhân Cuồng phong ',GETDATE(),N'Điện thoại để dành 10 năm nhưng vẫn còn mới không còn phát nhạc được nữa nhưng còn khả năng bắn đĩa',
6864,'/DuniExchange/resource/img/product-img/DongHoSieuNhan.jfif'),

(1,N'Giày thể thao Thượng Đình',GETDATE(),N'Giày bata màu trắng còn mới, mua được 2 tháng, đã xài 5 lần',
4212,'/DuniExchange/resource/img/product-img/giaythuongdinh.jpg'),

(2,N'Máy tính bảng Samsung Galaxy Tab 6',GETDATE(),N'Máy tính Bảng còn nguyên tem bảo hành, không xứt mẻ, còn mới',
6363,'/DuniExchange/resource/img/product-img/taba6.jpg'),

(1,N'Người yêu cũ ',GETDATE(),N'Người yêu mới vừa chia tay 2 ngày trước, nữ, 20 tuổi, ăn nhiều, cao 1m68 thích màu hồng ghét sự giả dối nhưng cực kì giả giối 🙁',
51022,'/DuniExchange/resource/img/product-img/xinhDep.jpeg'),

(4,N'Lợn con ham ăn 2 tuần tuổi nhưng không đủ sức nuôi ',GETDATE(),N'lợn con 600g thông minh biết đi vệ sinh ngay giường chủ biết đòi thức ăn khi đói',
5694,'/DuniExchange/resource/img/product-img/anh-con-heo-dang-yeu.jpg'),

(1,N'Bộ móng đánh đàn tranh pass môn nhạc cũ dân tộc ',GETDATE(),N'ba chiếc móng huyền thoại giúp qua môn DRT103 một cách dễ dàng từ người mới biết chơi đàn hay ngươi chơi đàn lâu năm chỉ cần có bộ móng này thì skill tăng lên đáng kể',
4873,'/DuniExchange/resource/img/product-img/mongDan.jfif'),

(2,N'Bộ 3 cây sáo trúc giúp qua môn nhạc cụ dân tộc ',GETDATE(),N'3 cây sáo có khả năng giúp qua môn nhạc cụ dân tộc. Mỗi cây mang một màu sắc khác nhau nhưng thổi thì như nhau."Một cây làm chẳng nên non. Ba cây chụm lại nên hòn núi cao :)))',
71441,'/DuniExchange/resource/img/product-img/sao.jpg'),

(3,N'Áo Vovinam  ',GETDATE(),N'Áo Vovinam của nam, mặc vào dễ dàng pass môn, tặng kèm 2 đai ',
8660,'/DuniExchange/resource/img/product-img/voPhuc.png'),

(4,N'Bộ sách tiếng Anh Top Notch ',GETDATE(),N'combo 4 cuốn sách tiếng Anh Top Notch 1,2,3,4  dành cho ai có nhu cầu học lại tiếng anh hay những bạn chưa học tiếng anh có thể trao đổi',
9671,'/DuniExchange/resource/img/product-img/topnotch.jpg'),

(2,N'5 viên đá chặn giấy ',GETDATE(),N'5 viên đá chặn giấy nhiều màu sắc có khả năng giúp giấy khỏi bay, gồm xanh lá, đỏ, xanh dương, vàng, tím, cam',
7505,'/DuniExchange/resource/img/product-img/daChanGiay.jpg'),

(2,N'Hộp bút chì màu ',GETDATE(),N'Gồm 1 bộ 12 cây bút chì màu khác nhau, còn mới ',
6441,'/DuniExchange/resource/img/product-img/colormate-hop-go-12-thuong.jpg'),

(3,N'Tài khoản Nexflix ',GETDATE(),N'Tài khoản Nexflix còn 2 tháng muốn đổi sang Disney+ vì hết phim để xem',
5363,'/DuniExchange/resource/img/product-img/netflix.png'),

(1,N'Đồng hồ thông minh AppleWatch ',GETDATE(),N'Đồng hồ còn bảo hành, còn mới, chưa bị xứt mẻ',
4222,'/DuniExchange/resource/img/product-img/DongHo.jpg'),

(1,N'Váy ngủ trẻ em ',GETDATE(),N'váy ngủ trẻ em bỏ kho từ 10 năm trước nay được lôi ra ngoài ánh sáng, vẫn còn mặc được nhưng không bền, nên giặt trước khi mặc',
14113,'/DuniExchange/resource/img/product-img/dam-ngu-tre-em.jpg'),

(2,N'Túi đeo chéo ',GETDATE(),N'Túi đeo chéo sành điệu, có thể đựng điện thoại, ví tiền hay các vật dụng khác, túi còn có thể đựng cả nghiệp của bạn',
3751,'/DuniExchange/resource/img/product-img/tui-deo-cheo-di-choi-03.jpg'),

(5,N'Đồng hồ đeo tay ',GETDATE(),N'Đồng hồ điện tử của hãng casio dành cho học sinh, sinh viên có thể hẹn giờ ,đặt báo thức ',
2219,'/DuniExchange/resource/img/product-img/dongHoCasio.jpg'),

(4,N'Đồng hồ thông minh ',GETDATE(),N'Đồng hồ điện tử samsung Samsung Galaxy Watch 4 màu đen, thời trang, sành đẹu, thích hợp cho mấy bạn ế cần có bồ',
1569,'/DuniExchange/resource/img/product-img/dongHoSamsung.jpg'),

(1,N'Chậu xương rồng ',GETDATE(),N'Chậu xương rồng mini dùng để trang trí phòng, chậu xương rồng có gai chạm vào đau như cảm giác crush bơ mình, a chưa thử nên thử 1 lần',
3453,'/DuniExchange/resource/img/product-img/chauXuongRong.jpg'),

(3,N'Sạc dự phòng ',GETDATE(),N'Sạc dự phòng 10000mah còn mới',
3323,'/DuniExchange/resource/img/product-img/sacDuPhong.jpg'),

(5,N'RAM Laptop ',GETDATE(),N'RAM Laptop Kingston 8G bus 2666MHz. Dung lượng: 8GB Kiểu Ram: DDRam 4 Bus Ram hỗ trợ: 2400 MHz . Độ trễ: N/A. Tản nhiệt: Không. Điện áp: 1.2V. ',
2859,'/DuniExchange/resource/img/product-img/ramLaptop.jpg'),

(4,N'Dây cáp HDMI ',GETDATE(),N'Bạn đang tìm kiếm 1 dòng cáp có khả năng kết nối 2 thiết bị có khoảng cách từ xa? Cáp HDMI 10m giúp kết nối dễ dàng giữa TV Box, DVD, Laptop,… và máy chiếu, smart TV, PC,… ở những không gian rộng rãi, mang đến độ phân giải vô cùng tuyệt vời.',
6244,'/DuniExchange/resource/img/product-img/capHdmi.jpg'),

(2,N'Đồng hồ báo thức ',GETDATE(),N'Nhác dậy sớm nên không dùng nữa. Đồng hồ nhỏ gọn, xin xắn, tiện lợi.',
56329,'/DuniExchange/resource/img/product-img/dongHoBaoThuc.jpg'),

(1,N'Điện thoại di động ',GETDATE(),N'Điện thoại di động Vsmart joy 3 chính hãng còn mới, kiểu dáng sành điệu, trai gái đều có thể sử dụng ',
4123,'/DuniExchange/resource/img/product-img/dienThoaiDiDong.jpg'),

(2,N'Giá để điện thoại',GETDATE(),N'Giá để điện thoại đơn giản, bạn nào ko có chỗ gác đt hãy đổi với mình ',
8269,'/DuniExchange/resource/img/product-img/giaDeDienThoai.png'),

(3,N'Thẻ ghi nhớ',GETDATE(),N'Thẻ ghi nhớ tiếng Nhật cho bạn nào khó học thuộc từ vựng',
7452,'/DuniExchange/resource/img/product-img/theGhiNhoTuVung.jfif'),

(4,N'Tủ lạnh',GETDATE(),N'Tủ lạn mini đã cũ nhưng còn dùng tốt',
9844,'/DuniExchange/resource/img/product-img/tuLanhMini.jpg'),

(5,N'Tai nghe ',GETDATE(),N'Tai nghe huyền thoại hiệu con trâu vàng, dù có thâm niên khá lâu năm nhưng còn dùng được ',
1547,'/DuniExchange/resource/img/product-img/taiNghe.jpg'),

(1,N'Son môi ',GETDATE(),N'Son dưỡng môi mua ngoài chợ, xài không được ưng cho lắm, còn mới',
8874,'/DuniExchange/resource/img/product-img/sonMoi.jfif'),

(2,N'Bút chì',GETDATE(),N'Bút chì ielts mới dùng được một nửa, bạn nào thi ielts hãy lấy chiếc bút chì này ngay để buff may mắn',
8754,'/DuniExchange/resource/img/product-img/butChi.jfif'),

(3,N'Phấn mắt',GETDATE(),N'Phấn mắt nhiều màu còn mới, nhỏ gọn, giúp người sử dụng xinh đẹp hơn trong mắt crush',
7345,'/DuniExchange/resource/img/product-img/phanMat.jfif'),

(4,N'Lược',GETDATE(),N'Nhìn bề ngoài như lược nhựa nhưng thực ra đây là chiếc lược ngà mà bố con ông Sáu đã trao nhau, sau đó được truyền qua nhiều thế hệ và bây giờ đã đến tay mình. Chiếc lược có giá trị lịch sử, văn học vô cùng quan trọng',
6844,'/DuniExchange/resource/img/product-img/luocNga.jfif'),

(5,N'Bút máy ',GETDATE(),N'Bút máy điểm 10, làm môn nào môn đó 10 điểm ',
1547,'/DuniExchange/resource/img/product-img/butMay.jfif'),

(1,N'Bóng rổ ',GETDATE(),N'Bóng rổ loại 5, còn tâng tốt',
8874,'/DuniExchange/resource/img/product-img/bongRo.jfif'),

(2,N'Bút mực',GETDATE(),N'Do không quen xài bút mực nên trade cho bạn nào muốn dùng, còn 3 cây mới toanh',
7554,'/DuniExchange/resource/img/product-img/butChi.jfif'),

(3,N'Phấn mắt',GETDATE(),N'Phấn mắt nhiều màu còn mới, nhỏ gọn, giúp người sử dụng xinh đẹp hơn trong mắt crush',
2345,'/DuniExchange/resource/img/product-img/phanMat.jfif'),

(4,N'Vợt bóng bàn',GETDATE(),N'Dành cho những bạn có niềm đam mê bóng bàn là một cặp vợt đến từ Nhật, còn zin, chưa sứt mẻ gì.',
1844,'/DuniExchange/resource/img/product-img/votBongBan.jfif'),

(5,N'Đồ bơi',GETDATE(),N'Combo đồ bơi cho những bạn thích đi boi. Thiếu mỗi cái quần.',
1547,'/DuniExchange/resource/img/product-img/doBoi.jfif'),

(1,N'Vợt cầu lông',GETDATE(),N'Chiếc vợt gia truyền qua hai đời được anh để lại. Hàng chất lượng cao còn dùng tốt.',
8874,'/DuniExchange/resource/img/product-img/votCauLong.jfif'),

(2,N'Bóng đá',GETDATE(),N'Quả bóng đá UHV 2.05 số 4 Động Lực.Trái này tuy đã lâu nhưng cong dùng tốt',
7541,'/DuniExchange/resource/img/product-img/bongDa.jfif'),

(3,N'Gậy Bida',GETDATE(),N'Cơ thủ nào ở đây có cần gậy bida thì hãy trade ngay con hàng nóng này. Gậy bida Supreme được nhập từ Trung Quốc với số lượng có hạn, hàng mới xài 1 lần còn tốt.',
3456,'/DuniExchange/resource/img/product-img/gayBida.jfif'),

(4,N'Súng nước',GETDATE(),N'Súng nước mini, bắn gì cũng trúng:3',
8454,'/DuniExchange/resource/img/product-img/sungNuoc.jfif'),

(5,N'Chổi',GETDATE(),N'Phải lìa xa căn phòng trọ nên tặng cho bạn nào cần. Một cây chổi cọ còn tốt.',
1547,'/DuniExchange/resource/img/product-img/doBoi.jfif'),

(1,N'Cọ bồn cầu',GETDATE(),N'Cọ bồn cầu là vật dụng không thể thiếu trong các dụng cụ làm sạch nhà vệ sinh. Nếu bạn muốn giữ cho nhà vệ sinh sạch sẽ thì hãy đổi ngay lấy chiếc cọ này',
8874,'/DuniExchange/resource/img/product-img/coBonCau.jfif'),

(2,N'Khuyên tai',GETDATE(),N'Bộ khuyên tai thiết kế đơn giản được đính ngọc trai cực kì đẹ dành cho bạn nào muốn. ',
7654,'/DuniExchange/resource/img/product-img/khuyenTai.jfif'),

(3,N'Máy ảnh',GETDATE(),N'Bạn cần lưu giữ những bức ảnh một cách rõ nét nhất? đã có chiếc máy ảnh canon550D giúp chụp những bức ảnh cực kì chất lượng.',
3445,'/DuniExchange/resource/img/product-img/mayAnh.jfif'),

(4,N'Sách',GETDATE(),N'Nhắc đến cuốn sách Đắc Nhân Tâm, chắc hẳn bạn nào cũng đã một lần được đọc qua và nghe đến cái tên này. Giờ đây bạn có thể sở hữu cuốn sách này ngay trên kệ sách của bạn.',
8244,'/DuniExchange/resource/img/product-img/sachDacNhanTam.jfif'),

(5,N'Truyện',GETDATE(),N'Cuốn truyện conan tập một dành cho những bạn nào muốn đọc cũng như trang trí thêm vào tủ sách của bạn.',
1547,'/DuniExchange/resource/img/product-img/truyenConan.jfif'),

(1,N'Xe điều khiển',GETDATE(),N'Xe điều khiển từ xa',
8874,'/DuniExchange/resource/img/product-img/xeDieuKhien.jfif'),

(2,N'Gấu bông',GETDATE(),N'Gấu bông dành tặng cho bồ hoặc crush',
7554,'/DuniExchange/resource/img/product-img/gauBong.jfif'),

(3,N'Áo khoác',GETDATE(),N'Áo khoác cũ, hết trend nên không mặc nữa.',
3445,'/DuniExchange/resource/img/product-img/aoKhoac.jfif'),

(4,N'Máy sấy',GETDATE(),N'Máy sấy tóc Funrin với công suất lớn gấp 10 lần máy sấy thường, luôn giúp bạn dễ dàng tạo kiểu tóc đẹp ưng ý. Với công nghệ cao đến từ Nhật Bản giúp bảo vệ tóc bạn tối đa trong quá trình sử dụng.',
844,'/DuniExchange/resource/img/product-img/maySayToc.jfif'),

(5,N'Máy tính bảng',GETDATE(),N'Máy tính bảng Huewei dành cho bạn nào cần cho chơi game hay học tập đều được. Vì không cần dùng nữa nên muốn cho đi, ai cần liên hệ em nha. Máy còn khá mới.',
1547,'/DuniExchange/resource/img/product-img/mayTinhBang.jfif'),

(1,N'Máy ảnh kỹ thuật số',GETDATE(),N'Một thiết bị cực kì hữu ích dành cho bạn nào hay đi du lịch.',
8874,'/DuniExchange/resource/img/product-img/mayAnhKyThuatSo.jfif'),

(2,N'Chuột Gaming ',GETDATE(),N'Bạn nào cần chuột để chơi game thì hãy liên hệ ngay vs mình để đổi chuột nhá.',
4754,'/DuniExchange/resource/img/product-img/chuotGaming.jfif'),

(3,N'Chuột không dây',GETDATE(),N'chuột không dây thiết kế nhỏ gọn, áp dụng động cơ sinh học linh hoạt nhậy bén độ chính xác cao lên đến 1600DPI tạo ra môi trường yên tĩnh khi trong phòng học hay làm việc',
6345,'/DuniExchange/resource/img/product-img/chuotKhongDay.jfif'),

(4,N'Chuột máy tính',GETDATE(),N'Chuột quang Nec cổng USB, mặt hàng huyền thoại đến từ nhật, vẫn còn dùng được. Dành cho bạn nào muốn trải nghiệm cảm giác xưa cũ.',
2844,'/DuniExchange/resource/img/product-img/chuotMayTinh.jfif'),

(5,N'Lót chuột cỡ lớn',GETDATE(),N'Miếng Lót Chuột Overwacth có thiết kế bắt mắt, độc đáo với màu sắc vô cùng ấn tượng. Giúp tăng cường độ chính xác cảm biến cho người sử dụng, đặc biệt là các game thủ',
31547,'/DuniExchange/resource/img/product-img/lotChuotCoLon.jfif'),

(1,N'Lót chuột',GETDATE(),N'Có dư một miếng lót chuột đã cũ nhưng còn dùng được. Dành cho bạn nào đang thiếu.',
18874,'/DuniExchange/resource/img/product-img/lotChuot.jfif'),

(2,N'Xe đạp',GETDATE(),N'Chiếc xe đạp mang nhãn hiệu huyền thoại Phượng Hoàng. Dù đã qua sử dụng nhưng bảo quản tốt nên còn chạy khỏe. ',
3754,'/DuniExchange/resource/img/product-img/xeDap.jfif'),

(3,N'Playstation 2',GETDATE(),N'Máy chơi game playstation2 dành cho bạn nào muốn relax sau những ngày học tập căng thẳng.',
1345,'/DuniExchange/resource/img/product-img/playstation2.jfif'),

(4,N'FidgetSpinner',GETDATE(),N'Con quay Fidget Spinner có thể giúp giảm stress và bồn chồn. ',
8244,'/DuniExchange/resource/img/product-img/fidgetSpinner.jfif')
---------------------------------------------------Kết thúc thêm một vài bản ghi cho bảng Post------------------------

---------------------------------------------------Bắt đầu thêm một vài bản ghi cho bảng ProductComment------------------------
insert into ProductComment(ProductCommentText, ProductCommentDate, postID, userID) values
(N'Gất Kảm Động',GETDATE(),'1','1'),
(N'Sản phẩm thật tuyệt vời',GETDATE(),'2','2'),
(N'Nhìn rất tốt nhưng không muốn đổi',GETDATE(),'3','3')
--delete from ProductComment
Select * from ProductComment

---------------------------------------------------Kết thúc thêm một vài bản ghi cho bảng ProductComment------------------------

------------------------------Bắt đầu thêm một vài bản ghi cho bảng ProductImage------------------------
insert into PostImage(postID,postImageURL) values 
(3,'/DuniExchange/resource/img/product-img/Big-images-B.png'),
(3,'/DuniExchange/resource/img/product-img/Big-images-A.png'),
(3,'/DuniExchange/resource/img/product-img/Big-images-C.png'),
(1,'/DuniExchange/resource/img/product-img/AoNhieuMau.jfif'),
(2,'/DuniExchange/resource/img/product-img/SachLamGiau.jpg'),
(3,'/DuniExchange/resource/img/product-img/candyChip.jfif'),
(4,'/DuniExchange/resource/img/product-img/DongHoSieuNhan.jfif'),
(5,'/DuniExchange/resource/img/product-img/giaythuongdinh.jpg'),
(6,'/DuniExchange/resource/img/product-img/taba6.jpg'),
(7,'/DuniExchange/resource/img/product-img/xinhDep.jpeg'),
(8,'/DuniExchange/resource/img/product-img/anh-con-heo-dang-yeu.jpg'),
(9,'/DuniExchange/resource/img/product-img/mongDan.jfif'),
(10,'/DuniExchange/resource/img/product-img/sao.jpg'),
(11,'/DuniExchange/resource/img/product-img/voPhuc.png'),
(12,'/DuniExchange/resource/img/product-img/topnotch.jpg'),
(13,'/DuniExchange/resource/img/product-img/changiay.jfif'),
(14,'/DuniExchange/resource/img/product-img/colormate-hop-go-12-thuong.jpg'),
(15,'/DuniExchange/resource/img/product-img/download.png'),
(16,'/DuniExchange/resource/img/product-img/DongHo.jpg'),
(17,'/DuniExchange/resource/img/product-img/dam-ngu-tre-em.jpg'),
(18,'/DuniExchange/resource/img/product-img/tui-deo-cheo-di-choi-03.jpg')
------------------------------Kết thúc thêm một vài bản ghi cho bảng ProductImage------------------------


------------------------------Bắt đầu thêm một vài bản ghi cho bảng CategoryPost------------------------
select * from Post
select * from Category
insert into PostCategory(postID,categoryID) values
(1,1),
(2,4),
(2,2)

select *
from Post a, UserAccount b
where a.postUserID = b.userID


insert into PostCategory(categoryID,postID) values
(1,5),(1,11),(1,16),(1,17),(1,18),(2,4),(2,6),(2,15),
(2,16),(4,9),(4,15),(4,10),(6,2),(6,13),(6,12),
(8,16),(10,13),(10,9),(11,7),(12,8)

select * from PostCategory
------------------------------Kết thúc thêm một vài bản ghi cho bảng CategoryPost------------------------


------------------------------Bắt đầu thêm một vài bản ghi cho bảng Exchange------------------------
insert into Exchange(postRequestDate,firstPostID,secondPostID,responseDate,exchangeState) values



delete from Exchange

select * from (
	select exchangeID, postRequestDate, firstPostID, secondPostID, responseDate, exchangeState, seen, postTitle, postUserID, postID
	from Exchange a, Post c
	where a.firstPostID = c.postID and c.postUserID = 1
	order by postRequestDate desc) a, UserAccount b
where a.postID = b.userID

select exchangeID, postRequestDate, firstPostID, f.firstPostTitle, secondPostID, f.secondPostTitle, g.postUserID ,responseDate, exchangeState, seen,f.postUserID
from
	(select exchangeID, postRequestDate, firstPostID, d.postTitle as 'firstPostTitle', secondPostID, e.postTitle as 'secondPostTitle', responseDate, exchangeState, seen,d.postUserID
	from
		(select *
		from Exchange a, Post c
		where a.firstPostID = c.postID and c.postUserID = 1
		) d, Post e
	where d.secondPostID = e.postID) f, Post g
where f.secondPostID = g.postID


select *
from Exchange a, Post c
where a.firstPostID = c.postID and c.postUserID = 1
order by postRequestDate desc

------------------------------Kết thúc thêm một vài bản ghi cho bảng Exchange------------------------

-----------------------------------------------------Tạo view và Trigger-----------------------------------------------




-----------------------------------------P1-------View cho Post và category----------P1--------
create view ViewPostAndCategory as
select a.postID, postUserID,postTitle,postDate,postDescription,postLike,postThumbnailURL,categoryName 
from Post a,PostCategory b,Category c where a.postID = b.postID and b.categoryID = c.categoryID

select * from ViewPostAndCategory
-----Hết P1----------------------------------------------





----P2--------Trigger cho bảng Account - Mục đích: username không được trùng

--Trigger dành cho LikePostUser khi cật nhập sẽ cật nhập cả Like bên phía của Post
create trigger PostLikeUserTrigger on PostLikeUser after insert, delete
as
begin
	declare @postID int;
	if exists (select 1 from inserted)
	   begin		
			set @postID = (select inserted.postID from inserted);
			update Post set postLike += 1 where postID = @postID
	   end
	else
	   begin
			set @postID = (select deleted.postID from deleted);			
			update Post set postLike -= 1 where postID = @postID
	   end
end

create trigger PostLikeUserPreventUpdate on PostLikeUser after update
as
begin
     begin
         raiserror('Cannot update rows',16,1) 
         rollback transaction
         return;
     end
end

select * from PostLikeUser

insert into PostLikeUser values (1, 2)
insert into PostLikeUser values (4, 2)
insert into PostLikeUser values (7, 2)
insert into PostLikeUser values (1, 3)
insert into PostLikeUser values (4, 3)
insert into PostLikeUser values (7, 3)
insert into PostLikeUser values (1, 4)
insert into PostLikeUser values (4, 4)
insert into PostLikeUser values (7, 4)
insert into PostLikeUser values (1, 5)
insert into PostLikeUser values (4, 5)
insert into PostLikeUser values (7, 5)
update PostLikeUser set userID=2 where postID = 68
--B1-<KHONG CAN CUNG DUOC>--Tạo function trả về bảng username trùng với giá trị nhập vào-----------

--create function checkUsernameExist (@username varchar(20)) returns table
--as return (select * from Account where Account.username = @username)

--if not exists (select * from checkUsernameExist('trang')) print 'Khong CO'
--else print N'Có'
--B2---Tạo trigger ngăn việc chèn hoặc update trùng username

create trigger AccountTrigger on UserAccount after insert, update
as
begin
	declare @newUsername varchar(20);
	set @newUsername = (select inserted.userUserName from inserted);
	if (1< (select count(*) from UserAccount where UserAccount.userUserName = @newUsername))
		begin
			print N'Username này đã tồn tại'
			print @newUsername
			rollback transaction
		end
	else
		begin
			print N'Thêm thành công'
			commit transaction
		end
end
----Hết P2----------------------------------------------------------------------------------------------------------

----P3--------Trigger cho bảng Category - Mục đích: categoryName không được trùng
--B1--------tạo function trả về những category trùng với category nhập vô

select * from Category
create function checkCategoryNameExist (@categoryName nvarchar(30)) returns table
as return (select * from Category where Category.categoryName = @categoryName)

select * from checkCategoryNameExist(N'Thời trang')

--B2---Tạo trigger ngăn việc chèn hoặc update trùng categoryName

create trigger CategoryTrigger on Category after insert, update
as
begin
	declare @categoryName nvarchar(30)
	set @categoryName = (select categoryName from inserted)
	if ( 1 < (select count(*) from checkCategoryNameExist(@categoryName)))
		begin
			print N'CategoryName này đã tồn tại'
			rollback transaction
		end
	else
		begin
			print N'Thêm thành công'
			commit transaction
		end
end

--Ví dụ
select * from Category
insert into Category(categoryName,categoryIcon) values
(N'Thực phẩm','')