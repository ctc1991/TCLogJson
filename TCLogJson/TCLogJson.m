//
//  TCLogJson.m
//
//  Created by ctc on 15/11/19.
//  Copyright © 2015年 ctc. All rights reserved.
//

#import "TCLogJson.h"
@implementation NSString (TCLogJson)

- (NSString *)description {
    NSDictionary *dic = [self dictionaryWithJsonString:self];
    if (dic) {
        return [NSString stringWithFormat:@"%@",dic];
    } else {
        return self;
    }
}

- (NSDictionary *)dictionaryWithJsonString:(NSString * _Nonnull)jsonString {
    NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    NSError *err;
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData
                                                        options:NSJSONReadingMutableContainers
                                                          error:&err];
    if (err) {
        return nil;
    } else {
        return dic;
    }
}

@end

@implementation NSMutableDictionary (TCLogJson)
- (NSString *)descriptionWithLocale:(id)locale
{
    NSString *string = @"\n{\n";
    for (NSInteger index=0; index<self.allKeys.count; index++) {
        NSString *key = self.allKeys[index];
        id value = [self valueForKey:key];
        NSString *keyAndValue;
        if ([value isKindOfClass:[NSArray class]]||[value isKindOfClass:[NSMutableArray class]]) {
            keyAndValue = [NSString stringWithFormat:@"    \"%@\": %@,\n",key,value];
        } else if([value isKindOfClass:[NSMutableDictionary class]]||[value isKindOfClass:[NSDictionary class]]) {
            keyAndValue = [NSString stringWithFormat:@"    \"%@\": %@,\n",key,value];
        } else {
            keyAndValue = [NSString stringWithFormat:@"    \"%@\": \"%@\",\n",key,value];
        }

        string = [string stringByAppendingString:keyAndValue];
    }
    string = [string substringWithRange:NSMakeRange(0, string.length-2)];
    return [string stringByAppendingString:@"\n}"];
}
@end

@implementation NSArray (TCLogJson)
- (NSString *)descriptionWithLocale:(id)locale {
    NSString *string = @"[";
    for (NSInteger index=0; index<self.count; index++) {
        id element = self[index];
        if ([element isKindOfClass:[NSDictionary class]]||[element isKindOfClass:[NSMutableDictionary class]]) {
            string = [string stringByAppendingString:[NSString stringWithFormat:@"%@,",element]];
        } else if ([element isKindOfClass:[NSMutableArray class]]||[element isKindOfClass:[NSArray class]]) {
            string = [string stringByAppendingString:[NSString stringWithFormat:@"%@,",element]];
        } else {
            string = [string stringByAppendingString:[NSString stringWithFormat:@"\"%@\",",element]];
        }
    }
    string = [string substringWithRange:NSMakeRange(0, string.length-1)];
    return [string stringByAppendingString:@"]"];
}
@end



@implementation NSDictionary (TCLogJson)
- (NSString *)descriptionWithLocale:(id)locale
{
    NSString *string = @"\n{\n";
    for (NSInteger index=0; index<self.allKeys.count; index++) {
        NSString *key = self.allKeys[index];
        id value = [self valueForKey:key];
        NSString *keyAndValue;
        if ([value isKindOfClass:[NSArray class]]||[value isKindOfClass:[NSMutableArray class]]) {
            keyAndValue = [NSString stringWithFormat:@"    \"%@\": %@,\n",key,value];
        } else if([value isKindOfClass:[NSMutableDictionary class]]||[value isKindOfClass:[NSDictionary class]]) {
            keyAndValue = [NSString stringWithFormat:@"    \"%@\": %@,\n",key,value];
        } else {
            keyAndValue = [NSString stringWithFormat:@"    \"%@\": \"%@\",\n",key,value];
        }
        
        string = [string stringByAppendingString:keyAndValue];
    }
    string = [string substringWithRange:NSMakeRange(0, string.length-2)];
    return [string stringByAppendingString:@"\n}"];
}
@end

@implementation NSMutableArray (TCLogJson)
- (NSString *)descriptionWithLocale:(id)locale {
    NSString *string = @"[";
    for (NSInteger index=0; index<self.count; index++) {
        id element = self[index];
        if ([element isKindOfClass:[NSDictionary class]]||[element isKindOfClass:[NSMutableDictionary class]]) {
            string = [string stringByAppendingString:[NSString stringWithFormat:@"%@,",element]];
        } else if ([element isKindOfClass:[NSMutableArray class]]||[element isKindOfClass:[NSArray class]]) {
            string = [string stringByAppendingString:[NSString stringWithFormat:@"\%@,",element]];
        } else {
            string = [string stringByAppendingString:[NSString stringWithFormat:@"\"%@\",",element]];
        }
    }
    string = [string substringWithRange:NSMakeRange(0, string.length-1)];
    return [string stringByAppendingString:@"]"];
}
@end