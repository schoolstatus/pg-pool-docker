#!/usr/bin/env ruby

AWS_BASE = '123.aws.amazon.com'
IMAGE    = 'pg-pool-docker'

def tag_for_ecs(environment)
  system "docker tag #{IMAGE}:#{environment} #{AWS_BASE}/#{IMAGE}:#{environment}"
end

def push_to_ecs(environment)
  system "`aws ecr get-login --no-include-email` && docker push #{AWS_BASE}/#{IMAGE}:#{environment}"
end

def run(environment)
  tag_for_ecs environment
  push_to_ecs environment
end

run (ARGV[0] || 'latest')
