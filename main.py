
from fastapi import FastAPI
from pydantic import BaseModel
import mysql.connector

app = FastAPI()


# Database Connection Function
def get_db_connection():
    return mysql.connector.connect(
        host="localhost",
        port=3307,
        user="root",
        password="rakib2k5",
        database="library_management"
    )


# Reusable SQL Execution Function
def run(sql, args=(), fetch=False, single=False):

    db = get_db_connection()
    cur = db.cursor(dictionary=True)

    try:
        cur.execute(sql, args)

        if single:
            result = cur.fetchone()

        elif fetch:
            result = cur.fetchall()

        else:
            result = None

        db.commit()

        return result

    finally:
        cur.close()
        db.close()


@app.get("/")
def home():
    return {"message": "FastAPI is running"}


class Book(BaseModel):
    title: str
    author: str
    isbn: str
    category: str
    quantity: int = 1
    published_year: int | None = None

@app.get("/all_book")
def view_Allbooks():
   sql = "SELECT * FROM books"
   books = run (sql, fetch = True )
   return{
       "message": "Books retrieved successfully",
        "data": books
   }

@app.get("/one_book")
def view_Onebook(book_id : int):
    sql = "SELECT * FROM books WHERE book_id = %s"
    one_books = run(sql,(book_id,), fetch = True, single = True)

    return{
          "message": "One Books retrieved successfully",
                "data": one_books
    }

@app.post("/add_book")
def insert_book(book:Book):
    sql = "INSERT INTO books (title,author,isbn,category,quantity,published_year) VALUES(%s, %s, %s, %s, %s, %s)"

    args =(
        book.title,
        book.author,
        book.isbn,
        book.category,
        book.quantity,
        book.published_year
    )

    run (sql,args)
    return{
        "message": "Book inserted successfully"
    }

@app.delete("/book/{book_id}")
def delete_book(book_id: int):
    sql = "DELETE  FROM books WHERE book_id = %s"
    run (sql,(book_id,))
    return{
        "message": "Book deleted successfully"
    }

@app.put("/update_book")
def update_book_info(book_id : int, book:Book,):
    sql = " UPDATE books set title=%s,author=%s,isbn=%s,category=%s,quantity = %s,published_year=%s WHERE book_id = %s"

    args = (
        book.title,
        book.author,
        book.isbn,
        book.category,
        book.quantity,
        book.published_year,
        book_id
    )
    run(sql,args)

    return {"message": "Book updated successfully"}


from pydantic import BaseModel


class Readers(BaseModel):
    reader_name: str
    reader_email: str
    reader_phone: str
    reader_address: str | None = None


# 1. Get all readers
@app.get("/reader")
def get_all_reader():
    sql = "SELECT * FROM readers"

    readers = run(sql, fetch=True)

    return {
        "message": "Readers retrieved successfully",
        "data": readers
    }


# 2. Get one reader
@app.get("/one_reader")
def one_reader(reader_id: int):
    sql = "SELECT * FROM readers WHERE reader_id = %s"

    one_reader = run(sql, (reader_id,), fetch=True, single=True)

    return {
        "message": "Reader retrieved successfully",
        "data": one_reader
    }


# 3. Insert a new reader
@app.post("/new_reader")
def insert_reader(reader: Readers):
    sql = "INSERT INTO readers (reader_name, reader_email, reader_phone, reader_address) VALUES (%s, %s, %s, %s)"

    args = (
        reader.reader_name,
        reader.reader_email,
        reader.reader_phone,
        reader.reader_address
    )

    in_reader = run(sql, args)

    return {
        "message": "Reader inserted successfully",
        "data": in_reader
    }


# 4. Delete a reader
@app.delete("/delete_reader/{reader_id}")
def delete_reader(reader_id: int):
    sql = "DELETE FROM readers WHERE reader_id = %s"

    del_reader = run(sql, (reader_id,))

    return {
        "message": "Reader deleted successfully",
        "data": del_reader
    }


# 5. Update a reader
@app.put("/readers/{reader_id}")
def update_reader(reader_id: int, reader: Readers):

    sql = "UPDATE readers SET reader_name = %s, reader_email = %s, reader_phone = %s, reader_address = %s WHERE reader_id = %s"

    args = (
        reader.reader_name,
        reader.reader_email,
        reader.reader_phone,
        reader.reader_address,
        reader_id
    )

    updated_reader = run(sql, args)

    return {
        "message": "Reader updated successfully",
        "data": updated_reader
    }



    



    


