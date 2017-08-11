FROM justinribeiro/chrome-headless

LABEL name="selenium-chrome" \
			maintainer="Caryyu <343194291@qq.com>" \
			version="1.0" \
			description="Google Chrome Headless and Chrome Driver for selenium in a container"

USER root

WORKDIR /home/chrome

RUN apt-get update && \
    apt-get install -y unzip && \
    wget https://chromedriver.storage.googleapis.com/2.31/chromedriver_linux64.zip && \
    unzip chromedriver_linux64.zip && \
    mv chromedriver /usr/bin

USER chrome

EXPOSE 9515

ENTRYPOINT [ "chromedriver" ]

CMD [ "--whitelisted-ips" ]