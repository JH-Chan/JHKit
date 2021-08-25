//
//  NSString+JHExtension.h
//  test
//
//  Created by 中钧科技 on 2021/8/11.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (JHExtension)
//判断是否含有表情符号 yes-有 no-没有
+ (BOOL)jh_stringContainsEmoji:(NSString *)string;
//是否是系统自带九宫格输入 yes-是 no-不是
+ (BOOL)jh_isNineKeyBoard:(NSString *)string;
//判断第三方键盘中的表情
+ (BOOL)jh_hasEmoji:(NSString*)string;
//去除表情
+ (NSString *)jh_disableEmoji:(NSString *)text;
@end

NS_ASSUME_NONNULL_END
