//
//  TestViewController.m
//  LYSCalendar
//
//  Created by 刘永生 on 2017/1/8.
//  Copyright © 2017年 刘永生. All rights reserved.
//

#import "TestViewController.h"

@interface TestViewController ()

@end

@implementation TestViewController

+ (void)pushInViewController:(UIViewController *)aViewController{
    
    
    TestViewController * ctrl = [[TestViewController alloc]init];
    
    [aViewController.navigationController pushViewController:ctrl animated:YES];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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
