#!/system/bin/sh
#本文件作用：
#    1.读取并检查配置文件
#    2.运行删除命令
#    3.计算删除的数量并显示

# 脚本运行目录
MODDIR=${0%/*} 

# 循环
while :; do
    # 亮屏检测
    if [[ $(dumpsys window policy | grep "mInputRestricted" | cut -d= -f2) != "true" ]]; then
    
        # 读取配置文件
        source /sdcard/Android/Fuck-WECHAT.conf

        # 统计功能
        count="$MODDIR/files/$(date "+%m-%d")"
        if [[ ! -d $count ]]; then
            rm -rf $MODDIR/files/*/ > /dev/null 2>&1
            mkdir -p $count
            # 初始化统计数据
            echo 0 > $count/file
            echo 0 > $count/dir
        fi

        # 删除功能
        for i in $Wechat_Log $Wechat_TBS $Wechat_Video $Wechat_Cache $Wechat_Lapp; do
            if [[ -d $i ]]; then
                rm -rf $i ; dir1=`cat $count/dir` ; dir2=$(expr $dir1 + 1) ; echo $dir2 > $count/dir
            fi
            if [[ -f $i ]]; then
                rm -rf $i ; file1=`cat $count/file` ; dir2=$(expr $file1 + 1) ; echo $file2 > $count/file
            fi
        done

        # 重建xlog
        xlog_file='/data/data/com.tencent.mm/files/'
        cd $xlog_file
        mkdir -p xlog
        chattr -R -i xlog
        rm -rf xlog
        cd $MODDIR

        # 写入统计数据
        DIR=`cat $count/dir`
        FILE=`cat $count/file`
        sed -i "/^description=/c description=清理某小龙的马，防止骨灰占据储存空间, [ 今日已清理：: $FILE吨骨灰 $DIR个骨灰盒 ]" "$MODDIR/module.prop"

    fi
    # 任务执行完毕，睡觉。
    sleep 300
done