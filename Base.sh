#!/bin/sh

: 'Copyright © 2023-2023 彩銘羽 (GitHubホーム: https://github.com/Cai-Ming-Yu)'
: GitHub Repo: https://github.com/Cai-Ming-Yu/CMY-Visual-Obfuscator
: このスクリプトは彩銘羽が独自に作成したものです。このプロジェクトをサポートしていただける方は、私のGitHubリポジトリ https://github.com/Cai-Ming-Yu/CMY-Visual-Obfuscator にアクセスして、私に星をつけてください！

clear;

function getInputFile () {
    printf "ファイルパスを入力(Input file dir)：";
    read input;
    [[ ! -f "${input}" ]] && {
        echo "ファイルが存在しない(Not a real file)";
        exit 1;
    }
    return 0;
}

function getOutputFile () {
    printf "出力パスを入力(output file dir)：";
    read output;
    [[ -e "${output}" ]] && {
        [[ -f "${output}" ]] && {
            echo "警告、ファイルはすでに存在します(Warning, file already exist)";
        } || {
            echo "パスが利用できません(Not available)";
            exit 1;
        }
    }
    return 0;
}

function makeNewFile () {
    local base="{ \$(printf \"$(printf "eval"|base64 -w 0)\"|base64 -d) \"\$(echo -en \"$(cat "${input}"|gzip -c9|base64 -w 0)\"|base64 -d|zcat)\";};";
    local shell="{ \$(printf \"$(printf "eval"|base64 -w 0)\"|base64 -d) \"\$(echo -en \"$(echo -en "${base}"|base64 -w 0)\"|base64 -d)\";};";
    [[ -f "${output}" ]] && {
        chattr -i "${output}" >/dev/null 2>&1;
        rm -rf "${output}" >/dev/null 2>&1;
        [[ -f "${output}" ]] && {
            echo "ファイルを削除できない(Cannot delete file)";
            exit 1;
        }
    }
    echo -en "#!/bin/sh
: << 彩銘羽

彩銘羽 Visual Obfuscator

バージョン番号: Version 1.0.0 (2023.10.16)

著者: 彩銘羽 (GitHubホーム: https://github.com/Cai-Ming-Yu)

GitHub Repo: https://github.com/Cai-Ming-Yu/CMY-Visual-Obfuscator

使用日: $(date '+%x %A %r')

This file uses Visual Obfuscator for encryption obfuscates the file, please DO NOT modify the file!

彩銘羽

" > "${output}";
    echo -en "${shell}" | while read -n 1 code;do [[ "${code}" == '' || "${code}" == ' ' ]] && echo ' \' >> "${output}" || echo "${code}\\" >> "${output}";done;
    echo -en ": '著者: 彩銘羽 (GitHubホーム: https://github.com/Cai-Ming-Yu)';" >> "${output}";
    echo "OK!";
    return 0;
}

eval getInputFile;
eval getOutputFile;
eval makeNewFile;
exit 0;