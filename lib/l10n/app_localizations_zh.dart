// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Chinese (`zh`).
class AppLocalizationsZh extends AppLocalizations {
  AppLocalizationsZh([String locale = 'zh']) : super(locale);

  @override
  String get language => '中文';

  @override
  String get hello => '你好！';

  @override
  String get editProfile => '编辑资料';

  @override
  String get languageSettings => '语言设置';

  @override
  String get myProfile => '个人资料';

  @override
  String get yourMedals => '你的勋章';

  @override
  String get animalLover => '动物爱好者';

  @override
  String get animalLoverDesc => '在宠物屋中拥有 5 只宠物。';

  @override
  String get drinker => '饮水达人';

  @override
  String get drinkerDesc => '连续 7 天每天饮水 1000 毫升';

  @override
  String get energetic => '充满活力';

  @override
  String get energeticDesc => '连续 7 天每天锻炼 30 分钟';

  @override
  String get newStart => '新的开始';

  @override
  String get newStartDesc => '这是一个新的开始！';

  @override
  String get bio => '个性签名';

  @override
  String get chooseProfilePicture => '选择头像';

  @override
  String get camera => '相机';

  @override
  String get gallery => '相册';

  @override
  String get settings => '设置';

  @override
  String get passwordSettings => '密码设置';

  @override
  String get notification => '通知设置';

  @override
  String get helpSupport => '帮助与支持';

  @override
  String get logout => '退出登录';

  @override
  String get english => '英文';

  @override
  String get chineseSimplified => '简体中文';

  @override
  String get fullName => '昵称';

  @override
  String get cancel => '取消';

  @override
  String get save => '保存';

  @override
  String get editWeights => '编辑体重';

  @override
  String get initialWeight => '初始体重';

  @override
  String get currentWeight => '当前体重';

  @override
  String get targetWeight => '目标体重';

  @override
  String goalWeight(Object weight) {
    return '目标体重\n$weight公斤';
  }

  @override
  String currentWeightValue(Object weight) {
    return '$weight公斤';
  }

  @override
  String get ok => '确定';

  @override
  String get addWaterIntake => '添加饮水量';

  @override
  String get amount => '数量';

  @override
  String get mlUnit => '毫升';

  @override
  String get clearWaterIntakeTitle => '清除饮水记录';

  @override
  String get clearWaterIntakeContent => '您确定要清除饮水记录吗？';

  @override
  String get myLog => '我的记录';

  @override
  String get myCalendar => '我的日历';

  @override
  String firstWeight(Object weight) {
    return '初始体重\n$weight公斤';
  }

  @override
  String get dailyExercise => '日常锻炼';

  @override
  String activityCalories(Object value) {
    return '活动消耗：$value 千卡';
  }

  @override
  String activityHours(Object value) {
    return '活动时长：$value 小时';
  }

  @override
  String get start => '开始';

  @override
  String get todayWaterTitle => '今日\n饮水量';

  @override
  String get todayStepsTitle => '今日\n步数';

  @override
  String get lostWeight => '减重';

  @override
  String get burnedCalories => '燃烧';

  @override
  String get previousDay => '前一天';

  @override
  String get nextDay => '后一天';

  @override
  String get petHouse => '宠物屋';

  @override
  String get collected => '已收集';

  @override
  String get toCollect => '待收集';

  @override
  String get collectedLabel => '已收集';

  @override
  String get startWorkout => '开始锻炼';

  @override
  String get go => '开始';

  @override
  String get workoutCompleteMessage => '太棒了！\n你刚完成了一次精彩的锻炼。';

  @override
  String get durationLabel => '持续时间（分钟:秒钟）';

  @override
  String get burnLabel => '燃烧（千卡）';

  @override
  String get emptyOops => '哎呀！';

  @override
  String get emptyYeah => '好耶！';

  @override
  String get emptyGotPoints => '获得一个积分！';

  @override
  String get emptyNoNewCard => '这次没有新卡片。';

  @override
  String workoutTodayText(Object count, Object minutes) {
    return '今日锻炼：$count 次 • $minutes 分钟';
  }

  @override
  String get keepGoing => '继续加油！';

  @override
  String get cardSuccessTitle => '太棒了！';

  @override
  String get cardSuccessSubtitle => '你获得了一张全新的卡片！';

  @override
  String cardCollectedStatus(Object current, Object total) {
    return '已收集：$current/$total';
  }

  @override
  String get back => '返回';

  @override
  String get recentWeek => '最近一周';

  @override
  String get calories => '热量';

  @override
  String get water => '饮水量';

  @override
  String get mon => '周一';

  @override
  String get tue => '周二';

  @override
  String get wed => '周三';

  @override
  String get thu => '周四';

  @override
  String get fri => '周五';

  @override
  String get sat => '周六';

  @override
  String get sun => '周日';

  @override
  String get monShort => '一';

  @override
  String get tueShort => '二';

  @override
  String get wedShort => '三';

  @override
  String get thuShort => '四';

  @override
  String get friShort => '五';

  @override
  String get satShort => '六';

  @override
  String get sunShort => '日';

  @override
  String get dailyExerciseTitle => '每日锻炼';

  @override
  String get activityCaloriesLabel => '活动消耗';

  @override
  String get activityHoursLabel => '活动时长';

  @override
  String get hoursSuffix => '小时';

  @override
  String get waterIntakeLabel => '饮水量';

  @override
  String get stepsLabel => '步数';

  @override
  String get waterIntake => '喝水量';

  @override
  String get loginEmailHint => '邮箱 / 账号';

  @override
  String get loginPassword => '密码';

  @override
  String get loginForgotPassword => '忘记密码？';

  @override
  String get loginButton => '登录';

  @override
  String get loginNoAccountText => '没有账号？';

  @override
  String get loginSignUp => '注册';

  @override
  String get loginMissingFieldsMessage => '请输入邮箱和密码';

  @override
  String get resetPasswordTitle => '重设密码';

  @override
  String get signUpTitle => '创建账户';

  @override
  String get commonEmailHint => '邮箱 / 账号';

  @override
  String get commonPasswordHint => '密码';

  @override
  String get resetButton => '重置密码';

  @override
  String get signUpButton => '注册';

  @override
  String get commonMissingFieldsAlert => '请输入邮箱和密码';

  @override
  String get faqTitle => '常见问题';

  @override
  String get resetPasswordQ => '如何重置密码？';

  @override
  String get resetPasswordA => '在登录页面点击“忘记密码”，并按照提示完成重置操作。';

  @override
  String get changeLanguageQ => '如何更改语言？';

  @override
  String get changeLanguageA => '进入 个人资料 > 语言设置 > 选择语言（中文/英语），现在我们只支持中文和英文两种语言';

  @override
  String get earnMedalsQ => '如何获得勋章？';

  @override
  String get earnMedalsA => '每天保持活跃并补充水分！系统会记录你的进度并奖励勋章。';

  @override
  String get getPetsQ => '如何获取宠物？';

  @override
  String get getPetsA => '每次锻炼后会获得星星，使用星星可以在宠物屋中购买宠物。';

  @override
  String get changePhotoQ => '如何更改头像？';

  @override
  String get changePhotoA => '进入 个人资料 > 编辑资料 > 点击头像，可从相册选择或拍照设置头像。';

  @override
  String get contactSupport => '联系我们';

  @override
  String get emailUs => '发送邮件';

  @override
  String get callUs => '电话联系';

  @override
  String get medals => '勋章';

  @override
  String get resetPassword => '重置密码';

  @override
  String get oldPassword => '旧密码';

  @override
  String get newPassword => '新密码';

  @override
  String get confirmPassword => '确认密码';

  @override
  String get passwordResetSuccess => '密码更新成功。';

  @override
  String get passwordResetFail => '密码更新失败。';

  @override
  String get forgotPassword => '忘记密码？';

  @override
  String get fieldRequired => '该字段为必填项。';

  @override
  String get passwordMismatch => '两次输入的密码不一致。';

  @override
  String get confirmed => '确认';

  @override
  String get resetPrompt => '请输入您的邮箱，我们将为您发送密码重置链接。';

  @override
  String get changePassword => '修改密码';

  @override
  String get frequentlyAsked => '常见问题';

  @override
  String yearMonthLabel(Object year, Object month) {
    return '$year年 $month月';
  }

  @override
  String get petBobaDesc => '保持冷静，兄弟';

  @override
  String get petEbiDesc => '千万别在他面前提生鱼片';

  @override
  String get petDjDesc => '他可能也是偶像？';

  @override
  String get petNewHumanDesc => '音游应该很强';

  @override
  String get petRorrrrrrDesc => '喜欢死亡金属！';

  @override
  String get petMsBeckyDesc => '沉入夜色';

  @override
  String get petGuiDesc => '像石头一样坚硬';

  @override
  String get petBananaDesc => '他真的觉得自己是香蕉';

  @override
  String get petNaruhodoDesc => '异议！';

  @override
  String get petGodfatherDesc => '你甚至不叫我教父一声';

  @override
  String get pointNeeded => '所需点数';

  @override
  String get purchase => '购买';

  @override
  String get notEnoughPoints => '点数不足';
}
