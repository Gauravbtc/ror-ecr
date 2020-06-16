FROM ruby:2.6.1

# Update the package lists before installing.
RUN apt-get update -qq

# This installs
# * build-essential because Nokogiri requires gcc
# * common CA certs
# * netcat to test the database port
# * two different text editors (emacs and vim) for emergencies
# * the mysql CLI and client library
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs

# Install node from nodesource
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash - \
  && apt-get install -y nodejs

# Install yarn
RUN curl https://deb.nodesource.com/setup_12.x | bash
RUN curl https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list

RUN apt-get update && apt-get install -y nodejs yarn postgresql-client

ENV RAILS_ROOT /var/www/ror-ecs

RUN mkdir -p $RAILS_ROOT

WORKDIR $RAILS_ROOT


ENV RAILS_ENV development

# Copy the Gemfile
COPY Gemfile /var/www/ror-ecs
COPY Gemfile.lock /var/www/ror-ecs

# Make sure we are running bundler version 2.0
RUN gem install bundler -v 2.0.1
RUN bundle install

# Copy the project over
COPY . .

# Map port 8080 to the outside world (your local computer)
EXPOSE 3000

# ENTRYPOINT ["sh", "./entrypoint.sh"]
#CMD ["rails", "server", "-b", "0.0.0.0"]

EXPOSE 3000
CMD ["bundle", "exec", "puma", "-C", "config/puma.rb"]