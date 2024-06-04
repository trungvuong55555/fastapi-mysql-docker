from pypdf import PdfReader


def read_pdf(path_file, page_number):
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
