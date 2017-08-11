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

ENTRYPOINT [ "google-chrome-stable","--headless","--disable-gpu","--remote-debugging-address=0.0.0.0",
"--remote-debugging-port=9222","&&","chromedriver"]

CMD [ "--whitelisted-ips" ]