# TinyForge OS

**TinyForge OS** is a fun, experimental, Bash-like environment written in pure **Assembly**.  
OS is a **tiny sandbox**, designed to explore how high-level language concepts can work in a low-level world.  
It lacks serial, ethernet, graphics, etc. drivers and is written in 16 bit real mode.

---

## What is TinyForge?

TinyForge is a minimalist environment that mimics a shell experience similar to bash but everything under the hood runs in **ASM**.  
It’s built for curiosity, learning, and a bit of geeky fun.  

Think of it as:
> “What if someone tried to recreate linux from memory while having little knowledge of how osdev works.”  

---

## Features

- **Bash-like command line interface**  
  TinyForge interprets commands that *behave* like regular programs, but executes them directly in ASM.  
  Programs are seperate files which are included in final build and are disk loaded.  

- **Small & fast**  
  Written entirely in low-level assembly — no external dependencies.  
  Only coming about 5KB even though most of the space is padding.  

- **Educational playground**
  Great for learning about parsing, interpretation, and OS fundamentals in a fun, minimal setting.  

- **OS shell Mimicry**
  You can run commands and get outputs like a tiny terminal-based OS.  

---

## Getting Started

Clone the repository:
   ```bash
   git clone https://github.com/mehmedaltug/tinyforge-os.git
   cd tinyforge-os
   ./build.sh build  
   ./build.sh run  
   ```
