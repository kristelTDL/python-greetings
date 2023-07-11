FROM python:3-alpine

LABEL "AUTHOR"="Kristel Juurik"

WORKDIR /app

COPY app.py app.py
COPY requirements.txt requirements.txt

RUN pip3 install --no-cache-dir -r requirements.txt

EXPOSE 3000

ENTRYPOINT [ "python3" ]
CMD [ "app.py" ]