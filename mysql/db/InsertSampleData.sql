-- insert author
INSERT INTO Author (AuthorID ,AuthorName, AuthorDescr)
VALUES
(1, 'Vũ Trọng Phụng', 'Vũ Trọng Phụng là một trong những nhà văn nổi bật nhất của văn học Việt Nam. Ông sinh ra trong một gia đình nghèo khó tại Hà Nội và mất sớm ở tuổi 27 vì bệnh lao. Dù cuộc đời ngắn ngủi, Vũ Trọng Phụng đã để lại nhiều tác phẩm văn học có giá trị, phản ánh sâu sắc hiện thực xã hội Việt Nam thời kỳ Pháp thuộc.'),
(2, 'Arthur Conan Doyle', 'Arthur Conan Doyle là một nhà văn và bác sĩ người Anh, nổi tiếng nhất với việc sáng tạo ra nhân vật thám tử Sherlock Holmes. Ông sinh ra tại Edinburgh, Scotland, và học y khoa tại Đại học Edinburgh. Sau một thời gian làm bác sĩ, ông bắt đầu viết văn và nhanh chóng nổi tiếng.');

-- insert category
insert into Category (CategoryId, CategoryName)
values
(1, 'Văn học Việt Nam'),
(2, 'Văn học nước ngoài');

-- insert book

 INSERT INTO Books (BookId  ,BookName, AuthorId, CategoryId, Released, PathSource, BookDescription, CoverImage, NumberRead)
VALUES
(1, 'Kỹ nghệ lấy Tây',  1, 1, '1934-01-01', 'E:\THINHPQ\reactnative\ttnm\fastapi-mysql-docker\data', 'Kỹ nghệ lấy Tây là một tiểu thuyết nổi tiếng của Vũ Trọng Phụng, xuất bản lần đầu vào năm 1934. Tác phẩm này mô tả một cách sinh động và châm biếm về xã hội Việt Nam thời kỳ Pháp thuộc, đặc biệt là những hiện tượng xã hội mới nổi lên do ảnh hưởng của văn hóa và lối sống phương Tây.', 'https://www.sachhayonline.com/data/book-photos/25.jpg', 150),
(2, 'Vỡ đê',  1, 1, '1936-01-01', 'E:\THINHPQ\reactnative\ttnm\fastapi-mysql-docker\data', 'Câu chuyện xoay quanh cuộc sống của những người dân nghèo khổ sống trong vùng bị lụt vào thời Pháp thuộc. Họ phải đối mặt với sự khắc nghiệt của thiên nhiên và cả sự thờ ơ, vô trách nhiệm của những kẻ có quyền lực. Trong khi người dân phải vật lộn với đói khổ và bệnh tật, các quan chức và những người có địa vị lại lợi dụng thảm họa để kiếm lợi cho bản thân.', 'https://www.sachhayonline.com/data/book-photos/26.jpg', 250),
(3, 'Cung đàn sau cuối',  2, 2, '1917-01-01', 'E:\THINHPQ\reactnative\ttnm\fastapi-mysql-docker\data', 'Câu chuyện bắt đầu khi Sherlock Holmes điều tra vụ trộm viên kim cương Mazarin, một bảo vật có giá trị lớn.', 'https://www.sachhayonline.com/data/book-photos/97.jpg', 50);


-- insert Chapter
INSERT INTO BookChapter (BookId, ChapterId, ChapterName, PathSource)
VALUES
(1, 1, 'chuong1', 'chuong1.txt'),
(1, 2, 'chuong2', 'chuong2.txt'),
(1, 3, 'chuong3', 'chuong3.txt'),
(1, 4, 'chuong4', 'chuong4.txt'),
(1, 5, 'chuong5', 'chuong5.txt'),
(1, 6, 'chuong6', 'chuong6.txt'),
(1, 7, 'chuong7', 'chuong7.txt'),
(1, 8, 'chuong8', 'chuong8.txt'),
(2, 1, 'chuong1', 'chuong1.txt'),
(2, 2, 'chuong2', 'chuong2.txt'),
(2, 3, 'chuong3', 'chuong3.txt'),
(3, 1, 'chuong1', 'chuong1.txt'),
(3, 2, 'chuong2', 'chuong2.txt');

 -- insert deviceID
 insert into Device (DeviceId, UserName, UserAge, UserGender, UserInterest)
 values (1, 'Quan', 24, 'Male', 'Reading Books');