#!/bin/bash

OUTPUT_FILE="./out/boot.img"

if [ $# -ne 1 ]; then
    echo "At least 1 argument:\nclean build run\n"
    exit 1
fi


if [[ $1 == "clean" ]]; then
    mkdir -p ./out/
    rm -rf ./out
    mkdir -p ./out/
    exit
fi

if [[ $1 == "build" ]]; then
    mkdir -p ./out/
    nasm -f bin ./src/main.asm -o ./out/main.bin
    nasm -f bin bootloader.asm -o ./out/bootloader.bin
    cat ./out/bootloader.bin ./out/mainn.bin > $OUTPUT_FILE
    exit
fi

if [[ $1 == "run" ]]; then
    if [ -f "$OUTPUT_FILE" ]; then
        qemu-system-x86_64 -drive file=./out/boot.img,format=raw
        exit
    fi
    exec bash "$0" "build"
    qemu-system-x86_64 -drive file=./out/boot.img,format=raw
    exit
fi

echo "Not a valid argument : $1 \nValid arguments are:\nclean build run"
exit 1
