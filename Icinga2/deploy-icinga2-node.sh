#!/bin/bash

usage() {
    echo `basename $0`: ERROR: $* 1>&2
    echo usage: `basename $0` '[-h]' 1>&2
    exit 1
}

help() {
    echo usage: `basename $0` '[-h] <icinga.node> <icingagroup>' 1>&2
    exit 1
}

while :
do
    case "$1" in
    -h|--help) help ;;
    -*) usage "bad argument $1";;
    *) break;;
    esac
    shift
done

if [ -z "$2" ]; then
    usage
    exit 1
fi
ansible-playbook -i inventory icinga2-node-setup.yml -e hostitem=${1} mygroup=${2}
