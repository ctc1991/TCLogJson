//
//  GetJson.m
//  TCLogJsonDemo
//
//  Created by ctc on 15/11/19.
//  Copyright © 2015年 ctc. All rights reserved.
//

#import "GetJson.h"

@implementation GetJson

+ (NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString {
    if (jsonString == nil) {
        return nil;
    }
    
    NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    NSError *err;
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData
                                                        options:NSJSONReadingMutableContainers
                                                          error:&err];
    if(err) {
//        NSLog(@"json解析失败：%@",err);
        return nil;
    }
    return dic;
}

@end
