FROM scratch

COPY syslog-cloudwatch-bridge /
CMD ["/syslog-cloudwatch-bridge"]
