//
//  NSObject+JHExtension.m
//  SGBProject
//
//  Created by Apple on 2021/8/8.
//  Copyright © 2021 dtx. All rights reserved.
//

#import "NSObject+JHExtension.h"

@implementation NSObject (JHExtension)
/**
*  打印属性名
*
*  @param dictionary 模型中属性根据字典的key
*/
+(void)jh_printPropertyName:(NSDictionary*)dictionary
{
    NSMutableString *strM = [NSMutableString string];

        // 遍历字典
        [dictionary enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull propertyName, id  _Nonnull value, BOOL * _Nonnull stop) {
            NSString *code;
            
             NSLog(@"%@",[value class]);
            
            if ([value isKindOfClass:NSClassFromString(@"__NSCFString")]) {
                code = [NSString stringWithFormat:@"@property (nonatomic, copy) NSString *%@;",propertyName];
            }else if ([value isKindOfClass:NSClassFromString(@"__NSCFNumber")]){
                code = [NSString stringWithFormat:@"@property (nonatomic, assign) NSInteger %@;",propertyName];
            }else if ([value isKindOfClass:NSClassFromString(@"__NSCFArray")]){
                code = [NSString stringWithFormat:@"@property (nonatomic, copy) NSArray *%@;",propertyName];
            }else if ([value isKindOfClass:NSClassFromString(@"__NSCFDictionary")]){
                code = [NSString stringWithFormat:@"@property (nonatomic, copy) NSDictionary *%@;",propertyName];
            }else if ([value isKindOfClass:NSClassFromString(@"__NSCFBoolean")]){
                code = [NSString stringWithFormat:@"@property (nonatomic, assign) BOOL %@;",propertyName];
            }else if ([value isKindOfClass:NSClassFromString(@"__NSArray0")]){
                code = [NSString stringWithFormat:@"@property (nonatomic, copy) NSArray *%@;",propertyName];
            }else if ([value isKindOfClass:NSClassFromString(@"__NSArrayI")]){
                code = [NSString stringWithFormat:@"@property (nonatomic, copy) NSArray *%@;",propertyName];
            }else if ([value isKindOfClass:NSClassFromString(@"NSTaggedPointerString")]){
                code = [NSString stringWithFormat:@"@property (nonatomic, copy) NSString *%@;",propertyName];
            }
            [strM appendFormat:@"\n%@\n",code];
            
           
            
        }];
        
         NSLog(@"%@",strM);
}
@end
