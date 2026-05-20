# Sort Visualiser

A bubble sort visualiser built with Free Pascal and the SwinGame framework. Opens an 800×600 window displaying a bar graph that animates after sorting 20 randomly generated values.

## Prerequisites

- [Free Pascal Compiler (FPC)](https://www.freepascal.org/download.html) — must be on your `PATH`
- **macOS only:** Xcode command-line tools

```bash
xcode-select --install
```

## Build & Run

```bash
./build.sh   # compile
./run.sh     # launch
```

The compiled binary is placed in `bin/Debug/`. On macOS it is packaged as a `.app` bundle.

## Usage

Click the **Sort!** button in the right-hand panel. The app will generate 20 random values, sort them, then animate the result as a bar graph. The sorted values are also listed in the panel on the right.

## Other Commands

| Command | Description |
|---|---|
| `./build.sh -r` | Release build (no debug symbols) |
| `./build.sh -c` | Clean build artifacts only |
| `./clean.sh` | Remove all build output (`bin/` and `tmp/`) |
