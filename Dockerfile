FROM scratch

EXPOSE 514
EXPOSE 514/udp

COPY syslog-cloudwatch-bridge /
CMD ["/syslog-cloudwatch-bridge"]
