FROM registry.access.redhat.com/ubi9/go-toolset:1.25.8-1774618347

COPY . .
RUN go mod download

RUN go build -buildvcs=false -o ./main

ENV PORT 8081
EXPOSE 8081

CMD [ "./main" ]
