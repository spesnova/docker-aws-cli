# docker-aws-cli [![Docker Repository on Quay.io](https://quay.io/repository/spesnova/aws-cli/status "Docker Repository on Quay.io")](https://quay.io/repository/spesnova/aws-cli)
[aws-cli]([aws/aws-cli](https://github.com/aws/aws-cli)) in docker container.

## SUPPORTED TAGS

* `latest`, `1.9.2`
 * python 2.7.10
 * aws-cli 1.9.2

## HOW TO USE
### Using AWS Credentials
To use `aws` command with security crendentails, prepare credentials file first.

**`~/.aws/credentials`**

```
[default]
aws_access_key_id=AKIAIOSFODNN7EXAMPLE
aws_secret_access_key=wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY
```

**`~/.aws/config`**

```
[default]
region=us-west-2
output=json
```

Then, run an ephemeral container with `aws` command.
Don't forget to add volume option for mount your host `.aws` directory into container's `/root/.aws`.

```bash
$ docker run \
    --rm \
    -v /home/<USER>/.aws:/root/.aws:ro \
    quay.io/spesnova/aws-cli:latest \
    aws ec2 describe-instances
```

### Using IAM Role
If you are on an EC2 instance that has IAM Role,
just run an ephemeral container with `aws` command.

```bash
$ docker run \
    --rm \
    quay.io/spesnova/aws-cli:latest \
    aws ec2 describe-instances --region us-east-1
```
