//
//  LSTAlert.h
//  DirectorySpecification
//
//  Created by ddSoul on 2017/3/21.
//  Copyright © 2017年 lwsc. All rights reserved.
//  博客地址：https://ddsoul.github.io
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

/**
 style枚举
 - XLAlertControllerStyleActionSheet:
 */
typedef NS_ENUM(NSInteger,XLAlertControllerStyle){
    XLAlertControllerStyleActionSheet = 0,//默认Alert
    XLAlertControllerStyleAlert,
};

/**
 alert确认、取消按钮
 @param action 操作
 */
typedef void(^Surehandler)(UIAlertAction *action);
typedef void(^Cancelhandler)(UIAlertAction *action);

@interface XLAlert : NSObject

/**
 * 获取XLAlert对象
 * @return self
 */
+ (instancetype)shareAlert;

/**
 * title:
 * message:
 * leftButtonTitle:
 * rightButtonTitle:
 * lelfColor:
 * rightColor:
 * titsuerHandlerle:
 * cancelHandler:
 */
- (XLAlert * (^)(NSString *title)) title;
- (XLAlert * (^)(NSString *message)) message;
- (XLAlert * (^)(NSString *sureButtonTitle)) sureButtonTitle;
- (XLAlert * (^)(NSString *cancelButtonTitle)) cancelButtonTitle;

- (XLAlert * (^)(UIColor *sureButtonColor)) sureButtonColor;
- (XLAlert * (^)(UIColor *cancleButtonColor)) cancleButtonColor;

- (XLAlert * (^)(Surehandler handler)) suerHandler;
- (XLAlert * (^)(Cancelhandler handler)) cancelHandler;

/**
 * style:样式 0：1
 * presentViewController:需要呈现的VC,不可空
 */
- (XLAlert * (^)(XLAlertControllerStyle style)) style;
- (XLAlert * (^)(UIViewController *presentViewController)) presentViewController;

/**
 * 呈现
 */
- (XLAlert * (^)(void))show;

@end

