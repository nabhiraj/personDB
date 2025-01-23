ARG RUBY_VERSION=3.3.0
FROM docker.io/library/ruby:$RUBY_VERSION-slim
ENV BUNDLER_VERSION=2.5.23
RUN apt-get update -qq && \
   apt-get install --no-install-recommends -y curl libjemalloc2 libvips sqlite3 vim && \
   rm -rf /var/lib/apt/lists /var/cache/apt/archives
RUN apt-get update -qq && \
   apt-get install --no-install-recommends -y build-essential git pkg-config && \
   rm -rf /var/lib/apt/lists /var/cache/apt/archives
#RUN gem install bundler -v 2.5.23
WORKDIR /app
COPY Gemfile Gemfile.lock ./
#RUN bundle config build.nokogiri --use-system-libraries
RUN bundle check || bundle install
COPY . ./
ENTRYPOINT ["./entrypoints/docker-entrypoint.sh"]