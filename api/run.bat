@echo off

call venv\Scripts\activate

uvicorn main:app --reload --host 0.0.0.0 --port 3456