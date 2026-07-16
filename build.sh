#!/bin/bash

OUTPUT_FILE="./out/boot.img"
CLEAN_BUILD_FILE=".clean_build"
FULLY_CLEAN_FILE=".fully_clean"

if [ $# -ne 1 ]; then
    echo "At least 1 argument:\nclean build run dry-run\n"
    exit 1
fi


if [[ $1 == "clean" ]]; then
    mkdir -p ./out/
    rm -rf ./out
    mkdir -p ./out/
    touch $FULLY_CLEAN_FILE
    exit
fi

if [[ $1 == "build" ]]; then
    exec bash "$0" "clean" &
    until [ -e "$FULLY_CLEAN_FILE" ]; do
        sleep 1
    done
    nasm -f bin ./src/kernel.asm -o ./out/kernel.bin
    nasm -f bin ./src/bootloader.asm -o ./out/bootloader.bin
    cat ./out/bootloader.bin ./out/kernel.bin > $OUTPUT_FILE
    touch $CLEAN_BUILD_FILE
    rm $FULLY_CLEAN_FILE
    exit
fi

if [[ $1 == "run" ]]; then
    exec bash "$0" "build" &
    sleep 1
    until [ -e "$CLEAN_BUILD_FILE" ]; do
        sleep 1
    done
    rm $CLEAN_BUILD_FILE
    qemu-system-x86_64 -drive file=./out/boot.img,format=raw
    exit
fi

if [[ $1 == "dry-run" ]]; then
    if [ -f "$OUTPUT_FILE" ]; then
        qemu-system-x86_64 -drive file=./out/boot.img,format=raw
        exit
    fi
    echo "OS is not compiled!"
    exit -1
fi

echo "Not a valid argument : $1 \nValid arguments are:\nclean build run dry-run"
exit 1
