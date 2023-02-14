#!/system/bin/sh
#本文件作用：
#    1.读取并检查配置文件
#    2.运行删除命令
#    3.计算删除的数量并显示

# 工作进度：
#加入安全模块
# 脚本运行目录

MODDIR=${0%/*} 

#规则文件
#CONFFILE="$MODDIR/files/FUCK-WECHAT.conf"
#Read_Conf=$( cat $CONFFILE | grep -v '^#' | grep -v '^$')
# 在循环外 减少读取次数
source $MODDIR/files/FUCK-WECHAT.conf
# 建立死循环并开始功能
while :; do
    # 亮屏检测
    if [[ $(dumpsys window policy | grep "mInputRestricted" | cut -d= -f2) != "true" ]]; then
    
        # 读取配置文件
        #source $MODDIR/files/FUCK-WECHAT.conf
        #conf=$(Read_Conf)
        # 统计功能
        count="$MODDIR/files/$(date "+%m-%d")"
        if [[ ! -d $count ]]; then
            rm -rf $MODDIR/files/*/ > /dev/null 2>&1
            mkdir -p $count
            # 初始化统计数据
            echo 0 > $count/file
            echo 0 > $count/dir
        fi

        # 通过case分支判断目录是否安全
        # 删除功能
		for i in $Wechat_Rules ; do
			if [[ -d $i ]]; then
				case $i in
				"/data"|"/data/"|"/data/media/0"|"/data/media/0/"|"/data/media/0/Downloa"|"/data/media/0/Download/"|"/data/media/0/Android"|"/data/media/0/Android/"|"/sdcard"|"/sdcard/"|"/sdcard/Download"|"/sdcard/Download/"|"/sdcard/Android"|"/sdcard/Android/"|"/storage"|"/storage/"|"/storage/emulated/0"|"/storage/emulated/0/"|"/storage/emulated/0/Download"|"/storage/emulated/0/Download/"|"/storage/emulated/0/Android"|"/storage/emulated/0/Android/"|"/"|"/*")  (sed -i "/^description=/c description=！警告: 你填写了 $i ，触发停止运行！请删除后再打开模块继续运行！（无需重启）" "$MODDIR/module.prop" ; touch $MODDIR/disable ; exit 3 ) ;;
				*)  (rm -rf $i ; dir1=`cat $count/dir` ; dir2=$(expr $dir1 + 1) ; echo $dir2 > $count/dir ) ;;
				esac
			fi
			if [[ -f $i ]]; then
				rm -rf $i ;
                file1=`cat $count/file` 
                file2=$(expr $file1 + 1) 
                echo $file2 > $count/file
			fi
		done


        # 重建xlog
        xlog_file='/data/data/com.tencent.mm/files/'
        cd $xlog_file
        mkdir -p xlog
        chattr -R -i xlog
        cd $MODDIR

        # 写入统计数据
        DIR=`cat $count/dir`
        FILE=`cat $count/file`
        sed -i "/^description=/c description=模块Beta分支。部分策略较Stable激进。在亮屏解锁状态且微信处于后台时，清理某小龙的马。[ 今日已清理: $FILE个文件 $DIR个文件夹 ]" "$MODDIR/module.prop"

    fi
    sleep 3600
done