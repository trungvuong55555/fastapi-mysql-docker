from typing import List

from api.database.connector import DatabaseConnector
from api.playlists.models import PlayListGetRequestModel

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
                select b.BookId , b.BookName , b.AuthorId , b.CategoryId , b.Released , b.BookDescription , b.NumberRead 
                from PlayList pl inner join Books b on pl.BookId = b.BookId 
                where pl.DeviceId = {device_id}
            """

    books = database.query_get(query)

    return books
