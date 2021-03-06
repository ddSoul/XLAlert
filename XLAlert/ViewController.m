//
//  ViewController.m
//  XLAlert
//
//  Created by ddSoul on 2018/1/30.
//  Copyright © 2018年 dxl. All rights reserved.
//

#import "ViewController.h"
#import "XLAlert.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(0, 0, 100, 100);
    button.backgroundColor = [UIColor redColor];
    [button addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)click {
    
//    Surehandler sureHandler = ^(UIAlertAction *action) {
//        NSLog(@"...............你点击了确认");
//    };
//    Cancelhandler cancelhandler = ^(UIAlertAction *action) {
//        NSLog(@"...............你点击了取消");
//    };
    
    XLAlert.shareAlert
    .style(XLAlertControllerStyleAlert)
    .message(@"2222222222")
    .presentViewController(self)
    .show();
    
    XLAlert.shareAlert
    .style(XLAlertControllerStyleAlert)
    .message(@"hello\n world")
    .presentViewController(self)
    .show();
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
