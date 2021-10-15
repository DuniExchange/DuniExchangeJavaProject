

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
constraint pk_Post primary key (postID),
constraint fk_PostAccount foreign key (postUserID) references UserAccount(userID)
)
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


create table ProductImage
(
postID int NOT NULL,
imageURL nvarchar(50) NOT NULL,
constraint fk_PostImage foreign key (postID) references Post(postID),
constraint pk_ProductImage primary key (postID, imageURL)
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
postExchangeDate datetime NOT NULL,
firstPostID int NOT NULL,
secondPostID int NOT NULL,
exchangeState int NOT NULL,
constraint pk_Exchange primary key(exchangeID),
constraint fk_ApostID foreign key (firstPostID) references Post(postID),
constraint fk_BpostID foreign key (secondPostID) references Post(postID),
)
go


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
'www.facebook.com/profile.php?id=100011319337285','/DuniExchange/resource/img/avatar/khoi.png',1,0)

--quang 123
--minky ykniM
--trang banana
--khoi abcd

select * from UserAccount

---------------------------------------------------Kết thúc thêm một vài bản ghi cho bảng User------------------------

---------------------------------------------------Bắt đầu thêm một vài bản ghi cho bảng Category------------------------
insert into Category(categoryName,categoryIcon) values
(N'Thời trang','fa fa-shopping-bag'),
(N'Điện tử','fas fa-tv'),
(N'Đồ gia dụng','fa fa-shopping-basket'),
(N'Giải trí','fa fa-gamepad'),
(N'Thực phẩm','fa fa-cutlery'),
(N'Sách','fa fa-book'),
(N'Mỹ phẩm','fa fa-cosmetic'),
(N'Đồng hồ','fa fa-clock'),
(N'Cây, hạt giống & củ' , 'fa fa-tree'),
(N'Phụ kiện' , 'fas fa-gem'),
(N'Người yêu' , 'fas fa-heart'),
(N'Thú cưng' , 'fas fa-paw')

select * from Category
---------------------------------------------------Kết thúc thêm một vài bản ghi cho bảng Category------------------------
--delete Post
---------------------------------------------------Bắt đầu thêm một vài bản ghi cho bảng Post------------------------
insert into Post(postUserID,postTitle,postDate,postDescription,postLike,postThumbnailURL) values
(1,N'Chiếc áo phông sặc sỡ, suýt nữa thành đồ gia truyền nhưng nay được đem ra đổi',GETDATE()
,N'Đây là chiếc áo có màu sắc sặc sỡ, được các chuyên gia Trung Quốc lấy cảm hứng từ các thương hiệu nổi tiếng như Gu Sì, Chà Neo,Luonvuituoi , bla bla (giới thiệu sản phẩm)',
0,'/DuniExchange/resource/img/product-img/AoNhieuMau.jfif'),
(2,N'Combo sách làm giàu chưa đọc, còn nguyên tem',GETDATE(),
N'Bộ sách "Dạy con làm giàu" gồm 13 cuốn được viết bởi Robert T.Kiyosaki được tái bản bằng tiếng Việt hướng dẫn cách làm giàu nhưng chưa đọc ',3,'/DuniExchange/resource/img/product-img/SachLamGiau.jpg'),
(3,N'Gói kẹo Chipchip ',GETDATE(),N'Gói kẹo Chipchip mới ăn được một nửa, còn HSD, rất ngon',2,'/DuniExchange/resource/img/product-img/candyChip.jfif'),
(4,N'Điện thoại siêu nhân Cuồng phong ',GETDATE(),N'Điện thoại để dành 10 năm nhưng vẫn còn mới không còn phát nhạc được nữa nhưng còn khả năng bắn đĩa',
2,'/DuniExchange/resource/img/product-img/DongHoSieuNhan.jfif'),
(1,N'Giày thể thao Thượng Đình',GETDATE(),N'Giày bata màu trắng còn mới, mua được 2 tháng, đã xài 5 lần',
2,'/DuniExchange/resource/img/product-img/giaythuongdinh.jpg'),
(2,N'Máy tính bảng Samsung Galaxy Tab 6',GETDATE(),N'Máy tính Bảng còn nguyên tem bảo hành, không xứt mẻ, còn mới',
2,'/DuniExchange/resource/img/product-img/taba6.jpg'),
(1,N'Người yêu cũ ',GETDATE(),N'Người yêu mới vừa chia tay 2 ngày trước, nữ, 20 tuổi, ăn nhiều, cao 1m68 thích màu hồng ghét sự giả dối nhưng cực kì giả giối :(',
10,'/DuniExchange/resource/img/product-img/xinhDep.jpeg'),
(4,N'Lợn con ham ăn 2 tuần tuổi nhưng không đủ sức nuôi ',GETDATE(),N'lợn con 600g thông minh biết đi vệ sinh ngay giường chủ biết đòi thức ăn khi đói',
6,'/DuniExchange/resource/img/product-img/anh-con-heo-dang-yeu.jpg'),
(1,N'Bộ móng đánh đàn tranh pass môn nhạc cũ dân tộc ',GETDATE(),N'ba chiếc móng huyền thoại giúp qua môn DRT103 một cách dễ dàng từ người mới biết chơi đàn hay ngươi chơi đàn lâu năm chỉ cần có bộ móng này thì skill tăng lên đáng kể',
8,'/DuniExchange/resource/img/product-img/mongDan.jfif'),
(2,N'Bộ 3 cây sáo trúc giúp qua môn nhạc cụ dân tộc ',GETDATE(),N'3 cây sáo có khả năng giúp qua môn nhạc cụ dân tộc. Mỗi cây mang một màu sắc khác nhau nhưng thổi thì như nhau."Một cây làm chẳng nên non. Ba cây chụm lại nên hòn núi cao :)))',
14,'/DuniExchange/resource/img/product-img/sao.jpg'),
(3,N'Áo Vovinam  ',GETDATE(),N'Áo Vovinam của nam, mặc vào dễ dàng pass môn, tặng kèm 2 đai ',
6,'/DuniExchange/resource/img/product-img/voPhuc.png'),
(4,N'Bộ sách tiếng Anh Top Notch ',GETDATE(),N'combo 4 cuốn sách tiếng Anh Top Notch 1,2,3,4  dành cho ai có nhu cầu học lại tiếng anh hay những bạn chưa học tiếng anh có thể trao đổi',
6,'/DuniExchange/resource/img/product-img/topnotch.jpg'),
(2,N'5 viên đá chặn giấy ',GETDATE(),N'5 viên đá chặn giấy nhiều màu sắc có khả năng giúp giấy khỏi bay, gồm xanh lá, đỏ, xanh dương, vàng, tím, cam',
6,'/DuniExchange/resource/img/product-img/changiay.jfif'),
(2,N'Hộp bút chì màu ',GETDATE(),N'Gồm 1 bộ 12 cây bút chì màu khác nhau, còn mới ',
6,'/DuniExchange/resource/img/product-img/colormate-hop-go-12-thuong.jpg'),
(3,N'Tài khoản Nexflix ',GETDATE(),N'Tài khoản Nexflix còn 2 tháng muốn đổi sang Disney+ vì hết phim để xem',
6,'/DuniExchange/resource/img/product-img/download.png'),
(1,N'Đồng hồ thông minh AppleWatch ',GETDATE(),N'Đồng hồ còn bảo hành, còn mới, chưa bị xứt mẻ',
6,'/DuniExchange/resource/img/product-img/DongHo.jpg'),
(1,N'Váy ngủ trẻ em ',GETDATE(),N'váy ngủ trẻ em bỏ kho từ 10 năm trước nay được lôi ra ngoài ánh sáng, vẫn còn mặc được nhưng không bền, nên giặt trước khi mặc',
6,'/DuniExchange/resource/img/product-img/dam-ngu-tre-em.jpg'),
(2,N'Túi đeo chéo ',GETDATE(),N'Túi đeo chéo sành điệu, có thể đựng điện thoại, ví tiền hay các vật dụng khác, túi còn có thể đựng cả nghiệp của bạn',
6,'/DuniExchange/resource/img/product-img/tui-deo-cheo-di-choi-03.jpg')

select * from Post
---------------------------------------------------Kết thúc thêm một vài bản ghi cho bảng Post------------------------

------------------------------Bắt đầu thêm một vài bản ghi cho bảng ProductImage------------------------

--insert into ProductImage(postID,imageURL) values 
--(3,'images/Apollo-images/Big-images-B.png'),
--(3,'images/Apollo-images/Big-images-A.png'),
--(3,'images/Apollo-images/Big-images-C.png')
--select * from ProductImage
------------------------------Kết thúc thêm một vài bản ghi cho bảng ProductImage------------------------


------------------------------Bắt đầu thêm một vài bản ghi cho bảng CategoryPost------------------------
select * from Post
select * from Category
insert into PostCategory(postID,categoryID) values
(1,1),
(2,4),
(2,2),
(3,5)

select * from PostCategory
------------------------------Kết thúc thêm một vài bản ghi cho bảng CategoryPost------------------------


------------------------------Bắt đầu thêm một vài bản ghi cho bảng Exchange------------------------
insert into Exchange(postExchangeDate,firstPostID,secondPostID,exchangeState) values
(GETDATE(),14,5,1),
(GETDATE(),7,2,0)
------------------------------Kết thúc thêm một vài bản ghi cho bảng Exchange------------------------

-----------------------------------------------------Tạo view và Trigger-----------------------------------------------




-----------------------------------------P1-------View cho Post và category----------P1--------
create view ViewPostAndCategory as
select a.postID, postUserID,postTitle,postDate,postDescription,postLike,postThumbnailURL,categoryName 
from Post a,PostCategory b,Category c where a.postID = b.postID and b.categoryID = c.categoryID

select * from ViewPostAndCategory
-----Hết P1----------------------------------------------





----P2--------Trigger cho bảng Account - Mục đích: username không được trùng

--B1-<KHONG CAN CUNG DUOC>--Tạo function trả về bảng username trùng với giá trị nhập vào-----------

--create function checkUsernameExist (@username varchar(20)) returns table
--as return (select * from Account where Account.username = @username)

--if not exists (select * from checkUsernameExist('trang')) print 'Khong CO'
--else print N'Có'
--B2---Tạo trigger ngăn việc chèn hoặc update trùng username

create trigger AccountTrigger on Account after insert, update
as
begin
	declare @newUsername varchar(20);
	set @newUsername = (select inserted.username from inserted);
	if (1< (select count(*) from Account where Account.username = @newUsername))
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

--Ví dụ
select * from Account
insert into Account(username,userPassword,userEmail,userFullname,isAdmin,createDate,facebookURL,userImage) values
('trang23','banana','trangttude150338@fpt.edu.vn',N'Uyên Trang',1,GETDATE(),
'www.facebook.com/profile.php?id=100009267167030',''),
('khoi','abcd','khoinmde150323@fpt.edu.vn',N'Mạnh Khôi',1,GETDATE(),
'www.facebook.com/profile.php?id=100011319337285',''),
('quang','123','quanglnnde150066@fpt.edu.vn',N'Nhật Quang LNN',1,GETDATE(),
'www.facebook.com/profile.php?id=100008194183640',''),
('minky','ykniM','tinhhhde150357@fpt.edu.vn',N'Hồ Hữu Tình',1,GETDATE(),
'www.facebook.com/minky.lg2d','')

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