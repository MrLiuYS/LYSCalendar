//
//  LYSCalendarView.m
//  LYSCalendar
//
//  Created by 刘永生 on 2017/1/4.
//  Copyright © 2017年 刘永生. All rights reserved.
//


#import "LYSCalendarHeader.h"

@implementation LYSCalendar

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self initData];
        [self initUI];
    }
    return self;
}

- (void)initData {
    
    [self addObserver:self
           forKeyPath:@"currentMonth"
              options:(NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld)
              context:@"currentMonth"];
    
    
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    NSLog(@"old: %@", [change objectForKey:NSKeyValueChangeOldKey]);
    NSLog(@"new: %@", [change objectForKey:NSKeyValueChangeNewKey]);
    NSLog(@"context: %@", context);
}

- (void)initUI {
    
    
    [self addSubview:self.lastView];
    [self addSubview:self.headerView];
    [self addSubview:self.bodyView];
    
    [self makeConstraints];
    
    
    UIPanGestureRecognizer * panGest = [[UIPanGestureRecognizer alloc]initWithTarget:self
                                                                              action:@selector(panGestureRecognizer:)];
    
    panGest.delegate = self;
    [self addGestureRecognizer:panGest];
    
    
    
}

- (void)makeConstraints {
    //TODO<MrLYS>: 布局
    [self.headerView mas_makeConstraints:^(MASConstraintMaker *make){
        make.left.top.right.mas_equalTo(0);
        make.height.mas_equalTo(kLYSCalendarHeaderWeekHeight + kLYSCalendarHeaderYearHeight);
    }];
    
    
//TODO<MrLYS>: 测试
//    [self.bodyView mas_makeConstraints:^(MASConstraintMaker *make){
//        make.width.mas_equalTo (100);
//        make.centerX.mas_equalTo(self.headerView.mas_centerX);
//        make.top.mas_equalTo(self.headerView.mas_bottom);
//        make.height.mas_equalTo(self.bodyView.heightMax);
//    }];

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





- (void)setCurrentMonth:(NSDate *)currentMonth {
    
    _currentMonth = currentMonth;
    
    [self.bodyView updateMonth:currentMonth];
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
        
    }
    return _headerView;
}
- (LYSCalendarBodyView *)bodyView {
    
    if(!_bodyView) {
        _bodyView = [[LYSCalendarBodyView alloc] init];
        _bodyView.calendar = self;
        
    }
    return _bodyView;
}
- (LYSCalendarLastView *)lastView {
    
    if(!_lastView) {
        _lastView = [[LYSCalendarLastView alloc] init];
        _lastView.calendar = self;
        
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
