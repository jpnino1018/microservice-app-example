FROM python:3.6

WORKDIR /app

COPY . .

# Install dependencies
RUN pip3 install --no-cache-dir -r requirements.txt

ENV REDIS_HOST=127.0.0.1
ENV REDIS_PORT=6379
ENV REDIS_CHANNEL=log_channel

# Run the application
CMD ["python3", "main.py"]
