#!/bin/sh

# 'Copyright © 2023-2024 彩銘羽 (GitHubホーム: https://github.com/Cai-Ming-Yu)'
# GitHubリポジトリ: https://github.com/Cai-Ming-Yu/CMY-Script-Encryption-Obfuscator
# このスクリプトは、彩銘羽が独自に作成したものです。このプロジェクトをサポートしていただける方は、私のGitHubリポジトリ https://github.com/Cai-Ming-Yu/CMY-Script-Encryption-Obfuscator にアクセスをしてStarを付けてくれると嬉しいです！

clear

getInputFile() {
    printf "ファイルパスを入力してください (Input file path)："
    read input
    [[ ! -f "${input}" ]] && {
        echo "ファイルが存在しません (Not a real file)"
        exit 1
    }
    return 0
}

getEnNum() {
    printf "暗号化数 (Number of encryptions)："
    read num
    [[ "${num}" == '' || "${num}" -eq '0' ]] && {
        echo "数値誤差 (Numerical error)"
        exit 1
    }
    return 0
}

getOutputFile() {
    printf "出力パスを入力してください (Output file path)："
    read output
    [[ -e "${output}" ]] && {
        [[ -f "${output}" ]] && {
            echo "警告:ファイルはすでに存在します (Warning, file already exist)"
        } || {
            echo "そのパスは使用できません (Not available)"
            exit 1
        }
    }
    return 0
}

makeNewFile() {
    local shell="$(cat "${input}")"
    until [[ "${num}" -eq 0 ]]; do
        local shell="$(echo -n "${shell}" | gzip -c9 | base64 -w 0)"
        local shell="{ \$(echo \"$(echo "set +x" | bzip2 -c9 | base64 -w 0)\"|base64 -d|bzcat);\$(printf \"$(printf "eval" | base64 -w 0)\"|base64 -d) \"\$(echo -en \"${shell}\"|base64 -d|zcat)\";};"
        local shell="{ set +x;\$(printf \"$(printf "eval" | base64 -w 0)\"|base64 -d) \"\$(echo -en \"$(echo -en "${shell}" | base64 -w 0)\"|base64 -d)\";};"
        let num--
    done
    [[ -f "${output}" ]] && {
        chattr -i "${output}" >/dev/null 2>&1
        rm -rf "${output}" >/dev/null 2>&1
        [[ -f "${output}" ]] && {
            echo "ファイルを削除できません (Cannot delete file)"
            exit 1
        }
    }
    echo -en "#!/bin/sh\n\n\n #  彩銘羽 Script Encryption Obfuscator\n\n #  バージョン: Version 1.1.0 (2024.02.11)\n\n #  開発者: 彩銘羽 (GitHubホーム: https://github.com/Cai-Ming-Yu)\n\n #  GitHubリポジトリ: https://github.com/Cai-Ming-Yu/CMY-Script-Encryption-Obfuscator\n\n #  日時: $(date '+%x %A %r')\n\n #  This file uses Script Encryption Obfuscator for encryption obfuscates the file, please DO NOT modify the file!\n\n\n" >"${output}"
    echo -en "${shell}" | while read -n 1 code; do [[ "${code}" == '' || "${code}" == ' ' ]] && echo ' \' >>"${output}" || echo "${code}\\" >>"${output}"; done
    echo -en "# 開発者: 彩銘羽 (GitHubホーム: https://github.com/Cai-Ming-Yu)" >>"${output}"
    echo "OK!"
    return 0
}

eval getInputFile
eval getEnNum
eval getOutputFile
eval makeNewFile

exit 0
