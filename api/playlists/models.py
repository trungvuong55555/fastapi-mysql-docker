from pydantic import BaseModel


class PlayListGetRequestModel(BaseModel):
    device_id: str = 1  # default device_id in db
    book_id: str
