# caryyu/selenium-chrome
此镜像包含Google Chrome浏览器(支持Headless)，并使用ChromeDriver监听了9515端口，默认下面允许所有的远程访问。
## 注意
由于此容器的Base镜像是基于[justinribeiro/chrome-headless](https://hub.docker.com/r/justinribeiro/chrome-headless/)，9222端口在此镜像主要作为Chrome Debugging使用.
## 运行容器
docker run -d --name selenium-chrome -p 9222:9222 -p 9515:9515 caryyu/selenium-chrome:latest
## Selenium Java 获取 WebDriver 方式
获取WebDriver的核心代码参考以下，--headless与--disable-gpu参数必须设置，容器不支持GUI界面。
```
URL url = null;
try {
    url = new URL("http://172.16.1.12:9516");
} catch (MalformedURLException e) {
    e.printStackTrace();
}

ChromeOptions chromeOptions = new ChromeOptions();
chromeOptions.addArguments("--headless","--disable-gpu","--window-size=1290,1080");
DesiredCapabilities capabilities = DesiredCapabilities.chrome();
capabilities.setCapability("chromeOptions", chromeOptions);
WebDriver wdriver = new RemoteWebDriver(url,capabilities);
```
