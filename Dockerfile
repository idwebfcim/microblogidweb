FROM python:3.6-alpine

WORKDIR /home/blogmicro

COPY requirements.txt requirements.txt

RUN pip3 install --upgrade pip
RUN pip3 install -r requirements.txt

COPY app app
COPY deployment deployment
COPY migrations migrations

COPY microblog.py microblog.py
COPY config.py config.py

RUN flask db stamp head
RUN flask db migrate
RUN flask db upgrade

EXPOSE 5000

ENTRYPOINT flask run --host=0.0.0.0
