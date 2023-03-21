# Base image
FROM alpine:3.14

# Install dependencies
RUN apk add --no-cache cmake g++ git make && \
    apk add --no-cache --virtual .build-deps gtest-dev && \
    rm -rf /var/cache/apk/*

# Build and install Google Test
WORKDIR /usr/src/gtest
RUN cmake CMakeLists.txt && \
    make && \
    cp *.a /usr/lib && \
    cd / && \
    rm -rf /usr/src/gtest

# Copy the project source code
COPY . /app

# Build the project
WORKDIR /app/build
RUN cmake .. && \
    make

# Run the tests
CMD ["./my_test_executable"]
