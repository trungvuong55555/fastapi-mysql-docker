from pydantic import BaseModel, EmailStr, validator
from typing import Optional


class BooksGetRequestModel(BaseModel):
    device_id: str
    book_id: str
    chapter_id: str


class BookResponseModel(BaseModel):
    pass
