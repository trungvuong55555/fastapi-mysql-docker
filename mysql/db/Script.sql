-- API lay du lieu khi nhap ten tac gia

-- controller lay thong tin sach
select bc.ChapterName , b.PathSource , bc.PathSource 
from Books b inner join BookChapter bc ON b.BookId = bc.BookId 
where b.BookId = 1 and bc.ChapterId = 1;

-- lay toan bo thong tin sach
select AuthorId, AuthorName, AuthorDescr, c.CategoryId, c.CategoryName, b.BookId, b.BookName, b.Released, b.BookDescription, b.NumberRead 
from Books b inner join Author a on b.AuthorId = a.AuthorId inner join Category c on b.CategoryId = c.CategoryId
where 
b.BookName = '' 
and a.AuthorName = '' 
and c.CategoryName = '';

-- lay thong tin sach kem theo chapter
select bc.ChapterName 
from Books b inner join BookChapter bc on b.BookId = bc.BookId 
where b.BookId = 1;

-- update vao bang history
insert into History (BookId, DeviceId) values (1, 1);

-- controller update thong tin so trang doc cua sach

update Books 
set NumberRead = NumberRead + 1 
where Books.BookId = 1;

-- Nhom API playlist
-- them sach moi vao play list
insert into PlayList (PlayListName, DeviceId, BookId) values ('My playlist', 1, 2);

DELETE from PlayList where DeviceId = 1 and BookId = 1;

-- lay tat ca thong tin sach tu deviced id
select b.BookId , b.BookName , b.AuthorId , b.CategoryId , b.Released , b.BookDescription , b.NumberRead 
from PlayList pl inner join Books b on pl.BookId = b.BookId 
where pl.DeviceId = 1;

update Books 
set NumberRead = NumberRead + 1 
where Books.BookId = 1

UPDATE BookChapter 
set PathSource = 'home/quan/Documents/sample.pdf'
where ChapterId = 1;
