FROM python:3.12
RUN useradd -M user
WORKDIR /webapp
COPY requirements.txt .
RUN python3 -m pip install -r requirements.txt
COPY templates .
COPY main.py .
USER user
EXPOSE 3020
CMD gunicorn main:app -b 0.0.0.0:3020
