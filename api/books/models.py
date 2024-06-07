from pydantic import BaseModel


class BooksGetRequestModel(BaseModel):
    device_id: str = -1
    book_id: str
    chapter_id: str
