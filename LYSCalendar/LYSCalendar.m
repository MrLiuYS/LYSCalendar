//
//  LYSCalendarView.m
//  LYSCalendar
//
//  Created by 刘永生 on 2017/1/4.
//  Copyright © 2017年 刘永生. All rights reserved.
//


#import "LYSCalendarHeader.h"

@implementation LYSCalendar

- (void)lys_reloadCalendar {
    
    
    
    
}


/**
 当前月份是否可以滑动切换
 */
- (BOOL)lys_CalendarPanGesture {
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(lys_CalendarPanGesture:)]) {
        return [self.delegate lys_CalendarPanGesture:self];
    }
    
    return YES;
}

#pragma mark - headerView
/**
 自定义修改头部视图
 */
- (void)lys_CalendarHeaderView:(LYSCalendarHeaderView *)headerView{
    
}
/**
 获取header的年份的高度:默认40
 */
- (CGFloat)lys_CalendarHeaderYearViewHeight{
    if (self.delegate && [self.delegate respondsToSelector:@selector(lys_CalendarHeaderYearViewHeight)]) {
        return [self.delegate lys_CalendarHeaderYearViewHeight];
    }
    
    return 40;
}

/**
 自定义头部年份数据
 */
- (void)lys_CalendarHeaderYearView:(LYSCalendarHeaderYearView *)yearView{
    if (self.delegate && [self.delegate respondsToSelector:@selector(lys_CalendarHeaderYearView:)]) {
        return [self.delegate lys_CalendarHeaderYearView:yearView];
    }
    //TODO<MrLYS>: 自定义头部年份数据
}

/**
 获取header的周标题的高度:默认:20;
 */
- (CGFloat)lys_CalendarHeaderWeekViewHeight{
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(lys_CalendarHeaderWeekViewHeight)]) {
        return [self.delegate lys_CalendarHeaderWeekViewHeight];
    }
    
    return 20;
}

/**
 自定义头部周的视图
 */
- (void)lys_CalendarHeaderWeekView:(LYSCalendarHeaderWeekView *)weekView{
    if (self.delegate && [self.delegate respondsToSelector:@selector(lys_CalendarHeaderWeekView:)]) {
        return [self.delegate lys_CalendarHeaderWeekView:weekView];
    }
    //TODO<MrLYS>: 自定义头部周的视图
    [weekView updateWeekTitleArray:@[@"日",@"一",@"二",@"三",@"四",@"五",@"六"]];
}


#pragma mark - bodyView

/**
 "天" 高度:默认:50
 */
- (CGFloat)lys_CalendarBodyDayViewHeight{
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(lys_CalendarBodyDayViewHeight)]) {
        return [self.delegate lys_CalendarBodyDayViewHeight];
    }
    return 50;
}

/**
 遍历日历控件的 月 , 周, 天
 */
- (void)lys_Calendar:(LYSCalendar *)calendar
          monthView:(LYSCalendarMonthView *)monthView
           weekView:(LYSCalendarWeekView *)weekView
            dayView:(LYSCalendarDayView *)dayView
            dayDate:(LYSCalendarDayView *)dayDate{
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(lys_Calendar:monthView:weekView:dayView:dayDate:)]) {
        return [self.delegate lys_Calendar:self
                                monthView:monthView
                                 weekView:weekView
                                  dayView:dayView
                                  dayDate:dayDate];
    }
    //TODO<MrLYS>:  遍历日历控件的 月 , 周, 天
}


#pragma mark - lastView


/**
 底部视图的高度:没有配置.默认0;
 */
- (CGFloat)lys_CalendarLastViewHeight{
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(lys_CalendarLastViewHeight)]) {
        return [self.delegate lys_CalendarLastViewHeight];
    }
    return 0;
    
}


/**
 自定义底部视图
 */
- (void)lys_CalendarLastView:(LYSCalendarLastView *)lastView{
    if (self.delegate && [self.delegate respondsToSelector:@selector(lys_CalendarLastView:)]) {
        return [self.delegate lys_CalendarLastView:lastView];
    }
    //TODO<MrLYS>: 自定义底部视图
    
}


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
        make.height.mas_equalTo([self lys_CalendarHeaderYearViewHeight] +
                                [self lys_CalendarHeaderWeekViewHeight]);
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
        make.height.mas_equalTo([self lys_CalendarLastViewHeight]);
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
        _headerView = [[LYSCalendarHeaderView alloc] initCalendar:self];
        
    }
    return _headerView;
}
- (LYSCalendarBodyView *)bodyView {
    
    if(!_bodyView) {
        _bodyView = [[LYSCalendarBodyView alloc] initCalendar:self];
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
