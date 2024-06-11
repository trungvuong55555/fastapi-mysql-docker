-- create author table
CREATE TABLE Author (
  AuthorId INT PRIMARY KEY AUTO_INCREMENT,
  AuthorName VARCHAR(255) NOT NULL,
  AuthorDescr TEXT
);
-- create Category
CREATE TABLE Category (
  CategoryId INT PRIMARY KEY AUTO_INCREMENT,
  CategoryName VARCHAR(255) NOT NULL
);
-- create Devive table
CREATE TABLE Device (
  DeviceId INT PRIMARY KEY AUTO_INCREMENT,
  UserName VARCHAR(255) NOT NULL,
  UserAge INT,
  UserGender VARCHAR(255),
  UserInterest VARCHAR(255)
);
-- create Books
CREATE TABLE Books (
  BookId INT PRIMARY KEY AUTO_INCREMENT,
  BookName VARCHAR(255) NOT NULL,
  AuthorId INT NOT NULL,
  CategoryId INT NOT NULL,
  Released DATE,
  PathSource VARCHAR(255),
  BookDescription TEXT,
  CoverImage TEXT,
  NumberRead DECIMAL(10,2) DEFAULT 0,
  FOREIGN KEY (AuthorId) REFERENCES Author(AuthorId),
  FOREIGN KEY (CategoryId) REFERENCES Category(CategoryId)
);
-- create BookChapter
CREATE TABLE BookChapter (
  ChapterId INT AUTO_INCREMENT,
  ChapterName VARCHAR(255) NOT NULL,
  BookId INT NOT NULL,
  PathSource varchar(255),
  PRIMARY KEY(ChapterId, BookId),
  FOREIGN KEY (BookId) REFERENCES Books(BookId)
);
-- create PlayList table
CREATE TABLE PlayList (
  PlayListId INT PRIMARY KEY AUTO_INCREMENT,
  PlayListName VARCHAR(255) NOT NULL,
  DeviceId INT NOT NULL,
  BookId INT NOT NULL,
  CreatedAt DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (DeviceId) REFERENCES Device(DeviceId),
  FOREIGN KEY (BookId) REFERENCES Books(BookId)
);
-- create History
CREATE TABLE History (
  Id INT PRIMARY KEY AUTO_INCREMENT,
  BookId INT NOT NULL,
  DeviceId INT NOT NULL,
  CreateAt DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  AdditionInfo VARCHAR(255),
  FOREIGN KEY (BookId) REFERENCES Books(BookId),
  FOREIGN KEY (DeviceId) REFERENCES Device(DeviceId)
);