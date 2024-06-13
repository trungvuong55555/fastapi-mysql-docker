# Dockerfile for development
FROM python:3.8
MAINTAINER QuanDV <trungvuong55555@gmail.com>


RUN mkdir /api
COPY books/ /api/books/
COPY database/ /api/database
COPY playlists/ /api/playlists
COPY requirements.txt /api/requirements.txt
COPY main.py /api/main.py
RUN cd /api
WORKDIR /api

RUN pip install --no-cache-dir -r  requirements.txt

EXPOSE 8000
CMD ["uvicorn", "main:app", "--reload", "--host", "0.0.0.0", "--port", "8000"]

# uvicorn main:app --reload --host 0.0.0.0 --port 3456
