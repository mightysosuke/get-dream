# ココで前述のベースイメージを指定している
FROM joyzoursky/python-chromedriver:3.7-selenium

RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add && \
echo 'deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main' | tee /etc/apt/sources.list.d/google-chrome.list && \
apt-get update && \
apt-get install -y google-chrome-stable

# ChromeDriver
ADD https://chromedriver.storage.googleapis.com/96.0.4664.45/chromedriver_linux64.zip /opt/chrome/
RUN cd /opt/chrome/ && \
unzip chromedriver_linux64.zip

# - Vi・Vim が入っていないのでインストールする
# - pip をアップデートして pipienv をインストールする
RUN set -x && \
  apt-get update && \
  apt-get install -y vim && \
  pip install --upgrade pip && \
  pip install pipenv && \
  pip install python-dateutil && \
  pip install selenium && \
  pip install chromedriver-binary==96.0.4664.35.0
