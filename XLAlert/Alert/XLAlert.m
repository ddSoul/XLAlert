//
//  LSTAlert.m
//  DirectorySpecification
//
//  Created by ddSoul on 2017/3/21.
//  Copyright © 2017年 lwsc. All rights reserved.
//  博客地址：https://ddsoul.github.io
//

#import "XLAlert.h"

#define WeakSelf     __weak typeof(self) weakSelf = self;

@interface XLAlert()

@property (nonatomic, assign) NSInteger var_Tag;
//
@property (nonatomic, copy) NSString *var_Title;
@property (nonatomic, copy) NSString *var_Message;
@property (nonatomic, copy) NSString *var_SureButtonTitle;
@property (nonatomic, copy) NSString *var_CancelButtonTitle;
//
@property (nonatomic, strong) UIColor *var_CancelButtonColor;
@property (nonatomic, strong) UIColor *var_SureButtonColor;
//
@property (nonatomic, copy) Surehandler var_SHandler;
@property (nonatomic, copy) Cancelhandler var_CHandler;
//
@property (nonatomic, assign) XLAlertControllerStyle var_Style;
@property (nonatomic, strong) UIViewController *var_ViewController;

@end

@implementation XLAlert

static XLAlert *_instance;

// 类方法命名规范 share类名|default类名|类名
+ (instancetype)shareAlert {
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
- (XLAlert * (^)(NSString *tag)) tag {
    return ^(NSString *tag) {
        WeakSelf;
        weakSelf.var_Tag = [tag integerValue];
        return _instance;
    };
}
- (XLAlert * (^)(XLAlertControllerStyle style)) style {
    return ^(XLAlertControllerStyle style) {
        WeakSelf;
        weakSelf.var_Style= style;
        return _instance;
    };
}
- (XLAlert * (^)(UIViewController *presentViewController)) presentViewController {
    return ^(UIViewController *presentViewController) {
        WeakSelf;
        weakSelf.var_ViewController = presentViewController;
        return _instance;
    };
}
- (XLAlert * (^)(NSString *KTitle)) title {
    return ^(NSString *title) {
        WeakSelf;
        weakSelf.var_Title = title;
        return _instance;
    };
}
- (XLAlert * (^)(NSString *message)) message {
    return ^(NSString *message) {
        WeakSelf;
        weakSelf.var_Message = message;
        return _instance;
    };
}
- (XLAlert * (^)(Surehandler)) suerHandler {
    return ^(Surehandler handler) {
        WeakSelf;
        weakSelf.var_SHandler = handler;
        return _instance;
    };
}
- (XLAlert * (^)(Cancelhandler)) cancelHandler {
    return ^(Cancelhandler handler) {
        WeakSelf;
        weakSelf.var_CHandler = handler;
        return _instance;
    };
}
- (XLAlert * (^)(UIColor *sureButtonColor)) sureButtonColor {
    return ^(UIColor *sureButtonColor) {
        WeakSelf;
        weakSelf.var_SureButtonColor = sureButtonColor;
        return _instance;
    };
}
- (XLAlert * (^)(UIColor *cancleButtonColor)) cancleButtonColor {
    return ^(UIColor *cancleButtonColor) {
        WeakSelf;
        weakSelf.var_CancelButtonColor = cancleButtonColor;
        return _instance;
    };
}
- (XLAlert * (^)(NSString *cancelButtonTitle)) cancelButtonTitle {
    return ^(NSString *cancelButtonTitle) {
        WeakSelf;
        weakSelf.var_CancelButtonTitle = cancelButtonTitle;
        return _instance;
    };
}
- (XLAlert * (^)(NSString *sureButtonTitle)) sureButtonTitle {
    return ^(NSString *sureButtonTitle) {
        WeakSelf;
        weakSelf.var_SureButtonTitle = sureButtonTitle;
        return _instance;
    };
}

- (XLAlert * (^)(void))show {
    WeakSelf;
    return ^{
        UIAlertControllerStyle _alertStyle = (UIAlertControllerStyle )weakSelf.var_Style;
        /** 初始化*/
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:weakSelf.var_Title
                                                                                 message:weakSelf.var_Message
                                                                          preferredStyle:_alertStyle];
        
        /** sure:如果有处理添加*/
        if (weakSelf.var_SHandler) {
            
            NSString *sureTitle = weakSelf.var_SureButtonTitle?weakSelf.var_SureButtonTitle:@"确定";
            UIAlertAction *sureAction = [UIAlertAction actionWithTitle:sureTitle
                                                                 style:UIAlertActionStyleDefault
                                                               handler:weakSelf.var_SHandler];
            
            if (weakSelf.var_SureButtonColor) {
                [sureAction setValue:weakSelf.var_SureButtonColor forKey:@"_titleTextColor"];
            }
            [alertController addAction:sureAction];
        }else {
            UIAlertAction *sureAction = [UIAlertAction actionWithTitle:@"确定"
                                                                 style:UIAlertActionStyleDefault
                                                               handler:^(UIAlertAction *action) {}];
            [alertController addAction:sureAction];
        }
        
        /** cancel:如果有处理添加*/
        if (weakSelf.var_CHandler) {
            
            NSString *cancelTitle = weakSelf.var_CancelButtonTitle?weakSelf.var_CancelButtonTitle:@"取消";
            UIAlertAction *cancleAction = [UIAlertAction actionWithTitle:cancelTitle
                                                                   style:UIAlertActionStyleCancel
                                                                 handler:weakSelf.var_CHandler];
            if (weakSelf.var_CancelButtonColor) {
                [cancleAction setValue:weakSelf.var_CancelButtonColor forKey:@"_titleTextColor"];
            }
            [alertController addAction:cancleAction];
        }
        
        [weakSelf.var_ViewController presentViewController:alertController animated:YES completion:nil];
        
        return _instance;
    };
}

@end


