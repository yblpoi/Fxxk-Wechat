#!/system/bin/sh
# 控制脚本
#负责控制Magisk的显示，启动停止等功能

MODDIR=${0%/*}

# 检测删除脚本是否运行

PROCESS()
{
	ps -ef | grep "Fxxk-wechat.sh" | grep -v grep | wc -l
}

while :
do
	if [[ ! -f $MODDIR/disable ]]; then
		if [[ $(PROCESS) -eq 0 ]]; then
			nohup sh $MODDIR/Fxxk-wechat.sh &
		fi
	else
		if [[ $(PROCESS) -ne 0 ]]; then
			kill -9 $(ps -ef | grep Fxxk-wechat.sh | grep -v grep | awk '{ print $2 }')
			[[ $? == 0 ]] && sed -i "/^description=/c description=已手动停止运行 (重新打开则继续运行 无需重启)" "$MODDIR/module.prop"
		fi
	fi
	sleep 5
done