//
//  LYSCalendarView.m
//  LYSCalendar
//
//  Created by 刘永生 on 2017/1/4.
//  Copyright © 2017年 刘永生. All rights reserved.
//


#import "LYSCalendarHeader.h"

@implementation LYSCalendarView

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self initUI];
        [self initData];
    }
    return self;
}

- (void)initUI {
    
    [self addSubview:self.headerView];
    [self addSubview:self.bodyView];
    [self addSubview:self.lastView];
    
    [self makeConstraints];
    
    
    UIPanGestureRecognizer * panGest = [[UIPanGestureRecognizer alloc]initWithTarget:self
                                                                              action:@selector(panGestureRecognizer:)];
    
    [self addGestureRecognizer:panGest];
    
}

- (void)makeConstraints {
        //TODO<MrLYS>: 布局
    [self.headerView mas_makeConstraints:^(MASConstraintMaker *make){
        make.left.top.right.mas_equalTo(0);
        make.height.mas_equalTo(kLYSCalendarHeaderWeekHeight + kLYSCalendarHeaderYearHeight);
    }];
    [self.bodyView mas_makeConstraints:^(MASConstraintMaker *make){
        make.left.right.mas_equalTo(0);
        make.top.mas_equalTo(self.headerView.mas_bottom);
        make.height.mas_equalTo(self.bodyView.heightMax);
    }];
    [self.lastView mas_makeConstraints:^(MASConstraintMaker *make){
        make.left.right.mas_equalTo(0);
        make.top.mas_equalTo(self.bodyView.mas_bottom);
        make.height.mas_equalTo(kLYSCalendarLastHeight);
    }];
    
    
    
    
}

- (void)initData {
    
    
    
    
}



- (void)updateCalendarDeploy {
    
    
    
    
}


- (void)panGestureRecognizer:(UIPanGestureRecognizer *)gesture {
    
    
    [self.bodyView panGestureRecognizer:gesture];
    
    
    
    
    [gesture setTranslation:CGPointMake(0, 0) inView:self];
}


#pragma mark - proprety

- (LYSCalendarHeaderView *)headerView {
    
    if(!_headerView) {
        _headerView = [[LYSCalendarHeaderView alloc] init];
        _headerView.calendar = self;
        _headerView.backgroundColor = [UIColor greenColor];
    }
    return _headerView;
}
- (LYSCalendarBodyView *)bodyView {
    
    if(!_bodyView) {
        _bodyView = [[LYSCalendarBodyView alloc] init];
        _bodyView.calendar = self;
        _bodyView.backgroundColor = [UIColor yellowColor];
    }
    return _bodyView;
}
- (LYSCalendarLastView *)lastView {
    
    if(!_lastView) {
        _lastView = [[LYSCalendarLastView alloc] init];
        _lastView.backgroundColor = [UIColor blueColor];
    }
    return _lastView;
}
- (LYSCalendarDeploy *)calendarDeploy {
    
    if(!_calendarDeploy) {
        _calendarDeploy = [[LYSCalendarDeploy alloc] init];
    }
    return _calendarDeploy;
}


@end
