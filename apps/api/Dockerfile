FROM python:3.13-slim

# Create the app directory
RUN mkdir /app

# Set the working directory inside the container
WORKDIR /app

# Set environment variables
# Prevents Python from writing pyc files to disk
ENV PYTHONDONTWRITEBYTECODE=1
# Prevents Python from buffering stdout and stderr
ENV PYTHONUNBUFFERED=1

# Install dependencies
RUN pip install fastapi uvicorn

# Copy the Django project to the container
COPY . /app/

# Define command to run django
CMD ["uvicorn", "app:app", "--host", "0.0.0.0", "--port", "8000"]
