# caryyu/selenium-chrome
此镜像包含Google Chrome浏览器(支持Headless)，并使用ChromeDriver监听了9515端口，默认下面允许所有的远程访问；感谢[justinribeiro/chrome-headless](https://hub.docker.com/r/justinribeiro/chrome-headless/~/dockerfile/)贡献！

## 运行容器
需要注意的 --cap-add=SYS_ADMIN 参数一定要进行设置，否则无法正常使用。
```
docker run -d --name selenium-chrome -p 9515:9515 --cap-add=SYS_ADMIN caryyu/selenium-chrome:latest
```
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
