//
//  LSTAlert.m
//  DirectorySpecification
//
//  Created by ddSoul on 2017/3/21.
//  Copyright © 2017年 lwsc. All rights reserved.
//  博客地址：https://ddsoul.github.io
//

#import "XLAlert.h"

@interface XLAlert() {
    
    @private
    
        NSString *_title;
        NSString *_message;
        NSString *_sureButtonTitle;
        NSString *_cancelButtonTitle;
    
        UIColor *_cancelButtonColor;
        UIColor *_sureButtonColor;
    
        Surehandler _sHandler;
        Cancelhandler _cHandler;
    
        XLAlertControllerStyle _style;
        UIViewController *_viewController;
}
@end;

@implementation XLAlert

static XLAlert *_instance;

// 类方法命名规范 share类名|default类名|类名
+ (instancetype)shareAlert {
    //return _instance;
    return [[self alloc] init];
}
+ (instancetype)allocWithZone:(struct _NSZone *)zone {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (_instance == nil) {
            _instance = [super allocWithZone:zone];
        }
    });
    return _instance;
}
// 为了严谨，也要重写copyWithZone 和 mutableCopyWithZone
- (id)copyWithZone:(NSZone *)zone {
    return _instance;
}
- (id)mutableCopyWithZone:(NSZone *)zone {
    return _instance;
}


/**
 * * * * * * * * * *
 */
- (XLAlert * (^)(XLAlertControllerStyle style)) style {
    return ^(XLAlertControllerStyle style) {
        _style = style;
        return self;
    };
}
- (XLAlert * (^)(UIViewController *presentViewController)) presentViewController {
    return ^(UIViewController *presentViewController) {
        _viewController = presentViewController;
        return self;
    };
}
- (XLAlert * (^)(NSString *KTitle)) title {
    return ^(NSString *title) {
        _title = title;
        return self;
    };
}
- (XLAlert * (^)(NSString *message)) message {
    return ^(NSString *message) {
        _message = message;
        return self;
    };
}
- (XLAlert * (^)(Surehandler)) suerHandler {
    return ^(Surehandler handler) {
        _sHandler = handler;
        return self;
    };
}
- (XLAlert * (^)(Cancelhandler)) cancelHandler {
    return ^(Cancelhandler handler) {
        _cHandler = handler;
        return self;
    };
}
- (XLAlert * (^)(UIColor *sureButtonColor)) sureButtonColor {
    return ^(UIColor *sureButtonColor) {
        _sureButtonColor = sureButtonColor;
        return self;
    };
}
- (XLAlert * (^)(UIColor *cancleButtonColor)) cancleButtonColor {
    return ^(UIColor *cancleButtonColor) {
        _cancelButtonColor = cancleButtonColor;
        return self;
    };
}
- (XLAlert * (^)(NSString *cancelButtonTitle)) cancelButtonTitle {
    return ^(NSString *cancelButtonTitle) {
        _cancelButtonTitle = cancelButtonTitle;
        return self;
    };
}
- (XLAlert * (^)(NSString *sureButtonTitle)) sureButtonTitle {
    return ^(NSString *sureButtonTitle) {
        _sureButtonTitle = sureButtonTitle;
        return self;
    };
}

- (XLAlert * (^)(void))show {
    return ^{
        UIAlertControllerStyle _alertStyle = (UIAlertControllerStyle )_style;
        /** 初始化*/
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:_title
                                                                                 message:_message
                                                                          preferredStyle:_alertStyle];
        
        /** sure:如果有处理添加*/
        if (_sHandler) {
            
            NSString *sureTitle = _sureButtonTitle?_sureButtonTitle:@"确定";
            UIAlertAction *sureAction = [UIAlertAction actionWithTitle:sureTitle
                                                                 style:UIAlertActionStyleDefault
                                                               handler:_sHandler];
            
            if (_sureButtonColor) {
                [sureAction setValue:_sureButtonColor forKey:@"_titleTextColor"];
            }
            [alertController addAction:sureAction];
        }
        
        /** cancel:如果有处理添加*/
        if (_cHandler) {
            
            NSString *cancelTitle = _cancelButtonTitle?_cancelButtonTitle:@"取消";
            UIAlertAction *cancleAction = [UIAlertAction actionWithTitle:cancelTitle
                                                                   style:UIAlertActionStyleCancel
                                                                 handler:_cHandler];
            if (_cancelButtonColor) {
                [cancleAction setValue:_cancelButtonColor forKey:@"_titleTextColor"];
            }
            [alertController addAction:cancleAction];
        }
        
        [_viewController presentViewController:alertController animated:YES completion:nil];
        
        return self;
    };
}

@end


