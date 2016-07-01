//
//  UtilHelper.m
//  Funnco
//
//  Created by Ryoma Echizen on 16/5/10.
//  Copyright © 2016年 com.funnco. All rights reserved.
//

#import "UtilManager.h"

@implementation UtilManager

#pragma mark 获取颜色值
//根据颜色值获取颜色

+ (UIColor *)colorOfHex:(int)value{
    float red   = ((value & 0xFF0000) >> 16) / 255.0;
    float green = ((value & 0xFF00) >> 8) / 255.0;
    float blue  = (value & 0xFF) / 255.0;
    return [UIColor colorWithRed:red green:green blue:blue alpha:1.0];
}

#pragma mark 消息弹框提示
//消息弹框提示
+(void)showMsgHudIn:(UIView *)view title:(NSString *)title type:(HudType)type{
}

#pragma mark 字符串判断
//检查字符串是否为空,stringDes字符串描述
+(BOOL)checkStringisNil:(NSString *)string stringDes:(NSString *)stringDes showMsgIn:(UIView *)view{
    BOOL isStringNotNil = YES;
    //去除头尾空格
    if(string!= nil){
        string =  [string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    }
    if ([string isEqualToString:@""]||string == nil) {
        [self showMsgHudIn:view title:stringDes type:HudType_Error];
        isStringNotNil = NO;
    }
    return isStringNotNil;
}
//检查电话号码合理度
+(BOOL)checkTelePhone:(NSString *)telePhone showMsgIn:(UIView *)view{
    //手机号以13,15,18,17,14开头，八个 \d 数字字符
    NSString *phoneRegex = @"^((13[0-9])|(15[^4,\\D])|(18[0,0-9])|(17[0-9])|(14[0-9]))\\d{8}$";
    NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",phoneRegex];
    BOOL isValidate = YES;
    //去除空格
    telePhone = [telePhone stringByReplacingOccurrencesOfString:@" " withString:@""];
    if(![phoneTest evaluateWithObject:telePhone]){
        [self showMsgHudIn:view title:@"电话号码格式不正确" type:HudType_Error];
        isValidate = NO;
    }
    return isValidate;
}

#define minPassLength 6
#define maxPassLength 16
//检查密码长度是否合理
+(BOOL)checkPasswordLength:(NSString *)password showMsgIn:(UIView *)view{
    BOOL isValidate = YES;
    if(password.length<minPassLength || password.length>maxPassLength){
        [self showMsgHudIn:view title:[NSString stringWithFormat:@"请输入%d-%d位密码",minPassLength,maxPassLength] type:HudType_Error];
        isValidate = NO;
    }
    return isValidate;
}

@end
