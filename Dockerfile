FROM continuumio/miniconda3

# Install base utilities
RUN apt-get update --allow-unauthenticated\
    && apt-get install -y build-essential \
    && apt-get install -y wget \
    && apt-get install -y git \
    && apt-get clean
    
ENV PIP_ROOT_USER_ACTION=ignore

WORKDIR /app

ADD . /app/lm-evaluation-harness
RUN pip install -e /app/lm-evaluation-harness

SHELL ["/bin/bash", "-c"]

RUN echo "alias ls='ls --color=auto'" >> ~/.bashrc
RUN apt install -y tmux

CMD ["bash"]