from fastapi.staticfiles import StaticFiles
import uvicorn
from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware

from routers.auth.auth import router as auth
from routers.user.user import router as user
from routers.rooms.rooms import router as rooms
from routers.reviews.reviews import router as reviews

app = FastAPI(title="Dream hotel", docs_url="/docs")
# app.mount("/static", StaticFiles(directory="static"), name="static")


origins = ["*"]
app.add_middleware(
    CORSMiddleware,
    allow_origins=origins,
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)


app.include_router(auth, prefix="/api/v1")
app.include_router(user, prefix="/api/v1")
app.include_router(rooms, prefix="/api/v1")
app.include_router(reviews, prefix="/api/v1")

if __name__ == "__main__":
    uvicorn.run("main:app", host="localhost", port=5000, log_level="info", reload=True)


# port=8897
