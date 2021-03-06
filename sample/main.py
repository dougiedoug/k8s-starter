from fastapi import FastAPI
from fastalchemy import SQLAlchemyMiddleware, db

from sample import database, models, schemas

app = FastAPI()
app.add_middleware(SQLAlchemyMiddleware,
                   db_module=database,
                   models_module=models)

from sample.models import User

@app.post('/users', response_model=schemas.User)
def create_user(user: schemas.UserCreate):
    user = User(id=user.id, email=user.email)
    db.add(user)
    return user

@app.get('/users')
def get_users():
    '''Return users.'''
    users = db.query(User).order_by(User.id).all()
    return users
