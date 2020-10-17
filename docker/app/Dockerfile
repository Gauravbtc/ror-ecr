FROM ruby:2.6.1-alpine

# Update the package lists before installing.
RUN apk update \
&& apk upgrade \
&& apk add --update --no-cache \
build-base curl-dev git postgresql-dev \
yaml-dev zlib-dev nodejs yarn

RUN apk update \
    && apk add build-base \
       tzdata

ENV RAILS_ROOT /var/www/ror-ecs

RUN mkdir -p $RAILS_ROOT

WORKDIR $RAILS_ROOT


ENV RAILS_ENV development

# Copy the Gemfile
COPY Gemfile /var/www/ror-ecs
COPY Gemfile.lock /var/www/ror-ecs

ENV BUNDLE_PATH /gems


# Make sure we are running bundler version 2.0

RUN gem install bundler -v 2.0.1
RUN bundle install
RUN yarn install
# Copy the project over
COPY . .

RUN bin/rails assets:precompile

# Map port 8080 to the outside world (your local computer)
EXPOSE 3000

# ENTRYPOINT ["sh", "./entrypoint.sh"]
#CMD ["rails", "server", "-b", "0.0.0.0"]

EXPOSE 3000
CMD ["bundle", "exec", "puma", "-C", "config/puma.rb"]