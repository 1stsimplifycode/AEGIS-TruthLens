FROM python:3.12-slim
ENV PYTHONUNBUFFERED=1 PYTHONDONTWRITEBYTECODE=1
WORKDIR /app
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt
COPY multimodal_bankruptcy_early_warning_system ./multimodal_bankruptcy_early_warning_system
COPY pytest.ini .
EXPOSE 8000
CMD ["uvicorn", "multimodal_bankruptcy_early_warning_system.main:app", "--host", "0.0.0.0", "--port", "8000"]
