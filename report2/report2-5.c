#include "spim.h"

void print_char(char c)
{
    char s[2]; // バッファー(2文字目は終端文字)

    s[0] = c;       // 1文字目代入
    s[1] = '\0';    // 終端文字代入

    print_string(s); // 文字列表示
}

void print_big_str(char *s)
{
    int i = 0;  // オフセット指定用
    char c;     // 1文字バッファー

    for (i = 0; *(s + i * sizeof(char)) != '\0'; i++)
    {
        c = *(s + i * sizeof(char)); // 次の文字情報をcに代入
        if (c >= 97 && c <= 122) // 小文字なら大文字へ
            c -= 32;
        print_char(c); // 1文字表示
    }
}

void print_small_str(char *s)
{
    int i = 0;  // オフセット指定用
    char c;     // 1文字バッファー

    for (i = 0; *(s + i * sizeof(char)) != '\0'; i++)
    {
        c = *(s + i * sizeof(char)); // 次の文字情報をcに代入
        if (c >= 65 && c <= 90) // 大文字なら小文字へ
            c += 32;
        print_char(c); // 1文字表示
    }
}

char read_char()    // 1文字入力関数
{
    char buf[1025]; // 入力文字数は最大1024文字
    char c;         // 最初の1文字を格納

    read_string(buf, 1025); // 入力受付
    c = buf[0];     // 最初の1文字をcに代入
    return c;
}

void myprintf(char *fmt, ...)
{
    int i;          // 引数から受け取ったint値を代入
    int argc = 0;   // 何番目の引数か
    char c;         // 引数から受け取ったASCIIコードを代入
    char *s;        // 引数となる文字列の先頭アドレスを格納

    while (*fmt)
    {
        if (*fmt == '%')
        {
            fmt++; // 検索対象文字列を1文字右へ
            argc++; // 引数のカウント数を1増やす
            switch (*fmt)
            {
            case 'd': // 数値の表示
                i = *((int *)((char *)&fmt + argc * sizeof(void *)));
                print_int(i); // 数値表示
                break;
            case 's': // 文字列の表示
                s = *((char **)((char *)&fmt + argc * sizeof(void *)));
                print_string(s); // 文字列表示
                break;
            case 'c': // 1文字表示
                c = *((char *)((char *)&fmt + argc * sizeof(void *)));
                print_char(c); // 1文字表示
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
            print_char(*fmt); // 1文字表示
        }
        fmt++; // 検索対象文字列を1文字右へ
    }
}

void myscanf(char *fmt, ...) //引数は1個まで
{
    int *i;         // 引数となる変数のアドレスを格納
    char *c;        // 引数となる変数のアドレスを格納
    char *s;        // 引数となる変数のアドレスを格納

    while (*fmt)
    {
        if (*fmt == '%')
        {
            fmt++; // 検索対象文字列を1文字右へ
            switch (*fmt)
            {
            case 'd': // 数値の入力
                i = *((int **)((char *)&fmt + sizeof(void *))); // 代入先情報
                *i = read_int();
                break;
            case 's': // 文字列の入力
                s = *((char **)((char *)&fmt + sizeof(void *))); // 代入先情報
                read_string(s, 1025);
                break;
            case 'c': // 1文字入力
                c = *((char **)((char *)&fmt + sizeof(void *))); // 代入先情報
                *c = read_char();
                break;
            }
        }
        fmt++; // 検索対象文字列を1文字右へ
    }
}

int main()                      // 整数専用の電卓
{
    int out = 0;                // 計算結果
    int in;                     // 計算用の入力数値
    char mode;                  // mode選択用
    char flag;                  // y or n フラグ用
    char his_operand;           // 履歴を1回分保存
    int his_num = 0;            // 履歴を1回分保存

    myprintf("Starting %b...\n", "CALCULATOR");

    while (1)
    {
        myprintf("Please select the calc mode. (\"+\" or \"-\" or \"*\" or \"/\" or \"0\" or \"c\" or \"q\")\nMode? : ", out);
        myscanf("%c", &mode); // mode選択
        if (mode == 'q') // Qを選択した場合
            break;       // whileループを抜ける
        if (mode == '0') // '0'を選択した場合
        {
            myprintf("Do you want to reset output? (y or n)\n");
            myscanf("%c", &flag); // フラグ選択
            if (flag == 'y') // yを選択した場合
            {
                myprintf("Reset output.\n\n");
                out = 0; // 計算結果を0にリセット
            }
            else
                myprintf("Operation cancelled.\n");

            continue;
        }
        if (mode == 'c') // Cを選択した場合
        {
            myprintf("Result : %d\n\n", out); // 確認用に結果を出力
            continue; // ループ先頭に戻る
        }

        if (mode != '+' && mode != '-' && mode != '*' && mode != '/') // モードを正しく選択しなかった場合
        {
            myprintf("Please select the correct mode.\n\n");
            continue;
        }

        myprintf("Please input the number.(int type ONLY)\nNumber? : ");
        myscanf("%d", &in); // 整数の入力値受付

        his_operand = mode; // historyに入力モードを登録
        his_num = in;       // historyに入力数値を登録

        if (mode == '+') // 加算モード
            out = out + in;
        if (mode == '-') // 減算モード
            out = out - in;
        if (mode == '*') // 乗算モード
            out = out * in;
        if (mode == '/') // 除算モード
            if (in != 0) // 0除算は禁止
                out = out / in;
            else
                myprintf("Cannot divide by zero.\nOperarion denied.\n");

        myprintf("Result : %d\n\n", out); // 演算後に結果出力
    }
    myprintf("%B : %d", "final result", out); // 最終結果出力
    myprintf("\nQuit.\n");
    return 0;
}