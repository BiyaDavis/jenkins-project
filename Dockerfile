FROM python:3.9-slim
COPY biya.py /app/biya.py
CMD ["python", "/app/biya.py"]
