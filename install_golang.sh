#!/bin/bash
## Install Golang 1.14.2 64Bits on Linux (Debian|Ubuntu|OpenSUSE|CentOS)
## http://www.linuxpro.com.br/2015/06/golang-aula-1-instalacao-da-linguagem-no-linux.html
## Run as root (sudo su)
## Thank's @geosoft1 | @gwmoura


GO_URL="https://storage.googleapis.com/golang"
GO_VERSION=${1:-"1.14.2"}
GO_FILE="go$GO_VERSION.linux-amd64.tar.gz"


# Check if user has root privileges
if [[ $EUID -ne 0 ]]; then
echo "You must run the script as root or using sudo"
   exit 1
fi


GET_OS=$(cat /etc/os-release | head -n1 | cut -d'=' -f2 | awk '{ print tolower($1) }'| tr -d '"')

if [[ $GET_OS == 'debian' || $GET_OS == 'ubuntu' ]]; then
   apt-get update && apt-get install -y wget git-core
fi

if [[ $GET_OS == 'opensuse' ]]; then
   zypper in -y wget git-core
fi

if [[ $GET_OS == 'centos' || $GET_OS == 'amazon' ]]; then
   yum -y install wget git-core
fi


cd /tmp
wget --no-check-certificate ${GO_URL}/${GO_FILE}
tar -zxf ${GO_FILE} -C /usr/local
rm -f ${GO_FILE}


echo 'export PATH=$PATH:/usr/local/go/bin
export GOPATH=$HOME/GO
export PATH=$PATH:$GOPATH/bin' >> /etc/profile

### You do not need to run commands with root or sudo
source /etc/profile
## mkdir -p $HOME/GO

## Test if Golang is working
go version

### The output is this:
## go version go1.7 linux/amd64
