//
//  main.m
//  OC （串讲）-NSDate
//
//  Created by qingyun on 16/4/15.
//  Copyright © 2016年 QingYun. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSDate *date1=[NSDate date];
        NSLog(@"date1=%@",date1);//GMT
        //默认时区
        NSLog(@"%@",[NSTimeZone defaultTimeZone]);
        //获得所有的时区
        NSLog(@"allZone:%@",[NSTimeZone knownTimeZoneNames]);
        //为了得到现在的北京时间
        NSTimeZone *zone=[NSTimeZone systemTimeZone];//[NSTimeZone localTimeZone]; 获得当前时区
        NSLog(@"zone=%@",zone);
        //获得时间间隔
        NSTimeInterval intaval=[zone secondsFromGMT];
        NSLog(@"ontval=%g",intaval);
        //拿到现在的时间
        NSDate *now=[date1 dateByAddingTimeInterval:intaval];
        NSLog(@"now %@",now);
        //一句代码搞定
        NSLog(@"%@",[[NSDate date] dateByAddingTimeInterval:[[NSTimeZone localTimeZone] secondsFromGMT]]);
        
        //日期格式
        NSDateFormatter *formater=[NSDateFormatter new];
        //分别进行设置
        [formater setDateStyle:(NSDateFormatterFullStyle)];//样式
        [formater setDateFormat:@"yyyy年-MM月-dd日"];//格式
//        [formater setDateFormat:@"yyyy年-MM月-dd日  hh:mm:ss"];
        [formater setTimeStyle:NSDateFormatterMediumStyle];//时间的样式
        NSString *strDate=[formater stringFromDate:[NSDate date]];//设计日期的格式，自动转化为北京时间了！
        NSLog(@"%@",strDate);
    }
    return 0;
}
