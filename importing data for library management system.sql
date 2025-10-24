create database project;
use project;

CREATE TABLE publisher (
   publisher_PublisherName varchar(50) not null,
   publisher_PublisherAddress text,
   publisher_PublisherPhone text,
   primary key(publisher_PublisherName));

CREATE TABLE books (
  book_BookID int primary key auto_increment,
  book_Title text,
  book_PublisherName varchar(50),
  foreign key(book_PublisherName) references publisher(publisher_PublisherName)
  on update cascade
  on delete cascade
);

CREATE TABLE authors (
book_authors_authorID int primary key auto_increment,
book_authors_BookID int ,
book_authors_AuthorName varchar(30),
FOREIGN KEY(book_authors_BookID) references books(book_BookID)
on update cascade
on delete cascade);
  
  CREATE TABLE book_copies (
  book_copies_CopiesID int primary key auto_increment,
  book_copies_BookID int DEFAULT NULL,
  book_copies_BranchID int DEFAULT NULL,
  book_copies_No_Of_Copies int DEFAULT NULL,
  foreign key(book_copies_BookID) references books(book_BookID),
  foreign key(book_copies_BranchID) references library_branch(library_branch_BranchID)
  on update cascade
  on delete cascade
);

CREATE TABLE book_loans (
book_loans_LoansID int primary key auto_increment, 
book_loans_BookID int DEFAULT NULL,
book_loans_BranchID int DEFAULT NULL,
book_loans_CardNo int DEFAULT NULL,
book_loans_DateOut text,
book_loans_DueDate text,
foreign key(book_loans_BookID) references books(book_BookID),
foreign key(book_loans_BranchID) references library_branch(library_branch_BranchID),
foreign key(book_loans_CardNo) references borrower(borrower_CardNo)
on update cascade
on delete cascade);

CREATE TABLE borrower (
  borrower_CardNo int primary key auto_increment,
  borrower_BorrowerName text,
  borrower_BorrowerAddress text,
  borrower_BorrowerPhone text
);

CREATE TABLE library_branch (
  library_branch_BranchID int primary key auto_increment,
  library_branch_BranchName text,
  library_branch_BranchAddress text
);
