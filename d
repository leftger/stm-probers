#!/usr/bin/env bash

set -e
cd $(dirname $0)

CMD=$1
STM_REV=3dfb70953b19579eebd28407847084a89d4d9949
PROBE_RS_REV=d2bd8e7bfa55245929c242065f8ff477876b27d4
shift

case "$CMD" in
    download-all)
        rm -rf ./sources/

        git clone https://github.com/embassy-rs/stm32-data-generated.git ./sources/stm32-data-generated -q
        cd ./sources/stm32-data-generated/
        git checkout $STM_REV
        cd ../..

        git clone https://github.com/probe-rs/probe-rs.git ./sources/probe-rs -q
        cd ./sources/probe-rs/
        git checkout $PROBE_RS_REV
        cd ../..
    ;;
    gen)
        rm -rf output
        cargo run --release
    ;;
    *)
        echo "unknown command"
    ;;
esac
