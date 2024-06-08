from fastapi import FastAPI
from fastapi.responses import JSONResponse
from fastapi.encoders import jsonable_encoder
from books.routers import router as book_router
from playlists.routers import router as playlist_router

# Set API info
app = FastAPI(
    title="Contact Machine Backend",
    description="This is code backend of contact machine",
    docs_url="/v1/docs",
    redoc_url="/v1/redoc",
    openapi_url="/v1/openapi.json",
)


@app.get("/")
async def home():
    return JSONResponse(content=jsonable_encoder("This is home. "
                                                 "Application made by Pham Quang Thinh,"
                                                 " Dinh Van Quan, Nguyen Huu Nam"))


app.include_router(book_router)
app.include_router(playlist_router)

if __name__ == "__main__":
    import uvicorn

    uvicorn.run(app, host="0.0.0.0", port=8000)
