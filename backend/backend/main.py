from typing import List
from fastapi import Depends, FastAPI, HTTPException
from sqlalchemy.orm import Session
from . import crud, models, schemas
from .database import SessionLocal, engine

models.Base.metadata.create_all(bind=engine)

app = FastAPI()

def get_db():
    db = SessionLocal()
    try:
        yield db
    finally:
        db.close()

# Cria usuário
@app.post("/users/", response_model=schemas.User)
def create_user(user: schemas.UserCreate, db: Session = Depends(get_db)):
    db_user = crud.get_user_by_email(db, email=user.email)
    if db_user:
        raise HTTPException(status_code=400, detail="E-mail já cadastrado")

    user = crud.create_user(db=db, user=user)

    return user

# Busca os usuários
@app.get("/users/", response_model=List[schemas.User])
def read_users(skip: int = 0, limit: int = 100, db: Session = Depends(get_db)):
    users = crud.get_users(db, skip=skip, limit=limit)
    return users

# Busca um determinado usuário
@app.get("/users/{id}", response_model=schemas.User)
def read_user(id: int, db: Session = Depends(get_db)):
    user = crud.get_user(db, id)
    if user:
        return user
    
    raise HTTPException(status_code=400, detail="Usuário não encontrado")

# Alteração de usuário
@app.patch("/users/{id}", response_model=schemas.User)
async def edit_user(id: int, new_value: schemas.UserEdit, db: Session = Depends(get_db)):
    db_user = crud.get_user(db, id)
    if db_user:
        return crud.edit_user(db, id, new_value=new_value)
    
    raise HTTPException(status_code=400, detail="Usuário não encontrado")

# Insere as medidas
@app.post("/users/{id}/measures/", response_model=schemas.Measure)
def create_measure(id: int, measure: schemas.MeasureCreate, db: Session = Depends(get_db)):
    db_user = crud.get_user(db, id)
    if db_user:
        return crud.create_user_measure(db, measure, id)

    raise HTTPException(status_code=400, detail="Usuário não encontrado")

# Busca todas as medidas
@app.get("/measures/", response_model=List[schemas.Measure])
def read_measures(skip: int = 0, limit: int = 100, db: Session = Depends(get_db)):
    measures = crud.get_measures(db, skip=skip, limit=limit)
    return measures