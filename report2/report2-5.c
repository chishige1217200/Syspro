#include "spim.h"

void print_char(char c)
{
    char s[2];

    s[0] = c;
    s[1] = '\0';

    print_string(s);
}

void print_big_str(char *s)
{
    int i = 0;
    char c;
    for (i = 0; *(s + i * sizeof(char)) != '\0'; i++)
    {
        c = *(s + i * sizeof(char));
        if (c >= 97 && c <= 122)
            c -= 32;
        print_char(c);
    }
}

void print_small_str(char *s)
{
    int i = 0;
    char c;
    for (i = 0; *(s + i * sizeof(char)) != '\0'; i++)
    {
        c = *(s + i * sizeof(char));
        if (c >= 65 && c <= 90)
            c += 32;
        print_char(c);
    }
}

char read_char()
{
    char buf[1025];
    char c;
    read_string(buf, 1025);
    c = buf[0];
    return c;
}

void myprintf(char *fmt, ...)
{
    int i, argc = 0;
    char *s;
    char c;

    while (*fmt)
    {
        if (*fmt == '%')
        {
            fmt++;
            argc++;
            switch (*fmt)
            {
            case 'd': // 数字の表示
                i = *((int *)((char *)&fmt + argc * sizeof(void *)));
                print_int(i);
                break;
            case 's': // 文字列の表示
                s = *((char **)((char *)&fmt + argc * sizeof(void *)));
                print_string(s);
                break;
            case 'c':
                c = *((char *)((char *)&fmt + argc * sizeof(void *)));
                print_char(c);
                break;
            case 'b': // すべて小文字で表示 *sはchar *
                s = *((char **)((char *)&fmt + argc * sizeof(void *)));
                print_small_str(s);
                break;
            case 'B': // すべて大文字で表示 *sはchar *
                s = *((char **)((char *)&fmt + argc * sizeof(void *)));
                print_big_str(s);
                break;
            }
        }
        else
        {
            print_char(*fmt);
        }
        fmt++;
    }
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

int main()
{
    myprintf("TEST %d %c is %B ...\n", 99, 'a', "ok");
    print_string("All done\n");
    return 0;
}