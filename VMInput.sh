#!/system/bin/sh

#不知道用来干嘛，反正就是好玩
clear
#Check root/shell
if [ "$(id -u)" = "0" ]; then echo "成功获取Root"; elif [ "$(id -u)" = "2000" ]; then echo "成功获取shell权限"; else echo "连shell权限都没有，过分了吧?"; exit 127; fi



version=1.0
echo "              _                   _   
 /\   /\/\/\ (_)_ __  _ __  _   _| |_ 
 \ \ / /    \| | '_ \| '_ \| | | | __|
  \ V / /\/\ \ | | | | |_) | |_| | |_ 
   \_/\/    \/_|_| |_| .__/ \__,_|\__|
                     |_|              "
echo "VMinput Version: $version"
echo "选择操作: "
echo "[1] 输入文本"
echo "[2] 模拟点击"
echo "[3] 模拟滑动"
echo "[4] 模拟按键(新手误入)"
echo "[0] 退出💾"
echo -n "请选择: "
read options

case $options in
    1)
        echo -n "请输入要模拟输入文本: "
        read vm_text
        timewait=5
        while [ "$timewait" != "0" ]; do
            echo -n "\r$timewait秒钟后开始模拟，请做好准备"
            sleep 1
            let "timewait=timewait-1"
        done
        echo ""
        input text "$vm_text"
        echo "Done!"
    ;;
    2)
        echo -n "请输入x坐标:"
        read vm_input_x
        echo -n "请输入y坐标:"
        read vm_input_y
        echo -n "请输入点击时间(毫秒)(推荐500):"
        read vm_input_time
        timewait=5
        while [ "$timewait" != "0" ]; do
            echo -n "\r$timewait秒钟后开始模拟，请做好准备"
            sleep 1
            let "timewait=timewait-1"
        done
        echo ""
        input touchscreen swipe $vm_input_x $vm_input_y $vm_input_x $vm_input_y $vm_input_time
        echo "Done!"
     ;;  
esac
