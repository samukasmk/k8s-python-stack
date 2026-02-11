from fastapi import FastAPI

app = FastAPI()


@app.get("/")
def root():
    return {'app': 'api', 'status': 'success'}
