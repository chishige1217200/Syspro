//#include "spim.h"

void print_char(char c)
{
	char s[2];

	s[0] = c;
	s[1] = '\0';

	print_string(s);
}

void print_big_str(char *c)
{

	print_string(c);
}

void print_small_str(char *c)
{

	print_string(c);
}

void print_hex_int(int i)
{
}

void myprintf(char *fmt, ...)
{
	int i, argc = 0;
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
				i = *((int *)((char *)&fmt + argc * sizeof(void *)));
				print_int(i);
				break;
			case 's': // 文字列の表示
				s = *((char **)((char *)&fmt + argc * sizeof(void *)));
				print_string(s);
				break;
			case 'c':
				s = *((char **)((char *)&fmt + argc * sizeof(void *)));
				print_char(*s);
				break;
			case 'b': // すべて小文字で表示
				s = *((char **)((char *)&fmt + argc * sizeof(void *)));
				print_small_str(s);
				break;
			case 'B': // すべて大文字で表示
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

int main()
{
	myprintf("TEST %d is %s ...\n", 99, "OK");
	print_string("All done\n");
	return 0;
}
