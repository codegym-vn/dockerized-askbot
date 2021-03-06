FROM python:2

RUN pip install mysql-python

RUN git clone https://github.com/ASKBOT/askbot-devel.git app

WORKDIR /app/

RUN pip install -r askbot_requirements.txt && python setup.py install

COPY askbot-setup-db-and-run.bash ./docker-entrypoint.sh 

RUN chmod +x docker-entrypoint.sh

RUN apt-get update && apt-get install -y netcat && rm -rf /var/lib/apt/lists/*

CMD ["./docker-entrypoint.sh"]
