Dockerfile-rbenv [![MIT License](http://img.shields.io/badge/license-MIT-blue.svg?style=flat)](https://github.com/kopug/dockerfile-rbenv/blob/master/LICENCE)
====

Dockerfile for rbenv on CentOS 6

## Usage

```
$ docker build -t <TAG> .
$ docker run -it <TAG>
```

Dockerfile execute belows;

1. Pull CentOS 6 image
1. Install packages which are needed to build ruby
1. Clone [rbenv](https://github.com/sstephenson/rbenv)
1. Clone [ruby-build](https://github.com/sstephenson/ruby-build)
1. Install multiple versions of ruby which are defined at `versions.txt`
1. Install Bundler for each version


## Author

[kopug](https://github.com/kopug)
