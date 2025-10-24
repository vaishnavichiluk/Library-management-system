-- 1)
SELECT distinct(book_copies_No_Of_Copies)
FROM ((books NATURAL JOIN book_copies ) NATURAL JOIN
library_branch )
WHERE book_Title='The Lost Tribe' AND library_branch_BranchName='Sharpstown';

-- 2)
SELECT distinct(book_copies_No_Of_Copies) ,library_branch_BranchName 
FROM ((books NATURAL JOIN book_copies ) NATURAL JOIN
library_branch )
WHERE  book_Title='The Lost Tribe';

-- 3)
SELECT borrower_BorrowerName 
FROM borrower
WHERE borrower_CardNo NOT IN (SELECT DISTINCT book_loans_CardNo FROM book_loans);

-- 4)
SELECT book_Title, borrower_BorrowerName,borrower_BorrowerAddress
FROM books, BORROWER, BOOK_LOANS, LIBRARY_BRANCH
WHERE library_branch_BranchName='Sharpstown' AND library_branch_BranchID=book_loans_BranchID AND
book_loans_DueDate='2018-02-03' AND book_loans_CardNo=borrower_CardNo AND book_loans_BookID=book_BookID;

-- 5)
SELECT library_branch.library_branch_BranchName, COUNT(book_loans.book_loans_LoansID) AS total_loans
FROM book_loans
JOIN library_branch ON book_loans.book_loans_BranchID = library_branch.library_branch_BranchID
GROUP BY library_branch.library_branch_BranchName;

-- 6)
SELECT borrower.borrower_BorrowerName, borrower.borrower_BorrowerAddress, COUNT(book_loans.book_loans_LoansID) AS books_checked_out
FROM borrower
JOIN book_loans ON borrower.borrower_CardNo = book_loans.book_loans_CardNo
GROUP BY borrower.borrower_CardNo
HAVING COUNT(book_loans.book_loans_LoansID) > 5;

-- 7)    
SELECT  distinct(book_copies_No_Of_Copies) ,book_Title
FROM   (((authors NATURAL JOIN books) NATURAL JOIN 
book_copies) NATURAL JOIN library_branch)WHERE 
book_authors_AuthorName='Stephen King' AND library_branch_BranchName='Central';

