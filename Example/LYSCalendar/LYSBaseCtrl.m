//
//  LYSBaseCtrl.m
//  LYSCalendar
//
//  Created by 刘永生 on 2017/1/8.
//  Copyright © 2017年 刘永生. All rights reserved.
//

#import "LYSBaseCtrl.h"
#import "UIView+LYS.h"
@interface LYSBaseCtrl ()

@end

@implementation LYSBaseCtrl

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self.view lys_RandomBackgroundColor];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    
    NSLog(@"释放:%@",[self class]);
    
    
}

@end
