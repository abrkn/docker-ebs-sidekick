FROM dockerfile/python
RUN pip install awscli
ADD ebs-sidekick.sh /bin/ebs-sidekick.sh
CMD ebs-sidekick.sh

