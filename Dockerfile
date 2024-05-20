FROM ubuntu:22.04

RUN apt update 
RUN apt-get install -y git wget nano vim python3 python3-setuptools gobuster python3-pip
RUN apt clean

# exploitdb searchsploit
RUN git clone https://gitlab.com/exploit-database/exploitdb.git /opt/exploit-database &&\
    ln -sf /opt/exploit-database/searchsploit /usr/local/bin/searchsploit

# kyubi install
RUN git clone https://github.com/shibli2700/Kyubi.git &&\
     cd Kyubi && python3 setup.py install && cd ..

# nginxpwner python dependencies install
COPY requirements.txt .

RUN pip3 install -r requirements.txt

COPY nginx.txt .

COPY nginxpwner.py nginx-pwner-no-server-header.py ./

