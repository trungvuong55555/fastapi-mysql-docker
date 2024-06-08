from pypdf import PdfReader


def read_specific_page_in_pdf(path_file, page_number):
    try:
        reader = PdfReader(path_file)
    except FileNotFoundError:
        print("file not found!")
        return ""

    try:
        page = reader.pages[page_number]
        text = page.extract_text()
        return text
    except IndexError:
        print("index error")
        return ""


def read_all_content_in_pdf(path_file):
    text = ""
    try:
        reader = PdfReader(path_file)
    except FileNotFoundError:
        print("file not found!")
        return text

    try:
        number_page = reader.get_num_pages()
        for i in range(number_page):
            page = reader.pages[i]
            text += page.extract_text()
        return text
    except IndexError:
        print("index error")
        return text
