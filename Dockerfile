FROM ruby:2.6.2
RUN apt-get update && apt-get install -y net-tools

ENV APP_HOME /mavi
ENV HOME /root
RUN mkdir $APP_HOME
WORKDIR $APP_HOME
COPY Gemfile $APP_HOME/
RUN bundle install

COPY . $APP_HOME/
CMD ["rackup", "delivery/web/config.ru", "--host", "0.0.0.0", "-p", "9292"]