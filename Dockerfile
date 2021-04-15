FROM golang:alpine

# set necessary environment variables for building golang code
ENV	GO111MODULE=on \
	CGO_ENABLED=0 \
	GOOS=linux \
	GOARCH=amd64

# Move container working directory
WORKDIR /build

# Copy dependencies from local to container /build
COPY go.mod .
#COPY go.sum .
# Run golang package maanger for dependencies in container
RUN go mod download

# Copy all the code from local to container /build
COPY . .

# Build the application in the container at /build
RUN go build -o main .

# Move container working directory
WORKDIR /dist

# Copy binary within container from /build/main to /dist
RUN cp /build/main .

# Expose the port 8081 which this uses
EXPOSE 8080/tcp

# Command to run when starting the container. Run the server binary.
CMD ["/dist/main"]
