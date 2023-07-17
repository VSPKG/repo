FROM vineelsai/debian:latest

RUN apt update
RUN apt upgrade -y
RUN apt install -y golang git ninja-build gettext cmake unzip curl wget

RUN useradd -ms /bin/bash build
RUN mkdir -p /home/build
USER build
WORKDIR /home/build

CMD [ "make", "generate" ]
