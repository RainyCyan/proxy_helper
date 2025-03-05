#!/bin/bash
### author: RainyCyan
### date:2025-03-05
### Description:This script is used to set and unset the proxy settings for linux.

# Function to set the proxy server address
set_proxy() {
    export http_proxy=http://localhost:$1
    export https_proxy=http://localhost:$1
    check_proxy
}

# Function to check proxy settings
check_proxy() {
    if [ -z "$http_proxy" ] || [ -z "$https_proxy" ]; then
        echo "Proxy is not set."
    else
        echo "http_proxy=$http_proxy"
        echo "https_proxy=$https_proxy"
    fi
}

# Function to unset the proxy server address
unset_proxy() {
    unset http_proxy
    unset https_proxy
    check_proxy
}

# Example usage
# 根据不同参数执行不同操作
case $1 in
    set)
        if [ -z "$2" ]; then
            echo "Usage: $0 set <port>"
            exit 1
        fi
        set_proxy $2
        ;;
    unset)
        unset_proxy
        ;;
    check)
        check_proxy
        ;;
    *)
        echo "Usage: $0 {set <port>|unset|check}"
        exit 1
        ;;
esac