//
//  UtilHelper.h
//  Funnco
//
//  Created by Ryoma Echizen on 16/5/10.
//  Copyright © 2016年 com.funnco. All rights reserved.
//
//弹框类型
typedef NS_ENUM(char, HudType){
    HudType_Success,         //成功
    HudType_Error            //失败
};

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface UtilManager : NSObject

#pragma mark 获取颜色值
//根据颜色值获取颜色
+ (UIColor *)colorOfHex:(int)value;

#pragma mark 消息弹框提示
//消息弹框提示
+(void)showMsgHudIn:(UIView *)view title:(NSString *)title type:(HudType)type;

#pragma mark 字符串判断
//检查字符串是否为空,stringDes字符串描述
+(BOOL)checkStringisNil:(NSString *)string stringDes:(NSString *)stringDes showMsgIn:(UIView *)view;
//检查电话号码合理度
+(BOOL)checkTelePhone:(NSString *)telePhone  showMsgIn:(UIView *)view;
//检查密码长度是否合理
+(BOOL)checkPasswordLength:(NSString *)password showMsgIn:(UIView *)view;
@end
