from fastapi import FastAPI
from starlette.responses import RedirectResponse

app = FastAPI()


@app.get("/", include_in_schema=False)
async def docs_redirect():
    return RedirectResponse(url='/docs')


@app.get("/healthz")
def healthz():
    return {'app': 'fastapi', 'status': 'success'}
