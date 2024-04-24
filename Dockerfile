FROM golang:1.18.3

# Set destination for COPY
WORKDIR /app

# Download Go modules
COPY go.mod .
RUN go mod download

# Copy the source code. Note the slash at the end, as explained in
# https://docs.docker.com/engine/reference/builder/#copy
COPY *.go ./

# build
RUN go build -o /helloapp

ENV PORT 8080
ENTRYPOINT  ["/helloapp"]