from api.books.controllers import get_book_name

book_names = get_book_name("2")

for name in book_names:
    print(name[0])
