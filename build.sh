#!/bin/bash

OUTPUT_FILE="./out/boot.img"

if [ $# -ne 1 ]; then
    echo "At least 1 argument:\nclean build run dry-run\n"
    exit 1
fi


if [[ $1 == "clean" ]]; then
    mkdir -p ./out/
    rm -rf ./out
    mkdir -p ./out/
    exit
fi

if [[ $1 == "build" ]]; then
    mkdir -p ./out/programs
    nasm -f bin ./src/kernel.asm -o ./out/kernel.bin
    nasm -f bin ./src/bootloader.asm -o ./out/bootloader.bin
    for i in ./programs/*; do
        if [ -f "$i" ]; then
            FILE_FULL_NAME=${i##*/}
            FILE_NAME=${FILE_FULL_NAME%.*}
            nasm -f bin "./programs/${FILE_FULL_NAME}" -o "./out/programs/${FILE_NAME}.bin"
        fi
    done
    cat ./out/bootloader.bin ./out/kernel.bin ./out/programs/* > $OUTPUT_FILE
    exit
fi

if [[ $1 == "run" ]]; then
    nasm -f bin ./src/kernel.asm -o ./out/kernel.bin
    nasm -f bin ./src/bootloader.asm -o ./out/bootloader.bin
    for i in ./programs/*; do
        if [ -f "$i" ]; then
            FILE_FULL_NAME=${i##*/}
            FILE_NAME=${FILE_FULL_NAME%.*}
            nasm -f bin "./programs/${FILE_FULL_NAME}" -o "./out/programs/${FILE_NAME}.bin"
        fi
    done
    cat ./out/bootloader.bin ./out/kernel.bin ./out/programs/* > $OUTPUT_FILE
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
