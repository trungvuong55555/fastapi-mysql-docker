from typing import List

from database.connector import DatabaseConnector
from playlists.models import PlayListGetRequestModel

database = DatabaseConnector()


def add_book_to_playlist(play_list_model: PlayListGetRequestModel):
    query = (f"insert into PlayList (PlayListName, DeviceId, BookId) "
             f"values ('My playlist', {play_list_model.device_id}, {play_list_model.book_id})")
    database.action(query)


def delete_book_from_playlist(play_list_model: PlayListGetRequestModel):
    query = f"DELETE from PlayList where DeviceId = {play_list_model.device_id} and BookId = {play_list_model.book_id}"
    database.action(query)


def get_book_from_playlist(device_id: int) -> List[dict]:
    # query get books in playlist
    query = f"""
                select b.BookId , b.BookName , b.AuthorId , b.CategoryId , b.Released , b.BookDescription , b.NumberRead, b.CoverImage 
                from PlayList pl inner join Books b on pl.BookId = b.BookId 
                where pl.DeviceId = {device_id}
            """

    books = database.query_get(query)

    result_list = []

    for book in books:
        book_id = book[0]
        book_name = book[1]
        author_id = book[2]
        category_id = book[3]
        released = book[4]
        book_desc = book[5]
        number_read = book[6]
        cover_image = book[7]
        book_dict = dict({
            "BookId": book_id,
            "BookName": book_name,
            "AuthorId": author_id,
            "CategoryId": category_id,
            "Released": released,
            "BookDescription": book_desc,
            "NumberRead": number_read,
            "CoverImage": cover_image
        })

        result_list.append(book_dict)

    return result_list
