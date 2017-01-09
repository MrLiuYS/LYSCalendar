//
//  ViewController.m
//  LYSCalendar
//
//  Created by 刘永生 on 2017/1/4.
//  Copyright © 2017年 刘永生. All rights reserved.
//

#import "ViewController.h"


#import "TestViewController.h"

#import "PanViewController.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    

}
- (IBAction)touchPushPanCtrl:(id)sender {
    [PanViewController pushInViewController:self];
    
    
}

- (IBAction)touchPushTestcTRL:(id)sender {
    
    [TestViewController pushInViewController:self];
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
