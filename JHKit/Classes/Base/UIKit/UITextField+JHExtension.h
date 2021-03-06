//
//  UITextField+JHExtension.h
//  test
//
//  Created by 中钧科技 on 2021/8/2.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UITextField (JHExtension)
/// 限制输入最大数量  备注：keepDecimalPlacesNumber 不能同时使用
@property (nonatomic, assign) NSInteger jh_inputMaxNumber;
/// 占位符字体大小
@property (nonatomic, strong) UIFont *  jh_placeholderFont;
/// 占位符字体颜色
@property (nonatomic, strong) UIColor * jh_placeholderColor;
/// 禁止输入系统emoji表情
@property (nonatomic, assign) BOOL jh_isBanInputEmoJi;
/// 限制输入内容为整型和小数 备注：jh_inputMaxNumber 不能同时使用
/// @param textField 控件
/// @param range 范围
/// @param string 替换字符串
/// @param decimalNum 小数位数
/// @param integerNum 整数位数
- (BOOL)jh_textField:(UITextField *)textField
shouldChangeCharactersInRange:(NSRange)range
replacementString:(NSString *)string
keepDecimalPlacesNumber:(NSInteger)decimalNum
       integerNumber:(NSInteger)integerNum;
@end

NS_ASSUME_NONNULL_END
