#!/bin/sh

# 'Copyright © 2023-2024 彩銘羽 (GitHubホーム: https://github.com/Cai-Ming-Yu)'
# GitHubリポジトリ: https://github.com/Cai-Ming-Yu/CMY-Visual-Obfuscator
# このスクリプトは、彩銘羽が独自に作成したものです。このプロジェクトをサポートしていただける方は、私のGitHubリポジトリ https://github.com/Cai-Ming-Yu/CMY-Visual-Obfuscator にアクセスをしてStarを付けてくれると嬉しいです！

mode="${1}"
num="${2}"
num_bak="${2}"
input="${3}"
output="${4}"
files="${@:3}"

[[ "${num}" == '' || "${num}" -eq '0' || "${input}" == '' ]] && exit 1

shell=''

case "${mode}" in
    'file')
        [[ -f "${input}" ]] && {
            shell="$(cat "${input}")"
            until [[ "${num}" -eq 0 ]]
            do
                shell="$(echo -n "${shell}"|gzip -c9|base64 -w 0)"
                shell="{ \$(echo \"$(echo "set +x" | bzip2 -c9 | base64 -w 0)\"|base64 -d|bzcat);\$(printf \"$(printf "eval"|base64 -w 0)\"|base64 -d) \"\$(echo -en \"${shell}\"|base64 -d|zcat)\";};"
                shell="{ set +x;\$(printf \"$(printf "eval"|base64 -w 0)\"|base64 -d) \"\$(echo -en \"$(echo -en "${shell}"|base64 -w 0)\"|base64 -d)\";};"
                let num--
            done
            [[ "${output}" != '' ]] && {
                echo -en "#!/bin/sh\n\n\n #  彩銘羽 Visual Obfuscator\n\n #  バージョン: Version 1.1.0 (2024.02.11)\n\n #  開発者: 彩銘羽 (GitHubホーム: https://github.com/Cai-Ming-Yu)\n\n #  GitHubリポジトリ: https://github.com/Cai-Ming-Yu/CMY-Visual-Obfuscator\n\n #  日時: $(date '+%x %A %r')\n\n #  This file uses Visual Obfuscator for encryption obfuscates the file, please DO NOT modify the file!\n\n\n" > "${output}"
                echo -en "${shell}" | while read -n 1 code;do [[ "${code}" == '' || "${code}" == ' ' ]] && echo ' \' >> "${output}" || echo "${code}\\" >> "${output}";done
                echo -en "# 開発者: 彩銘羽 (GitHubホーム: https://github.com/Cai-Ming-Yu)" >> "${output}"
                } || {
                echo -en "#!/bin/sh\n\n\n #  彩銘羽 Visual Obfuscator\n\n #  バージョン: Version 1.1.0 (2024.02.11)\n\n #  開発者: 彩銘羽 (GitHubホーム: https://github.com/Cai-Ming-Yu)\n\n #  GitHubリポジトリ: https://github.com/Cai-Ming-Yu/CMY-Visual-Obfuscator\n\n #  日時: $(date '+%x %A %r')\n\n #  This file uses Visual Obfuscator for encryption obfuscates the file, please DO NOT modify the file!\n\n\n"
                echo -en "${shell}" | while read -n 1 code;do [[ "${code}" == '' || "${code}" == ' ' ]] && echo ' \' || echo "${code}\\";done
                echo -en "# 開発者: 彩銘羽 (GitHubホーム: https://github.com/Cai-Ming-Yu)"
            }
        }
    ;;
    'files')
        for i in ${files}
        do
            [[ -e "${i}" ]] && {
                [[ -d "${i}" ]] && {
                    for file in $(find "${i}" -type f -name "*.sh")
                    do
                        num="${num_bak}"
                        output="$(dirname "${file}")/$(basename "${file}" .sh)-encrypted.sh"
                        shell="$(cat "${file}")"
                        until [[ "${num}" -eq 0 ]]
                        do
                            shell="$(echo -n "${shell}"|gzip -c9|base64 -w 0)"
                            shell="{ \$(echo \"$(echo "set +x" | bzip2 -c9 | base64 -w 0)\"|base64 -d|bzcat);\$(printf \"$(printf "eval"|base64 -w 0)\"|base64 -d) \"\$(echo -en \"${shell}\"|base64 -d|zcat)\";};"
                            shell="{ set +x;\$(printf \"$(printf "eval"|base64 -w 0)\"|base64 -d) \"\$(echo -en \"$(echo -en "${shell}"|base64 -w 0)\"|base64 -d)\";};"
                            let num--
                        done
                        echo -en "#!/bin/sh\n\n\n #  彩銘羽 Visual Obfuscator\n\n #  バージョン: Version 1.1.0 (2024.02.11)\n\n #  開発者: 彩銘羽 (GitHubホーム: https://github.com/Cai-Ming-Yu)\n\n #  GitHubリポジトリ: https://github.com/Cai-Ming-Yu/CMY-Visual-Obfuscator\n\n #  日時: $(date '+%x %A %r')\n\n #  This file uses Visual Obfuscator for encryption obfuscates the file, please DO NOT modify the file!\n\n\n" > "${output}"
                        echo -en "${shell}" | while read -n 1 code;do [[ "${code}" == '' || "${code}" == ' ' ]] && echo ' \' >> "${output}" || echo "${code}\\" >> "${output}";done
                        echo -en "# 開発者: 彩銘羽 (GitHubホーム: https://github.com/Cai-Ming-Yu)" >> "${output}"
                    done
                }
                [[ -f "${i}" ]] && {
                    num="${num_bak}"
                    output="$(dirname "${i}")/$(basename "${i}" .sh)-encrypted.sh"
                    shell="$(cat "${i}")"
                    until [[ "${num}" -eq 0 ]]
                    do
                        shell="$(echo -n "${shell}"|gzip -c9|base64 -w 0)"
                        shell="{ \$(echo \"$(echo "set +x" | bzip2 -c9 | base64 -w 0)\"|base64 -d|bzcat);\$(printf \"$(printf "eval"|base64 -w 0)\"|base64 -d) \"\$(echo -en \"${shell}\"|base64 -d|zcat)\";};"
                        shell="{ set +x;\$(printf \"$(printf "eval"|base64 -w 0)\"|base64 -d) \"\$(echo -en \"$(echo -en "${shell}"|base64 -w 0)\"|base64 -d)\";};"
                        let num--
                    done
                    echo -en "#!/bin/sh\n\n\n #  彩銘羽 Visual Obfuscator\n\n #  バージョン: Version 1.1.0 (2024.02.11)\n\n #  開発者: 彩銘羽 (GitHubホーム: https://github.com/Cai-Ming-Yu)\n\n #  GitHubリポジトリ: https://github.com/Cai-Ming-Yu/CMY-Visual-Obfuscator\n\n #  日時: $(date '+%x %A %r')\n\n #  This file uses Visual Obfuscator for encryption obfuscates the file, please DO NOT modify the file!\n\n\n" > "${output}"
                    echo -en "${shell}" | while read -n 1 code;do [[ "${code}" == '' || "${code}" == ' ' ]] && echo ' \' >> "${output}" || echo "${code}\\" >> "${output}";done
                    echo -en "# 開発者: 彩銘羽 (GitHubホーム: https://github.com/Cai-Ming-Yu)" >> "${output}"
                }
            }
        done
    ;;
    'overfiles')
        for i in ${files}
        do
            [[ -e "${i}" ]] && {
                [[ -d "${i}" ]] && {
                    for file in $(find "${i}" -type f -name "*.sh")
                    do
                        num="${num_bak}"
                        output="${file}"
                        shell="$(cat "${file}")"
                        until [[ "${num}" -eq 0 ]]
                        do
                            shell="$(echo -n "${shell}"|gzip -c9|base64 -w 0)"
                            shell="{ \$(echo \"$(echo "set +x" | bzip2 -c9 | base64 -w 0)\"|base64 -d|bzcat);\$(printf \"$(printf "eval"|base64 -w 0)\"|base64 -d) \"\$(echo -en \"${shell}\"|base64 -d|zcat)\";};"
                            shell="{ set +x;\$(printf \"$(printf "eval"|base64 -w 0)\"|base64 -d) \"\$(echo -en \"$(echo -en "${shell}"|base64 -w 0)\"|base64 -d)\";};"
                            let num--
                        done
                        echo -en "#!/bin/sh\n\n\n #  彩銘羽 Visual Obfuscator\n\n #  バージョン: Version 1.1.0 (2024.02.11)\n\n #  開発者: 彩銘羽 (GitHubホーム: https://github.com/Cai-Ming-Yu)\n\n #  GitHubリポジトリ: https://github.com/Cai-Ming-Yu/CMY-Visual-Obfuscator\n\n #  日時: $(date '+%x %A %r')\n\n #  This file uses Visual Obfuscator for encryption obfuscates the file, please DO NOT modify the file!\n\n\n" > "${output}"
                        echo -en "${shell}" | while read -n 1 code;do [[ "${code}" == '' || "${code}" == ' ' ]] && echo ' \' >> "${output}" || echo "${code}\\" >> "${output}";done
                        echo -en "# 開発者: 彩銘羽 (GitHubホーム: https://github.com/Cai-Ming-Yu)" >> "${output}"
                    done
                }
                [[ -f "${i}" ]] && {
                    num="${num_bak}"
                    output="${i}"
                    shell="$(cat "${i}")"
                    until [[ "${num}" -eq 0 ]]
                    do
                        shell="$(echo -n "${shell}"|gzip -c9|base64 -w 0)"
                        shell="{ \$(echo \"$(echo "set +x" | bzip2 -c9 | base64 -w 0)\"|base64 -d|bzcat);\$(printf \"$(printf "eval"|base64 -w 0)\"|base64 -d) \"\$(echo -en \"${shell}\"|base64 -d|zcat)\";};"
                        shell="{ set +x;\$(printf \"$(printf "eval"|base64 -w 0)\"|base64 -d) \"\$(echo -en \"$(echo -en "${shell}"|base64 -w 0)\"|base64 -d)\";};"
                        let num--
                    done
                    echo -en "#!/bin/sh\n\n\n #  彩銘羽 Visual Obfuscator\n\n #  バージョン: Version 1.1.0 (2024.02.11)\n\n #  開発者: 彩銘羽 (GitHubホーム: https://github.com/Cai-Ming-Yu)\n\n #  GitHubリポジトリ: https://github.com/Cai-Ming-Yu/CMY-Visual-Obfuscator\n\n #  日時: $(date '+%x %A %r')\n\n #  This file uses Visual Obfuscator for encryption obfuscates the file, please DO NOT modify the file!\n\n\n" > "${output}"
                    echo -en "${shell}" | while read -n 1 code;do [[ "${code}" == '' || "${code}" == ' ' ]] && echo ' \' >> "${output}" || echo "${code}\\" >> "${output}";done
                    echo -en "# 開発者: 彩銘羽 (GitHubホーム: https://github.com/Cai-Ming-Yu)" >> "${output}"
                }
            }
        done
    ;;
    *) exit 1 ;;
esac