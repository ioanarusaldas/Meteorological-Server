FROM python:3.6
COPY requirements.txt /tmp
RUN pip install -r /tmp/requirements.txt
COPY /src /app
WORKDIR /app
ADD wait-for-it.sh .
RUN chmod +x ./wait-for-it.sh
EXPOSE 6000
CMD ["./wait-for-it.sh", "mysqldb:3306", "--timeout=0","--", "python", "main.py"]
