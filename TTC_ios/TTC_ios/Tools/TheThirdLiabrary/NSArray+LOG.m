//
//  NSArray+LOG.m
//  TZ
//
//  Created by 天智 on 16/4/25.
//  Copyright © 2016年 天智. All rights reserved.
//

#import "NSArray+LOG.h"

@implementation NSArray (LOG)
//- (NSString *)descriptionWithLocale:(id)locale
//{
//    // 1.定义一个可变的字符串, 保存拼接结果
//    NSMutableString *strM = [NSMutableString string];
//    [strM appendString:@"(\n"];
//    // 2.迭代字典中所有的key/value, 将这些值拼接到字符串中
//    [self enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
//        [strM appendFormat:@"\t%@,\n", obj];
//    }];
//    [strM appendString:@")\n"];
//
//    // 删除最后一个逗号
//    if (self.count > 0) {
//        NSRange range = [strM rangeOfString:@"," options:NSBackwardsSearch];
//        [strM deleteCharactersInRange:range];
//    }
//
//    // 3.返回拼接好的字符串
//    return strM;
//}
- (NSString *)descriptionWithLocale:(id)locale
{
    NSString *string;
    @try {
        string = [[NSString alloc] initWithData:[NSJSONSerialization dataWithJSONObject:self options:NSJSONWritingPrettyPrinted error:nil] encoding:NSUTF8StringEncoding];
    } @catch (NSException *exception) {
        NSString *reason = [NSString stringWithFormat:@"reason:%@",exception.reason];
        string = [NSString stringWithFormat:@"转换失败:/n%@,/n转换终止,输出如下:/n%@",reason,self.description];
    } @finally {
    }
    return string;
}
@end
