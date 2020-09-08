FROM node:12

MAINTAINER Yukatayu
LABEL maintainer="Yukatayu <yukatayu@yukatayu.tech>"
ENV LANG ja_JP.UTF-8

# Init
RUN npm init --yes && \
	apt update

# HonKit (GitBook)
RUN npm install -g honkit
COPY fonts.conf /root/.config/fontconfig/
COPY ipag.ttc /root/.local/share/fonts/

# Java
RUN apt install -y openjdk-8-jre

# PlantUML
RUN apt install -y graphviz && \
	npm install -g @ansanloms/honkit-plugin-uml
	#npm install -g gitbook-plugin-uml

# Rest
RUN apt install -y git curl calibre && \
	npm install -g gitbook-plugin-anchors && \
	npm install -g gitbook-plugin-navigator && \
	npm install -g gitbook-plugin-collapsible-chapters && \
	npm install -g gitbook-plugin-hints && \
	npm install -g mathjax@2.7.6 && \
	npm install -g gitbook-plugin-mathjax@1.1.2 && \
	npm install -g gitbook-plugin-hide-published-with && \
	npm install -g mathjax-node@1.3.0 && \
	npm install -g gitbook-plugin-search-pro-fixed
	# plugin-mathjax@2.0.0 has been corrupted
	# plugin-mathjax depends on mathjax@2.7.6
RUN sed -ie 's/processExpression/toSpeech/g' /usr/local/lib/node_modules/gitbook-plugin-mathjax/node_modules/mathjax-node/lib/mj-single.js
RUN apt clean

WORKDIR /documents
VOLUME /documents

ENTRYPOINT ["honkit"]

