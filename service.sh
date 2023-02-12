#!/system/bin/sh
# 此为启动脚本
# 思路：
#	1.非阻塞模式运行
#	2.检测sdcard分区读写
#	3.检测运行脚本是否运行
#	4.唤起运行脚本


MODDIR=${0%/*}

until [[ $(getprop sys.boot_completed) -eq 1 ]]; do
	sleep 2
done

# 测试读写
sdcard_rw()
{
	local test_file="/sdcard/Android/.A_TEST_FILE"
	touch $test_file
	while [[ ! -f $test_file ]]; do
		touch $test_file
		sleep 1
	done
	rm $test_file
}

PROCESS()
{
	ps -ef | grep "Run_FUCK_WECHAT.sh" | grep -v grep | wc -l
}

sdcard_rw

# [[ ! -f /sdcard/Android/FUCK-WECHAT.conf ]] && cp -af $MODDIR/files/FUCK-WECHAT.conf /sdcard/Android/

until [[ $(PROCESS) -ne 0 ]]; do
	nohup sh $MODDIR/Run_FUCK_WECHAT.sh &
	sleep 2
done