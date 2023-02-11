SKIPUNZIP=0

# 选择功能
get_choose()
{
	local choose
	local branch
	while :; do
		choose="$(getevent -qlc 1 | awk '{ print $3 }')"
		case "$choose" in
		KEY_VOLUMEUP)  branch="0" ;;
		KEY_VOLUMEDOWN)  branch="1" ;;
		*)  continue ;;
		esac
		echo "$branch"
		break
	done
}

Print() 
{
	echo "$@"
	sleep 0.05
}


Print	"	声明：	"
Print	"		本模块源于微信的不体面，因此要帮微信体面。	"
Print	"		"
Print	"		由于微信的文件储存非常的糟糕，本人编程水平亦如微信的储存逻辑一般，因此不能保证模块的绝对安全可靠。	"
Print	"		因此提三点建议："
Print	"			1. 备份"
Print	"			2. 备份"
Print	"			3. 还是备份"
Print	"		"
Print	"		并非全盘备份。当然，本模块提供了反悔的机会，是否继续安装取决于你"
Print	"		建议备份内容为："
Print	"			1. 重要的聊天数据"
Print	"			2. 美好的回忆"
Print	"		"
Print	"		(✓) v0.0.1版本内容："
Print	"			- 实现了从无到有"
Print	"			- 基本覆盖了所有可能藏污纳垢的角落"
Print	"			- 尽可能的体现了作者对微信的爱"
Print	"		"
Print	"		(✓) 实现功能："
Print	"			- 每300秒（5分钟）清理一次微信制造的垃圾"
Print	"			- 对各种莫名其妙的缓存进行整理"
Print	"			- 清理微信小程序缓存"
Print	"		"
Print	"		(i) 温馨提醒："
Print	"			- 配置文件位于：/sdcard/Android/FUCK-WERCHAT.conf"
Print	"			- 可以根据需要，自行编辑配置文件。（不需要重启）"
Print	"			- 编辑文件时请注意，不要将重要目录写进.conf文件，以防出现不必要的麻烦！"
Print	"			- 编辑文件时请注意，不要将重要目录写进.conf文件，以防出现不必要的麻烦！"
Print	"			- 编辑文件时请注意，不要将重要目录写进.conf文件，以防出现不必要的麻烦！"
Print	"		"
Print	"		(i) 下步打算："
Print	"			- 增加对于规则的审查机制，防止误杀"
Print	"			- 完善配置目录，争取做到全覆盖"
Print	"			- 编不下去了，就这些吧～"
Print	"		"
Print	"		(?) 是否开始安装："
Print	"			- 音量键+ ：安装"
Print	"			- 音量建- ：取消"
Print	"		"
if [[ $(get_choose) == 0 ]]; then
	Print '开始安装'
	# 判断是否存在配置文件
	if [[ -f /sdcard/Android/FUCK-WECHAT.conf ]]; then
		# 创建备份文件
		cat /sdcard/Android/FUCK-WECHAT.conf > "/sdcard/Android/$(date "+%T")备份-FUCK-WECHAT.conf"
		Print '已备份原配置文件'
		Print '开始替换新文件'
		rm -rf /sdcard/Android/FUCK-WECHAT.conf
		cp -af $MODPATH/files/FUCK-WECHAT.conf /sdcard/Android/
	else
		Print "创建规则文件至/sdcard/Android/FUCK-WECHAT.conf"
		cp -af $MODPATH/files/FUCK-WECHAT.conf /sdcard/Android/
		Print " "
	fi
else
	abort '取消安装'
fi
