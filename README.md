# 彩銘羽 Script Encryption Obfuscator
あなたのシェルコードを視覚的に難読化します。

This tool can help you obfuscate and encrypt shell code scripts to help improve security.
However, it should still be noted that this project is just a simple example, and it does not bring good protection.

このツールを使用する事で、シェルコードスクリプトを難読化と暗号化をしてセキュリティを向上させる事ができます。
しかし、このプロジェクトは単純な例に過ぎず、十分な保護をもたらす物ではない事にご注意ください。

## How to use
First, download the "input.sh" file from this project.
Then start the script by means such as ```sh /path/to/input.sh```.
Then you need to type the path of the script that needs to be encrypted, then the path to the output file.
And finally, wait for the output "OK!" Can.

まず始めに、このプロジェクトから "input.sh" ファイルをダウンロードしてください。
次に ```sh /path/to/input.sh``` でスクリプトを起動します。
暗号化が必要なスクリプトのパスを入力し、次に出力先のファイルのパスを入力します。
そして最後に "OK!" の表示が出た後に出力されます。

cmdline mode:
``` shell
sh cmd.sh file <Number of encryptions> <input path> <output path>
sh cmd.sh files <Number of encryptions> <input path 1> <input path 2> <...>
sh cmd.sh overfiles <Number of encryptions> <input path 1> <input path 2> <...>
```
The ```files``` mode will produce files with the "-encrypted" suffix added,
and ```overfiles``` mode will overwrite the original file.

## Env
- command ```base64```, ```eval```, ```printf```, ```zcat```, ```bzcat```
- Theory supports all Linux and Android

## Warning
- Do not use on all kinds of harmful files, 彩銘羽 will not be responsible for any harmful time caused by the use of this tool.
- Do not use them on binary files unless you convert them to strings or place them at the end of the encrypted file.
- Do not use in a production environment.
- If it works well, order a star for the project.

## [License](https://github.com/Cai-Ming-Yu/CMY-Script-Encryption-Obfuscator/blob/C-M-Y/LICENSE)
