FROM ubuntu:15.10

ENV SWIFT_VERSION DEVELOPMENT-SNAPSHOT-2016-02-25-a
ENV SWIFT_PLATFORM ubuntu15.10

# Install Dependencies
RUN apt-get update

RUN apt-get install -y clang libicu55 libpython2.7 wget build-essential libedit-dev python2.7 python2.7-dev rsync libxml2

RUN apt-get install -y git
RUN apt-get install -y vim

RUN apt-get clean

RUN rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Install Swift keys
RUN wget -q -O - https://swift.org/keys/all-keys.asc | gpg --import - && \
    gpg --keyserver hkp://pool.sks-keyservers.net --refresh-keys Swift

# Download and install Swift
RUN SWIFT_ARCHIVE_NAME=swift-$SWIFT_VERSION-$SWIFT_PLATFORM && \
    SWIFT_URL=https://swift.org/builds/development/$(echo "$SWIFT_PLATFORM" | tr -d .)/swift-$SWIFT_VERSION/$SWIFT_ARCHIVE_NAME.tar.gz && \
    wget $SWIFT_URL && \
    wget $SWIFT_URL.sig && \
    gpg --verify $SWIFT_ARCHIVE_NAME.tar.gz.sig && \
    tar -xvzf $SWIFT_ARCHIVE_NAME.tar.gz -C / --strip 1 && \
    rm -rf $SWIFT_ARCHIVE_NAME* /tmp/* /var/tmp/*

Expose 8080

RUN mkdir -p /opt/swift
ADD ./Package.swift /opt/swift/
ADD ./Sources /opt/swift/Sources

# Set Swift Path
ENV PATH /usr/bin:$PATH

ENTRYPOINT ["/usr/bin/swift"]

CMD ["-version"]
