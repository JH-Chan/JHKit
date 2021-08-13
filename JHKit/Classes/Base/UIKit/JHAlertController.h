//
//  JHAlertController.h
//  SGBProject
//
//  Created by 中钧科技 on 2021/8/12.
//  Copyright © 2021 dtx. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@interface JHAlertAction : UIAlertAction
@property (nonatomic,strong)UIColor * jh_textColor;
@end
@interface JHAlertController : UIAlertController
/**< 统一按钮样式 不写系统默认的蓝色 */
@property (nonatomic,strong) UIColor *jh_tintColor;
/**< 标题的颜色 */
@property (nonatomic,strong) UIColor *jh_titleColor;
/**< 信息的颜色 */
@property (nonatomic,strong) UIColor *jh_messageColor;
/**< 标题字体 */
@property (nonatomic,strong) UIFont * jh_titleFont;
/**< 信息字体 */
@property (nonatomic,strong) UIFont  * jh_messageFont;
@end

NS_ASSUME_NONNULL_END
