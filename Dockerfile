FROM python:3.7

RUN apt update && apt install -y git build-essential zlib1g-dev libssl-dev libncurses-dev libffi-dev libsqlite3-dev libreadline-dev libbz2-dev && git clone https://github.com/aws/aws-elastic-beanstalk-cli-setup.git && /aws-elastic-beanstalk-cli-setup/scripts/bundled_installer 

ENV PATH="/root/.ebcli-virtual-env/executables:${PATH}"

WORKDIR /app

ADD entry_point.sh /bin/entry_point

ENTRYPOINT ["bash", "/bin/entry_point"]
