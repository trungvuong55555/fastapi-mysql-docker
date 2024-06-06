from fastapi import HTTPException, status
from typing import List

from api.database.connector import DatabaseConnector
from api.books.models import BooksGetRequestModel
database = DatabaseConnector()


def get_book(book_model: BooksGetRequestModel) -> List[dict]:
    # query get specific book
    books = database.query_get(
        """
            select bc.ChapterName , bc.PathSource 
            from Books b inner join BookChapter bc ON b.BookId = bc.BookId 
            where b.BookId = %s and bc.ChapterId = %s
        """,
        (book_model.book_id, book_model.chapter_id)
    )

    # query update number read in book tables
    database.query_put(
        """
            update Books 
            set NumberRead = NumberRead + 1 
            where Books.BookId = %s
        """,
        book_model.book_id
    )

    return books
