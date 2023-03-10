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
# 自动获取版本号
Get_Version()
{
	cat $MODPATH/module.prop | grep 'version' | grep -v 'versionCode' | cut -d"=" -f2  
}


Print() 
{
	echo "$@"
	sleep 0.08
}
Print	"	声明：	"
Print	"		本模块源于微信的不体面，因此要帮微信体面。	"
Print	"		"
Print	"		由于微信的文件储存非常的糟糕，本人编程水平亦如微信的储存逻辑一般，因此不能保证模块的绝对安全可靠。	"
Print	"		虽然目前没有任何重要资料受到伤害"
Print	"		但是依然提三点建议："
Print	"			1. 备份"
Print	"			2. 备份"
Print	"			3. 还是备份"
Print	"		"
Print	"		建议备份内容为："
Print	"			1. 重要的聊天数据"
Print	"			2. 美好的回忆"
Print	"		当然，本模块提供了反悔（取消安装）的机会"
Print	"		"
Print	"		"
Print	"		(?) 是否开始安装："
Print	"			- 音量键+ ：安装"
Print	"			- 音量建- ：取消"
Print	"		"
if [[ $(get_choose) == 0 ]]; then
	Print	"		"
	Print	"		(✓) 当前版本：" $(Get_Version)
	Print	"		"
	Print	"		(✓) 实现功能："
	Print	"			- 亮屏且微信处于后台时,清理微信文件"
	Print	"			- 对各种莫名其妙的缓存进行整理"
	Print	"			- 清理微信小程序缓存"
	Print	"		"
	Print	"		(!) 可能存在的BUG："
	Print	"			- 由于微信的储存机制非常的傻逼"
	Print	"			- 朋友圈的图片缓存到处都是"
	Print	"			- 可能导致朋友圈图片打不开（概率问题）"
	Print	"		"
	Print	"		(i) 温馨提醒："
	Print	"			- 配置文件位于：模块目录 /file/FUCK-WECHAT.conf，老配置文件目前已经不再使用"
	Print	"			- 为了确保数据安全，最终决定配置文件不应放在一个不安全的目录由用户随意更改。如果您有需要的规则，请提交PR。"
	Print	"			- 编辑文件时请注意，不要将重要目录写进.conf文件，以防出现不必要的麻烦！"
	Print	"			- 如果您发现安装停止，是脚本的选择机制。"
	Print	"			- 请按下音量键+ 安装，或者音量键-退出"
	Print	"		"
	Print	"		(i) 下步打算："
	Print	"			- 增加对于规则的审查机制，防止误杀"
	Print	"			- 完善配置目录，争取做到全覆盖"
	Print '-----------------------------------开始安装-----------------------------------'
	Print	"		"
	Print '为了确保数据安全，最终决定配置文件不应放在一个不安全的目录由用户随意更改。如果您有需要的规则，请提交PR！'
	Print	"		"
	if [[ -d /data/adb/modules/FUCK-WECHAT/files/*/ ]]; then
		Print "检测到存在次数统计信息"
		Print " "
		cp -af /data/adb/modules/FUCK-WECHAT/files/*/ $MODPATH/files/
		Print "已为您自动保存统计信息"
		Print " "
	fi
	Print '-----------------------------------安装结束-----------------------------------'
else
	abort '安装结束，用户取消'
fi
