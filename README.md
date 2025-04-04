# defender-bypass
C语言免杀绕过 Windows Defender

## 编译
### Windows:

```bash
make clean
make
```

### Linux (mingw):

```bash
make clean
make PLATFORM=mingw
```

## 运行
需要在 Windows 环境下运行。

首先将 `payload` 编码

```bash
cd build
cp /path/to/payload input.bin
./encode.exe
```

得到的 `output.bin` 和 `main.exe` 一起分发。执行时放在同一个文件夹下双击执行即可。如果从命令行执行，需要确保工作目录为 `output.bin` 和 `main.exe` 所在文件夹。