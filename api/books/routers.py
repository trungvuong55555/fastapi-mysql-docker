from fastapi import APIRouter, status
from fastapi.encoders import jsonable_encoder
from fastapi.responses import JSONResponse
from api.books.controllers import get_book_chapter, get_all_books
from api.books.models import BooksGetRequestModel, AllBooksGetRequestModel

router = APIRouter()


@router.get("/api/v1/book")
async def get_books(book_detail: BooksGetRequestModel):
    books = get_book_chapter(book_detail)
    return JSONResponse(status_code=status.HTTP_200_OK, content=jsonable_encoder(books))


@router.get("/api/v1/book_info")
async def get_books_info(book_detail: AllBooksGetRequestModel):
    books_info = get_all_books(book_detail)
    return JSONResponse(status_code=status.HTTP_200_OK, content=jsonable_encoder(books_info))
