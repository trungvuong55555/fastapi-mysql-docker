-- insert table author
INSERT INTO Author (AuthorName, AuthorDescr)
VALUES
  ('J.K. Rowling', 'British novelist, best known as the author of the Harry Potter fantasy series'),
  ('Agatha Christie', 'English crime novelist, short story writer, playwright, and poet, best known for her detective novels and short stories'),
  ('Dan Brown', 'American author of thriller novels, best known for his Robert Langdon series'),
  ('Paulo Coelho', 'Brazilian lyricist and novelist, best known for his international best-selling novel The Alchemist'),
  ('Harper Lee', 'American novelist who wrote the Pulitzer Prize-winning novel To Kill a Mockingbird'),
  ('Jane Austen', 'English novelist known for her six major novels, which depict the lives of the landed gentry in 19th-century England'),
  ('Mark Twain', 'American author and humorist who wrote novels, short stories, and essays'),
  ('Fyodor Dostoevsky', 'Russian novelist, essayist, journalist, and philosopher who considered himself a "soil-tiller" of literature'),
  ('William Shakespeare', 'English poet, playwright, and actor, widely regarded as the greatest writer in the English language and the world greatest dramatist'),
  ('J.R.R. Tolkien', 'English philologist, university professor, and author, best known as the author of the high fantasy works The Hobbit and The Lord of the Rings');
  
-- insert table Category
 INSERT INTO Category (CategoryName)
VALUES
  ('Fantasy'),
  ('Mystery'),
  ('Thriller'),
  ('Fiction'),
  ('Adventure'),
  ('Romance'),
  ('Classics'),
  ('Non-Fiction'),
  ('Drama'),
  ('Poetry');
  
-- insert table Books
 
 INSERT INTO Books (BookId  ,BookName, AuthorId, CategoryId, Released, PathSource, BookDescription, NumberRead)
VALUES
  (1, 'Harry Potter and the Sorcerers Stone', 1, 1, '2001-06-26', 'path/to/book/file.txt', 'The first book in the Harry Potter fantasy series by J.K. Rowling', 10000),
  (2, 'Harry Potter and the Chamber of Secrets', 1, 1, '1999-07-21', 'path/to/book/file.txt', 'The second book in the Harry Potter fantasy series by J.K. Rowling', 8000),
  (3, 'Harry Potter and the Prisoner of Azkaban', 1, 1, '1999-07-8', 'path/to/book/file.txt', 'The third book in the Harry Potter fantasy series by J.K. Rowling', 7000),
  (4, 'The Murder of Roger Ackroyd', 2, 2, '1926-06-14', 'path/to/book/file.txt', 'A classic detective novel by Agatha Christie', 5000),
  (5, 'And Then There Were None', 2, 2, '1939-08-31', 'path/to/book/file.txt', 'Another classic detective novel by Agatha Christie', 4000),
  (6, 'The Da Vinci Code', 3, 3, '2003-03-18', 'path/to/book/file.txt', 'A thriller novel by Dan Brown featuring Robert Langdon', 3000),
  (7, 'The Alchemist', 4, 4, '1988-01-01', 'path/to/book/file.txt', 'A self-help novel by Paulo Coelho', 2000),
  (8, 'To Kill a Mockingbird', 5, 5, '1960-07-11', 'path/to/book/file.txt', 'A classic novel by Harper Lee about racial injustice in the American South', 1000),
  (9, 'Pride and Prejudice', 6, 6, '1813-01-01', 'path/to/book/file.txt', 'A classic novel by Jane Austen about love and society in 19th-century England', 800),
  (10, 'The Maze Runner',6,5, '2009-01-01', 'path/to/book/file.txt', 'A classic novel', 0);
 
 INSERT INTO BookChapter (ChapterId, ChapterName, BookId, PathSource)
VALUES
  (1, 'Chapter 1: The Boy Who Lived', 1, ''),
  (2, 'Chapter 2: The Vanishing Glass', 1, ''),
  (3, 'Chapter 3: The Boy Who No One Knew', 1, ''),
  (4, 'Chapter 4: The Sorting Hat', 1, ''),
  (5, 'Chapter 5: Diagon Alley', 1, ''),
  (6, 'Chapter 1: The Murder on the Orient Express', 2, ''),
  (7, 'Chapter 2: The Clues', 2, ''),
  (8, 'Chapter 3: The Suspects', 2, ''),
  (9, 'Chapter 4: The Solution', 2, ''),
  (10, 'Chapter 5: The Aftermath', 2, ''),
  (11, 'Chapter 1: The Saint-Sulpice Enigma', 3, ''),
  (12, 'Chapter 2: The Mona Lisa', 3, ''),
  (13, 'Chapter 3: The Priory of Sion', 3, ''),
  (14, 'Chapter 4: The Grail', 3, ''),
  (15, 'Chapter 5: The Key', 3, ''),
  (16, 'Chapter 1: The Santiago Pilgrimage', 4, ''),
  (17, 'Chapter 2: The Two Omens', 4, ''),
  (18, 'Chapter 3: The Two Swords', 4, ''),
  (19, 'Chapter 4: The Treasure', 4, ''),
  (20, 'Chapter 5: The Alchemist', 4, ''),
  (21, 'Chapter 1: You Never Really Understand a Person Until You Consider Things from His Point of View...', 5, ''),
  (22, 'Chapter 2: ...Until You Climb Into His Skin and Walk Around in It', 5, ''),
  (23, 'Chapter 3: But They re Our Children! Are We Not the Ones Who Put Them in the World?', 5, ''),
  (24, 'Chapter 4: As You See, I Couldnt Kill Him. That Would Have Been the Easy Way Out.', 5, ''),
  (25, 'Chapter 5: You Never Really Understand a Person Until You Consider Things from His Point of View... ', 5, ''),
  (26, 'Chapter 1: Mr. Bennet', 6, ''),
  (27, 'Chapter 2: Mr. and Mrs. Gardiner', 6, ''),
  (28, 'Chapter 3: Jane and Elizabeth', 6, ''),
  (29, 'Chapter 4: Charlotte Lucas and Mr. Collins', 6, ''),
  (30, 'Chapter 5: Mr. Bingley and the Bennets', 6, ''),
  (31, 'Chapter 1: The Quest for the Holy Grail', 7, ''),
  (32, 'Chapter 2: The Fellowship of the Ring', 7, ''),
  (33, 'Chapter 3: The Two Towers', 7, ''),
  (34, 'Chapter 4: The Return of the King', 7, ''),
  (35, 'Chapter 5: The End of an Era', 7, ''),
  (36, 'Chapter 1: The Hunger Games', 8, ''),
  (37, 'Chapter 2: Tributes and Training', 8, ''),
  (38, 'Chapter 3: The Arena', 8, ''),
  (39, 'Chapter 4: Alliances and Betrayals', 8, ''),
  (40, 'Chapter 5: The Victor and the Vanquished', 8, ''),
  (41, 'Chapter 1: Mockingjay', 9, ''),
  (42, 'Chapter 2: Rebellion', 9, ''),
  (43, 'Chapter 3: War', 9, ''),
  (44, 'Chapter 4: Freedom', 9, ''),
  (45, 'Chapter 5: The Price of Victory', 9, ''),
  (46, 'Chapter 1: The Maze Runner', 10, ''),
  (47, 'Chapter 2: The Grievers', 10, ''),
  (48, 'Chapter 3: The Maze', 10, '');
 
 -- insert deviceID
 insert into Device (DeviceId, UserName, UserAge, UserGender, UserInterest)
 values (1, 'Quan', 24, 'Male', 'Reading Books');
 
