from pydantic import BaseModel


class BooksGetRequestModel(BaseModel):
    device_id: str = 1
    book_id: str
    chapter_id: str


class AllBooksGetRequestModel(BaseModel):
    device_id: str = 1
    author_name: str = ""
    category_name: str = ""
    book_name: str = ""
    offset_limit: int = 10
