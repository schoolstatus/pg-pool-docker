#!/usr/bin/env ruby

IMAGE='pg-pool-docker'

def build_image(environment)
  puts "--> Building image for: #{environment}"
  system "docker build -t #{IMAGE}:#{environment} ."
end

def run(environment)
  build_image environment
end

run (ARGV[0] || 'latest')
