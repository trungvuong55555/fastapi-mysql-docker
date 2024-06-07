from fastapi import APIRouter, Depends, status
from fastapi.encoders import jsonable_encoder
from fastapi.responses import JSONResponse
from api.books.controllers import get_book
from api.books.models import BooksGetRequestModel

router = APIRouter()


@router.get("/api/v1/book")
def get_books(book_detail: BooksGetRequestModel):
    books = get_book(book_detail)
    return JSONResponse(status_code=status.HTTP_200_OK, content=jsonable_encoder(books))

