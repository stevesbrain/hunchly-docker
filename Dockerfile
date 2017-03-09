FROM ubuntu
FROM ubuntu
RUN \
  apt-get update && \
  DEBIAN_FRONTEND=noninteractive apt-get install -y lxde-core lxterminal tightvncserver && \
  rm -rf /var/lib/apt/lists/*

ARG WGETFLAGS="-q -O -"

# Install Google Chrome
RUN \
  apt-get update && apt-get  install -y wget && \
  wget $WGETFLAGS https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - && \
  echo "deb http://dl.google.com/linux/chrome/deb/ stable main" > /etc/apt/sources.list.d/google.list && \
  apt-get update && \
  apt-get install -y google-chrome-stable && \
  rm -rf /var/lib/apt/lists/*

RUN useradd steve -p temp  -m
WORKDIR /data

USER steve
# Define default command.
CMD ["bash"]

# Expose ports.
EXPOSE 5901
