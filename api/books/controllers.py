from typing import List

from api.database.connector import DatabaseConnector
from api.books.models import BooksGetRequestModel, AllBooksGetRequestModel
from api.books.pdf_reader import *

database = DatabaseConnector()


def update_number_read(book_id: str):
    # query update number read in book tables
    query = f"""
                update Books 
                set NumberRead = NumberRead + 1 
                where Books.BookId = {book_id}
            """
    database.action(query)


def add_history_read_book(book_id: str, device_id: str):
    query = f"""
                insert into History (BookId, DeviceId) values ({book_id}, {device_id})
            """
    database.action(query)


def get_book_chapter(book_model: BooksGetRequestModel) -> List[dict]:
    result_list = []

    # query get specific book
    books = database.query_get(
        f"""
            select bc.ChapterName ,  b.PathSource, bc.PathSource 
            from Books b inner join BookChapter bc ON b.BookId = bc.BookId 
            where b.BookId = {book_model.book_id} and bc.ChapterId = {book_model.chapter_id}
        """
    )

    for book in books:
        chapter_name = book[0]
        path_source_book = book[1]
        path_source_chapter = book[2]
        path_source = path_source_book + "/" + path_source_chapter
        content = read_all_content_in_pdf(path_source)
        book_dict = dict({
            "ChapterName": chapter_name,
            "Text": content
        })
        result_list.append(book_dict)

    update_number_read(book_model.book_id)
    add_history_read_book(book_model.book_id, book_model.device_id)

    return result_list


def get_book_name(book_id: str) -> List[dict]:
    query = f"""
        select bc.ChapterName 
        from Books b inner join BookChapter bc on b.BookId = bc.BookId 
        where b.BookId = {book_id}
    """
    book_name = database.query_get(query)

    return book_name


def get_info_category_book_book(book_model: AllBooksGetRequestModel) -> List[dict]:
    query = """ select a.AuthorId, a.AuthorName, a.AuthorDescr, c.CategoryId, c.CategoryName, b.BookId, b.BookName, 
    b.Released, b.BookDescription, b.NumberRead from Books b inner join Author a on b.AuthorId = a.AuthorId inner 
    join Category c on b.CategoryId = c.CategoryId """

    # logic for input book_name, author_name, category_name if they are exist
    if book_model.book_name != "" or book_model.author_name != "" or book_model.category_name != "":
        query += " where "
    else:
        query += f" limit {book_model.offset_limit}"
        return database.query_get(query)

    if book_model.book_name != "":
        query += f" b.BookName = '{book_model.book_name}' "
        if book_model.author_name != "":
            query += f" and a.AuthorName = '{book_model.author_name}' "
            if book_model.category_name != "":
                query += f" and c.CategoryName = '{book_model.category_name}' "
        else:
            if book_model.category_name != "":
                query += f" and c.CategoryName = '{book_model.category_name}' "
    else:
        if book_model.author_name != "":
            query += f" a.AuthorName = '{book_model.author_name}' "
            if book_model.category_name != "":
                query += f" and c.CategoryName = '{book_model.category_name}' "
        else:
            if book_model.category_name != "":
                query += f" c.CategoryName = '{book_model.category_name}' "

    query += f" limit {book_model.offset_limit}"

    return database.query_get(query)


def get_all_books(book_model: AllBooksGetRequestModel):
    books_info = get_info_category_book_book(book_model)
    list_result = []

    for book_info in books_info:
        author_id = book_info[0]
        author_name = book_info[1]
        author_descr = book_info[2]
        category_id = book_info[3]
        category_name = book_info[4]
        book_id = book_info[5]
        book_name = book_info[6]
        book_released = book_info[7]
        book_description = book_info[8]
        book_number_read = book_info[9]

        list_book = []
        books = get_book_name(book_id)
        for book in books:
            list_book.append(book[0])

        author_dict = dict({
            "AuthorId": author_id,
            "AuthorName": author_name,
            "AuthorDescr": author_descr
        })

        category_dict = dict({
            "CategoryID": category_id,
            "CategoryName": category_name
        })

        book_dict = dict({
            "BookId": book_id,
            "BookName": book_name,
            "BookReleased": book_released,
            "BookDescription": book_description,
            "NumberRead": book_number_read,
            "BookChapterName": list_book
        })

        book_info_dict = dict({
            "author": author_dict,
            "category": category_dict,
            "book": book_dict
        })

        list_result.append(book_info_dict)

    response = list_result

    return response
