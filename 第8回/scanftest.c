#include "spim.h"

char read_char()
{
    char buf[1025];
    char c;
    read_string(buf, 1025);
    c = buf[0];
    return c;
}

void myscanf(char *fmt, ...)
{
    int *i;
    int argc = 0;
    char *c;
    char *s;

    while (*fmt)
    {
        if (*fmt == '%')
        {
            fmt++;
            argc++;
            switch (*fmt)
            {
            case 'd': // 数字の表示
                i = *((int **)((char *)&fmt + argc * sizeof(void *)));
                *i = read_int();
                break;
            case 's':
                s = *((char **)((char *)&fmt + argc * sizeof(void *)));
                read_string(s, 1025);
                break;
            case 'c':
                c = *((char **)((char *)&fmt + argc * sizeof(void *)));
                *c = read_char();
            }
        }
        fmt++;
    }
}

int main(void)
{
    int num;
    char buf[1025];

    myscanf("%d", &num);
    myscanf("%s", buf);

    print_int(num);
    print_string("\n");
    print_string(buf);
    print_string("\n");
}