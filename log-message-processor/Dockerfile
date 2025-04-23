FROM python:3.6

WORKDIR /app

COPY . .

# Install dependencies
RUN pip3 install --no-cache-dir -r requirements.txt

# Run the application
CMD ["python3", "main.py"]
