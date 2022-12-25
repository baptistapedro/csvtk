FROM golang:1.19.1-buster as go-target
ADD . /csvtk
WORKDIR /csvtk/csvtk
RUN go build

FROM golang:1.19.1-buster
COPY --from=go-target /csvtk/csvtk/csvtk /
COPY --from=go-target /csvtk/testdata/*.csv /testsuite/

ENTRYPOINT []
CMD ["/csvtk", "pretty", "@@"]
