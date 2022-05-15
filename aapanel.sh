#! /bin/bash
# By Aaron
# https://github.com/AaronYES/aapanel

#彩色
red(){
    echo -e "\033[31m\033[01m$1\033[0m"
}
green(){
    echo -e "\033[32m\033[01m$1\033[0m"
}
yellow(){
    echo -e "\033[33m\033[01m$1\033[0m"
}
blue(){
    echo -e "\033[34m\033[01m$1\033[0m"
}
purple(){
    echo -e "\033[35m\033[01m$1\033[0m"
}

# 下载aapanel面板
function aapanel-install(){
wget -O "/root/aapanel-install.sh" "http://www.aapanel.com/script/install_6.0_en.sh"
blue "下载完成,正在安装官网原版."
bash "/root/aapanel-install.sh"
}

# 降级aapanel 官网下载(最后一个无广告版本)
function downgrade-official(){
wget -O "/root/LinuxPanel_EN-6.8.23.zip" "http://node.aapanel.com/install/update/LinuxPanel_EN-6.8.23.zip"
blue "下载完成,正在降级."
unzip LinuxPanel_EN-6.8.23.zip
cd /root/panel
wget -O "/root/panel/downgrade.sh" "https://ghproxy.com/https://raw.githubusercontent.com/AaronYES/aapanel/main/downgrade.sh" 
bash "/root/panel/downgrade.sh"
blue "降级成功."
}

# 降级aapanel GitHub下载 (最后一个无广告版本)
function downgrade-github(){
wget -O "/root/LinuxPanel_EN-6.8.23.zip" "https://ghproxy.com/https://github.com/AaronYES/aapanel/releases/download/1.0/LinuxPanel_EN-6.8.23.zip"
blue "下载完成,正在降级."
unzip LinuxPanel_EN-6.8.23.zip
cd /root/panel
wget -O "/root/panel/downgrade.sh" "https://ghproxy.com/https://raw.githubusercontent.com/AaronYES/aapanel/main/downgrade.sh" 
bash "/root/panel/downgrade.sh"
blue "降级成功."
}

# 菜单
function start_menu(){
    clear
    purple " https://github.com/AaronYES/aapanel"
    yellow " =================================================="
    green " 1. CentOS/Debian/Ubuntu 安装 aaPanel"
    yellow " --------------------------------------------------"
    green " 2. 降级 6.8.23 版本 aaPanel(官网)"
    green " 3. 降级 6.8.23 版本 aaPanel(GitHub仓库)"
    yellow " =================================================="
    green " 0. 退出脚本"
    echo
    read -p "请输入数字:" menuNumberInput
    case "$menuNumberInput" in
        1 )
           aapanel-install
	    ;;
        2 )
           downgrade-official
        ;;
        3 )
           downgrade-github
        ;;
        0 )
            exit 1
        ;;
        * )
            clear
            red "请输入正确数字 !"
            start_menu
        ;;
    esac
}
start_menu "first"
