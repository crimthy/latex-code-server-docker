FROM codercom/code-server:latest

# plugins don't work without it?? 
USER root
# avoid tzdata config
ENV TZ=Europe/Kiev
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN sudo -E apt-get update && sudo -E apt-get install -y \
    curl \
    bsdtar \
	texlive-full \
    python-pygments gnuplot \
    make git \
 && sudo rm -rf /var/lib/apt/lists/*

RUN mkdir -p /root/.local/share/code-server/extensions
#RUN curl -JL https://marketplace.visualstudio.com/_apis/public/gallery/publishers/James-Yu/vsextensions/latex-workshop/8.4.1/vspackage | bsdtar -xvf - extension
COPY extension /root/.local/share/code-server/extensions/James-Yu.latex-workshop.8.4.1
#RUN mv extension /home/coder/.local/share/code-server/extensions/James-Yu.latex-workshop.8.4.1

CMD ["code-server", "--allow-http", "--no-auth"]