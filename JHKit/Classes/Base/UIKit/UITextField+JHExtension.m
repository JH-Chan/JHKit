//
//  UITextField+JHExtension.m
//  test
//
//  Created by 中钧科技 on 2021/8/2.
//
#import "UITextField+JHExtension.h"
#import "NSString+JHExtension.h"
#import <objc/runtime.h>
static NSString * const UITextFieldMaxNumberKey = @"UITextFieldTextDidChangeNotification";
static NSString * const UITextFieldPlaceholderFontKey = @"UITextFieldPlaceholderFontKey";
static NSString * const UITextFieldPlaceholderColorKey = @"UITextFieldPlaceholderColorKey";
static NSString * const UITextFieldEMoJiKey = @"UITextFieldEMoJiKey";
static NSString * const UITextFieldNotificationKey = @"UITextFieldTextDidChangeNotification";

@implementation UITextField (JHExtension)
@dynamic jh_isBanInputEmoJi;
#pragma mark - getter
-(NSInteger)jh_inputMaxNumber
{
    NSInteger maxNum = [objc_getAssociatedObject(self,&UITextFieldMaxNumberKey) integerValue];
    return maxNum;
}
-(UIFont *)jh_placeholderFont
{
    return objc_getAssociatedObject(self, &UITextFieldPlaceholderFontKey);
}
- (UIColor *)jh_placeholderColor
{
    return objc_getAssociatedObject(self, &UITextFieldPlaceholderColorKey);
}
-(BOOL)isJh_isBanInputEmoJi
{
    return [objc_getAssociatedObject(self,&UITextFieldEMoJiKey) boolValue];
}
#pragma mark - setter
-(void)setJh_inputMaxNumber:(NSInteger)jh_inputMaxNumber
{
    objc_setAssociatedObject(self,
                             &UITextFieldMaxNumberKey,
                             @(jh_inputMaxNumber),
                             OBJC_ASSOCIATION_ASSIGN);
    if (jh_inputMaxNumber > 0) {
        [self addTarget:self
                 action:@selector(textFieldTextChanged:)
       forControlEvents:UIControlEventEditingChanged];
    }
}
- (void)setJh_placeholderFont:(UIFont *)jh_placeholderFont
{
    objc_setAssociatedObject(self, &UITextFieldPlaceholderFontKey, jh_placeholderFont, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    NSString *placeHolder = self.placeholder;
    if (placeHolder.length == 0) {
        placeHolder = @" ";
    }
    NSMutableAttributedString *placeholderString = [[NSMutableAttributedString alloc] initWithString:placeHolder attributes:@{NSFontAttributeName : jh_placeholderFont}];
    self.attributedPlaceholder = placeholderString;
}
- (void)setJh_placeholderColor:(UIColor *)jh_placeholderColor
{
    objc_setAssociatedObject(self, &UITextFieldPlaceholderColorKey, jh_placeholderColor, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    NSString *placeHolder = self.placeholder;
    if (placeHolder.length == 0) {
        placeHolder = @" ";
    }
    NSMutableAttributedString *placeholderString = [[NSMutableAttributedString alloc] initWithString:placeHolder attributes:@{NSForegroundColorAttributeName : jh_placeholderColor}];
    self.attributedPlaceholder = placeholderString;
}
-(void)setJh_isBanInputEmoJi:(BOOL)jh_isBanInputEmoJi
{
    objc_setAssociatedObject(self, &UITextFieldEMoJiKey, @(jh_isBanInputEmoJi), OBJC_ASSOCIATION_ASSIGN);
    if (jh_isBanInputEmoJi) {
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(textFieldDidChanged:)
                                                     name:UITextFieldNotificationKey
                                                   object:self];
    }
}
#pragma mark - action
-(void)textFieldTextChanged:(UITextField*)textField
{
    NSString *toBeString = textField.text;
    // 键盘输入模式
    NSString *lang = [[UIApplication sharedApplication]textInputMode].primaryLanguage;
    if ([lang isEqualToString:@"zh-Hans"]) { // 简体中文输入，包括简体拼音，健体五笔，简体手写
    UITextRange *selectedRange = [textField markedTextRange];
    //获取高亮部分
    UITextPosition *position = [textField positionFromPosition:selectedRange.start offset:0];
    // 没有高亮选择的字，则对已输入的文字进行字数统计和限制 kMaxLength是想要限制的长度值
        if (!position) {
            
          if (toBeString.length > self.jh_inputMaxNumber) {
            textField.text = [toBeString substringToIndex:self.jh_inputMaxNumber];
          }
            
        }else{
            // 有高亮选择的字符串，则暂不对文字进行统计和限制
        }
    }else{
        // 中文输入法以外的直接对其统计限制即可，不考虑其他语种情况
        if (toBeString.length > self.jh_inputMaxNumber) {
            textField.text = [toBeString substringToIndex:self.jh_inputMaxNumber];
        }
  }
}
- (void)textFieldDidChanged:(NSNotification *)obj {
   //过滤表情符
    UITextField * textField = (UITextField*)obj.object;
    NSString * toBeString = textField.text;
    if ([NSString jh_stringContainsEmoji:toBeString] || [NSString jh_hasEmoji:toBeString]) {
        textField.text = [NSString jh_disableEmoji:toBeString];
    }
}
#pragma mark - methods
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
          integerNumber:(NSInteger)integerNum

{
    if ([string isEqualToString:@""]) {
        return YES;
    }
    NSString *temp = @"0123456789.";
    if (![temp containsString:string]) {
        return NO;
    }
    if (textField.text.length == 0 && [string isEqualToString:@"."]) {
        return NO;
    }
    if ([textField.text containsString:@"."]) {
        if ([string isEqualToString:@"."]) {
            return NO;
        }
        NSArray *arr = [textField.text componentsSeparatedByString:@"."];
        if (arr.count != 0) {
            NSRange decimalRange = [textField.text rangeOfString:@"."];
            // 输入在整数部分的
            if (range.location <= decimalRange.location) {
                if ([arr[0] length] >= integerNum) {
                    return NO;
                }
            }else {
                // 输入在小数部分的
                if (arr.count > 1 && [arr[1] length] >= decimalNum) {
                    return NO;
                }
            }
        }
    }else {
        if ([string isEqualToString:@"."]) {
            return YES;
        }
        if (textField.text.length >= integerNum) {
            return NO;
        }
    }
    return YES;
}
#pragma mark - 销毁
-(void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:UITextFieldNotificationKey
                                                  object:nil];
}
@end
