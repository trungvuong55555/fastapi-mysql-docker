from fastapi import APIRouter, status
from fastapi.encoders import jsonable_encoder
from fastapi.responses import JSONResponse
from api.playlists.models import PlayListGetRequestModel
from api.playlists.controllers import get_book_from_playlist, delete_book_from_playlist, add_book_to_playlist

router = APIRouter()


@router.get("/api/v1/playlist/{device_id}")
async def get_books_in_playlist(device_id: int):
    books = get_book_from_playlist(device_id)
    return JSONResponse(status_code=status.HTTP_200_OK, content=jsonable_encoder(books))


@router.post("/api/v1/playlist")
async def add_book(book_detail: PlayListGetRequestModel):
    add_book_to_playlist(book_detail)
    return JSONResponse(status_code=status.HTTP_200_OK, content=jsonable_encoder("Add books success!"))


@router.delete("/api/v1/playlist")
async def delete_book(book_detail: PlayListGetRequestModel):
    delete_book_from_playlist(book_detail)
    return JSONResponse(status_code=status.HTTP_200_OK, content=jsonable_encoder("Delete books success!"))
