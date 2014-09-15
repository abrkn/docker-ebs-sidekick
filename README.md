ebs-sidekick
===

Attaches the specified EBS volume to the calling EC2 instance. Detaches when the container exits.

Usage
---

```
// Press CTRL-C to detach
docker run -ti \
    --env AWS_ACCESS_KEY_ID=... \
    --env AWS_SECRET_ACCESS_KEY=... \
    --env VOLUME_ID=... \
    --env DEVICE=/dev/sdf \
    --env AWS_DEFAULT_REGION=... \
    abrkn/ebs-sidekick
```

Author
---

Andreas Brekken <a@abrkn.com>

Tips
---

1AndreasWc7XAMzCXfuk7EWiVp5gnEuXSd

License
---

ISC

