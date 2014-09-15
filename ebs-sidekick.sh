#!/usr/bin/env bash
INSTANCE_ID=$(wget -q -O - http://169.254.169.254/latest/meta-data/instance-id)
if [ $? -ne 0 ]; then echo "Failed to lookup instance id."; exit 1; fi

function waitForState() {
    while [ -z "$(aws ec2 describe-volumes \
        --volume-ids $VOLUME_ID \
        | grep $1)" \
    ]; do
        echo State is still not $1...
        sleep 2
    done
}

echo Attaching volume $VOLUME_ID to $INSTANCE_ID at $DEVICE...

aws ec2 attach-volume \
    --volume-id $VOLUME_ID \
    --instance-id $INSTANCE_ID \
    --device $DEVICE \
    || exit $?

echo Waiting for attach...


waitForState attached

echo Attached volume.

function cleanup() {
    echo Detaching volume...
    aws ec2 detach-volume \
        --volume-id $VOLUME_ID \
        --instance-id $INSTANCE_ID \
        --device $DEVICE
    waitForState available
    echo Detached volume.
    exit
}

trap cleanup INT TERM

while [ 1 ]; do sleep 1; done

