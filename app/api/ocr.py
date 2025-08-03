from fastapi import APIRouter

router = APIRouter()

@router.post("/")
async def process_receipt():
    return {"message": "Calls some OCR module to process receipt"}
