# defender-bypass
C语言免杀绕过 Windows Defender

## 编译

```bash
make clean
make
```

可以通过`CC`指定希望使用的`C`编译器。例如，如果希望在 Linux 上通过 mingw 交叉编译：

```bash
make clean
make CC=x86_64-w64-mingw32-gcc
```

编译成果位于 `build` 文件夹。

也可以使用 `Visual Studio` 编译。分别编译 `encode.c` 和 `main.c` 即可。

## 运行
需要在 Windows 环境下运行。

首先将 `payload` 编码。将二进制 `payload` 重命名为 `input.bin`，放在工作目录下，执行 `encode.exe`。得到的 `output.bin` 和 `main.exe` 一起分发。执行时确保 `output.bin` 在工作目录下。