from fastapi import FastAPI
from app.api import user, ocr

app = FastAPI()

# Routers
app.include_router(user.router, prefix="/user")
app.include_router(ocr.router, prefix="/ocr")

@app.get("/")
async def root():
    return {
        "Owners of this": ["Hao Jun", "Edwin"]
    }
