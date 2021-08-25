//
//  NSObject+JHExtension.h
//  SGBProject
//
//  Created by Apple on 2021/8/8.
//  Copyright © 2021 dtx. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (JHExtension)
/**
*  打印属性名
*
*  @param dictionary 模型中属性根据字典的key
*/
+(void)jh_printPropertyName:(NSDictionary*)dictionary;
@end

NS_ASSUME_NONNULL_END
