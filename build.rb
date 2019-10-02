#!/usr/bin/env ruby

def subdirs(dir)
  Dir.entries(dir).select { |entry| File.directory? File.join(dir, entry) and !(entry == '.' || entry == '..') }
end

LIBRD_KAFKA_VERSIONS = [
    "1.1.0",
    "1.0.0"
]

subdirs("os").each do |distro| 
    LIBRD_KAFKA_VERSIONS.each do |version|
        tag = "brendanjryan/librdkafka:#{version}-#{distro}"
        system "docker build . -f #{distro}/Dockerfile --build-arg LIBRDKAFKA_VERSION=v#{version} -t #{tag}"
        system "docker push #{tag}"
    end
end
