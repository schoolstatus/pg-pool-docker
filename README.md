# pg-pool-docker
### Docker image for simple pg-pool cluster
Based on https://github.com/akrmhrjn/pgpool-docker

### Contents
``` 
├── Dockerfile                   # from PG 9.6, downloads and compiles pgpool with memcached support
├── README.md
├── pgpool.conf.sample           # sample config file
├── scripts
│   ├── docker_build.rb          # helper script for building image
│   └── docker_tag_and_push.rb   # helper script for uploading to AWS ECS
└── start_pool.sh                # image entrypoint
``` 

### Setup
Copy `pgpool.conf.sample` to `pgpool.conf`.  In here you'll configured your database server as well
as your memcached instance, cache settings, and cache whitelist/blacklist.

### How to Use
This is intended to be a quick way to spin up multiple pgpool instances geared for caching only.  You
can use them behind a network load balancer with relative ease.  The entrypoint sends logs to `stdout` as
to easily leverage the `awslogs` log driver for Docker, sending all output to CloudWatch.

### Optional Extras
The scripts in `scripts/` are helper utilities for building and uploading to AWS ECS.
