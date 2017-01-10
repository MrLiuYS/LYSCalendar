//
//  PanViewController.m
//  LYSCalendar
//
//  Created by 刘永生 on 2017/1/8.
//  Copyright © 2017年 刘永生. All rights reserved.
//

#import "PanViewController.h"

#import "LYSCalendarHeader.h"

@interface PanViewController ()

@end

@implementation PanViewController

+ (PanViewController *)pushInViewController:(UIViewController *)viewController {
    
    PanViewController * ctrl  = [[PanViewController alloc]init];
    ctrl.view.backgroundColor = [UIColor whiteColor];
//    dispatch_async(dispatch_get_main_queue(), ^{    
        [viewController.navigationController pushViewController:ctrl animated:YES];
//    });
    
    
    return ctrl;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    LYSCalendar * calendar = [[LYSCalendar alloc]init];
    
    calendar.currentMonth = [NSDate date];
    
    calendar.backgroundColor = [UIColor redColor];
    
    [self.view addSubview:calendar];
    
    [calendar mas_makeConstraints:^(MASConstraintMaker *make){
        
        make.left.top.mas_equalTo(10);
        make.right.bottom.mas_equalTo(-10);
    }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
