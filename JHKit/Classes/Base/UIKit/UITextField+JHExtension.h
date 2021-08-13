//
//  UITextField+JHExtension.h
//  test
//
//  Created by 中钧科技 on 2021/8/2.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UITextField (JHExtension)
/// 限制输入最大数量
@property (nonatomic, assign) NSInteger jh_inputMaxNumber;
/// 占位符字体大小
@property (nonatomic, strong) UIFont *  jh_placeholderFont;
/// 占位符字体颜色
@property (nonatomic, strong) UIColor * jh_placeholderColor;
/// 禁止输入emoji表情
@property (nonatomic, assign) BOOL jh_isBanInputEmoJi;

@end

NS_ASSUME_NONNULL_END
