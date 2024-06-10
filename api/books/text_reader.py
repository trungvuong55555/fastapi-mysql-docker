def read_all_content_in_pdf(path_file):
    with open(path_file, 'r', encoding="utf-8") as f:
        content = f.read()

    return content
