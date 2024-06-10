from api.books.text_reader import read_all_content_in_pdf

content = read_all_content_in_pdf("/home/quan/Documents/sample.txt")

print(content)
