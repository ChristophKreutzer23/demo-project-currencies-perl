FROM ubuntu:18.04
RUN apt-get update && \
  apt-get upgrade -y && \
  apt-get install -y libimage-magick-perl

# install modules that are needed
RUN cpan XML::Parser::Lite
RUN cpan LWP::Simple
RUN cpan DBI
RUN cpan DBD::mysql

WORKDIR /opt
COPY . .

ENTRYPOINT ["perl", "main.pl"]