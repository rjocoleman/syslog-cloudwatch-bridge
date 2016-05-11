# Syslog CloudWatch Logs bridge

This is a Syslog server that sends all logs received over to [AWS's CloudWatch Logs](https://aws.amazon.com/cloudwatch/details/#log-monitoring).

**Features:**

* Uses AWS's SDK to get credentials from the environment, credentials file or IAM Role.
* TCP and UDP Syslog server on a configurable port (default `514`).
* Automatic support for syslog messages in RFC3164, RFC6587 or RFC5424 formats.
* Configurable CloudWatch Log Group.
* Creates a new CloudWatch Log Stream on each invocation which is persisted runtime of the server.
* Dockerized in a minimal container (~8MB).


## Usage Example

1. Create an IAM user that can create Log Streams and Logs e.g.

  ```json
  {
    "Version": "2012-10-17",
    "Statement": [
      {
        "Effect": "Allow",
        "Action": [
          "logs:CreateLogStream",
          "logs:PutLogEvents"
      ],
        "Resource": [
          "arn:aws:logs:*:*:*"
      ]
    }
   ]
  }
  ```

2. Run the bridge

  ```
  $ docker run -e \
     AWS_REGION=ap-southeast-2 \
     AWS_ACCESS_KEY_ID=foo \
     AWS_SECRET_ACCESS_KEY=bar \
     LOG_GROUP_NAME=test-logger \
     -p 5014:514 \
     -p 5014:514/udp \
     rjocoleman/syslog-cloudwatch-bridge
  ```

3. Send syslog messages to `127.0.0.1:5014`, these will be viewable in your AWS CloudWatch Logs Management console under the group called `test-logger`.
