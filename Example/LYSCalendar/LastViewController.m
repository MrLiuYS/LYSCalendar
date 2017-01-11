//
//  LastViewController.m
//  LYSCalendar
//
//  Created by 刘永生 on 2017/1/11.
//  Copyright © 2017年 刘永生. All rights reserved.
//

#import "LastViewController.h"


#import "LYSCalendarHeader.h"

@interface LastViewController ()<LYSCalendarDelegate , UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *lastTableView; /**< <#explain#> */

@end

@implementation LastViewController

+ (LastViewController *)pushInViewController:(UIViewController *)viewController {
    
    LastViewController * ctrl  = [[LastViewController alloc]init];
    ctrl.view.backgroundColor = [UIColor whiteColor];
    //    dispatch_async(dispatch_get_main_queue(), ^{
    [viewController.navigationController pushViewController:ctrl animated:YES];
    //    });
    
    
    return ctrl;
}


- (void)viewDidLoad {
    [super viewDidLoad];

    
    LYSCalendar * calendar = [[LYSCalendar alloc]initDelegate:self];
    
    
    calendar.currentMonth = [NSDate date];
    
    
    [self.view addSubview:calendar];
    
    [calendar mas_makeConstraints:^(MASConstraintMaker *make){
        
        make.left.top.mas_equalTo(0);
        make.right.bottom.mas_equalTo(0);
    }];
    
    
    
    [self.lastTableView reloadData];
    
}

- (CGFloat)lys_CalendarLastViewHeight:(LYSCalendar *)calendar {
    
    return 30 * 40;
    
}

- (void)lys_Calendar:(LYSCalendar *)calendar lastView:(LYSCalendarLastView *)lastView {
    
    if (!self.lastTableView.superview) {
        [lastView addSubview:self.lastTableView];
        
        [self.lastTableView mas_makeConstraints:^(MASConstraintMaker *make){
            make.left.top.right.bottom.mas_equalTo(0);
        }];
    }
    
}


#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 30;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 40;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"%ld",(long)indexPath.row];
    
    return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}



- (UITableView *)lastTableView {
    
    if(!_lastTableView) {
        _lastTableView = [[UITableView alloc] init];
        _lastTableView.delegate = self;
        _lastTableView.dataSource = self;
        _lastTableView.scrollEnabled = NO;
    }
    return _lastTableView;
}

@end
