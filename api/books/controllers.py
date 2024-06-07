from typing import List

from api.database.connector import DatabaseConnector
from api.books.models import BooksGetRequestModel
database = DatabaseConnector()


def get_book(book_model: BooksGetRequestModel) -> List[dict]:
    # query get specific book
    books = database.query_get(
        f"""
            select bc.ChapterName , bc.PathSource 
            from Books b inner join BookChapter bc ON b.BookId = bc.BookId 
            where b.BookId = {book_model.book_id} and bc.ChapterId = {book_model.chapter_id}
        """
    )

    # query update number read in book tables
    database.action(
        f"""
            update Books 
            set NumberRead = NumberRead + 1 
            where Books.BookId = {book_model.book_id}
        """
    )

    database.action(
        f"""
            insert into History (BookId, DeviceId) values ({book_model.book_id}, {book_model.device_id})
        """
    )

    return books
