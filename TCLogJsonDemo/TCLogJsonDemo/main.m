//
//  main.m
//  TCLogJsonDemo
//
//  Created by ctc on 15/11/19.
//  Copyright © 2015年 ctc. All rights reserved.
//

#import "TCLogJson.h"
#import <Foundation/Foundation.h>


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSURL *URL = [NSURL URLWithString:@"http://v.youku.com/player/getPlayList/VideoIDS/XMTM5MDg3ODYyOA"];
        NSData *data = [NSData dataWithContentsOfURL:URL];
        NSString *string = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        NSLog(@"%@",string);
        
        
    }
    return 0;
}
