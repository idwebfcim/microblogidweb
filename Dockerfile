FROM python:3.6-alpine

RUN adduser -D microblog

WORKDIR /home/microblog

COPY requirements.txt requirements.txt

RUN pip install --upgrade pip
RUN pip install -r requirements.txt
RUN pip install gunicorn pymysql

COPY app app
COPY migrations migrations
COPY microblog.py config.py boot.sh ./
RUN chmod a+x boot.sh

ENV FLASK_APP microblog.py

RUN chown -R microblog:microblog ./
USER microblog

RUN flask db upgrade

EXPOSE 5000

#CMD ["echo", "Hello World"]

#ENTRYPOINT ["./boot.sh"]

ENTRYPOINT flask run --host=0.0.0.0
