//
//  LYSCalendarView.m
//  LYSCalendar
//
//  Created by 刘永生 on 2017/1/4.
//  Copyright © 2017年 刘永生. All rights reserved.
//


#import "LYSCalendarHeader.h"

@implementation LYSCalendar

- (void)dealloc {
    
    [self removeObserver:self
              forKeyPath:@"currentMonth"];
    
}

- (void)lys_reloadCalendar {
    
    [self.headerView lys_reloadHeaderView];
    
    [self.bodyView updateMonth:self.currentMonth];
    
    
    [self.lastView lys_reloadLastView];
    
}

/**
 是否开启动态行数.默认:YES
 */
- (BOOL)lys_CalendarIsAutoRows {
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(lys_CalendarIsAutoRows:)]) {
        return [self.delegate lys_CalendarIsAutoRows:self];
    }
    
    return YES;
    
}

- (BOOL)lys_CalendarPanHorizont{
    if (self.delegate && [self.delegate respondsToSelector:@selector(lys_CalendarPanHorizont:)]) {
        return [self.delegate lys_CalendarPanHorizont:self];
    }
    return YES;
}
- (BOOL)lys_CalendarPanVertical{
    if (self.delegate && [self.delegate respondsToSelector:@selector(lys_CalendarPanVertical:)]) {
        return [self.delegate lys_CalendarPanVertical:self];
    }
    return YES;
}



#pragma mark - headerView
/**
 自定义修改头部视图
 */
- (void)lys_CalendarHeaderView:(LYSCalendarHeaderView *)headerView{
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(lys_Calendar:headerView:)]) {
        return [self.delegate lys_Calendar:self headerView:headerView];
    }
    
}
/**
 获取header的年份的高度:默认40
 */
- (CGFloat)lys_CalendarHeaderYearViewHeight{
    if (self.delegate && [self.delegate respondsToSelector:@selector(lys_CalendarHeaderYearViewHeight:)]) {
        return ceil([self.delegate lys_CalendarHeaderYearViewHeight:self]);
    }
    
    return 40;
}

/**
 自定义头部年份数据
 */
- (void)lys_CalendarHeaderYearView:(LYSCalendarHeaderYearView *)yearView{
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(lys_Calendar:headerYearView:date:)]) {
        return [self.delegate lys_Calendar:self headerYearView:yearView date:self.currentMonth];
    }
    //TODO<MrLYS>: 自定义头部年份数据
    
    [yearView lys_CalendarHeaderYearView:yearView date:self.currentMonth];
    
}

/**
 获取header的周标题的高度:默认:20;
 */
- (CGFloat)lys_CalendarHeaderWeekViewHeight{
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(lys_CalendarHeaderWeekViewHeight:)]) {
        return ceil([self.delegate lys_CalendarHeaderWeekViewHeight:self]);
    }
    
    return 20;
}

/**
 自定义头部周的视图
 */
- (void)lys_CalendarHeaderWeekView:(LYSCalendarHeaderWeekView *)weekView{
    if (self.delegate && [self.delegate respondsToSelector:@selector(lys_Calendar:headerWeekView:date:)]) {
        return [self.delegate lys_Calendar:self headerWeekView:weekView date:self.currentMonth];
    }
    //TODO<MrLYS>: 自定义头部周的视图
    [weekView updateWeekTitleArray:@[@"日",@"一",@"二",@"三",@"四",@"五",@"六"]];
}


#pragma mark - bodyView

- (CGFloat)lys_CalendarBodyHeaderViewHeight{
    if (self.delegate && [self.delegate respondsToSelector:@selector(lys_CalendarBodyHeaderViewHeight:)]) {
        return ceil([self.delegate lys_CalendarBodyHeaderViewHeight:self]);
    }
    return 5;
}
- (UIView *)lys_CalendarBodyHeaderView{
    if (self.delegate && [self.delegate respondsToSelector:@selector(lys_CalendarBodyHeaderView:)]) {
        return [self.delegate lys_CalendarBodyHeaderView:self];
    }
    
    UIView * view = [[UIView alloc] init];
    view.backgroundColor = [UIColor whiteColor];
    return view;
}

- (CGFloat)lys_CalendarBodyFooterViewHeight{
    if (self.delegate && [self.delegate respondsToSelector:@selector(lys_CalendarBodyFooterViewHeight:)]) {
        return ceil([self.delegate lys_CalendarBodyFooterViewHeight:self]);
    }
    return 5;
}
- (UIView *)lys_CalendarBodyFooterView{
    if (self.delegate && [self.delegate respondsToSelector:@selector(lys_CalendarBodyFooterView:)]) {
        return [self.delegate lys_CalendarBodyFooterView:self];
    }
    
    UIView * view = [[UIView alloc] init];
    view.backgroundColor = [UIColor whiteColor];
    return view;
}

- (void)lys_CalendarCurrentPageDidChange {
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(lys_CalendarCurrentPageDidChange:)]) {
        return [self.delegate lys_CalendarCurrentPageDidChange:self];
    }
}

/**
 "天" 高度:默认:50
 */
- (CGFloat)lys_CalendarBodyDayViewHeight{
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(lys_CalendarBodyDayViewHeight:)]) {
        return ceil([self.delegate lys_CalendarBodyDayViewHeight:self]);
    }
    return 50;
}

- (LYSCalendarDayView *)lys_CalendarPreloadingDayView {
    
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(lys_CalendarPreloadingDayView:)]) {
        return [self.delegate lys_CalendarPreloadingDayView:self];
    }
    
    LYSCalendarDayView * dayView = [[LYSCalendarDayView alloc] init];
    return dayView;
    
}

/**
 遍历日历控件的 月 , 周, 天
 */
- (void)lys_CalendarMonthView:(LYSCalendarMonthView *)monthView
                     weekView:(LYSCalendarWeekView *)weekView
                      dayView:(LYSCalendarDayView *)dayView
                   monthStatu:(LYSCalendarMonthStatu)monthStatu{
    
    
    dayView.dayLabel.text = [NSString stringWithFormat:@"%ld",(long)[dayView.currentDate lys_day]];
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(lys_Calendar:monthView:weekView:dayView:monthStatu:)]) {
        return [self.delegate lys_Calendar:self
                                 monthView:monthView
                                  weekView:weekView
                                   dayView:dayView
                                monthStatu:monthStatu];
    }
    //TODO<MrLYS>:  遍历日历控件的 月 , 周, 天
    
}

- (void)lys_CalendarDidSelectMonthView:(LYSCalendarMonthView *)monthView
                              weekView:(LYSCalendarWeekView *)weekView
                               dayView:(LYSCalendarDayView *)dayView {
    
    [self lys_CalendarBeforeSelect];
    
    self.selectDate = dayView.currentDate;
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(lys_Calendar:didSelectMonthView:weekView:dayView:)]) {
        return [self.delegate lys_Calendar:self
                        didSelectMonthView:monthView
                                  weekView:weekView
                                   dayView:dayView];
    }
    //TODO<MrLYS>:  选中的天数
}



- (void)lys_CalendarBeforeSelect{
    
    if (!self.selectDate) {
        return;
    }
    
    LYSCalendarDayView * dayView = [self.bodyView searchDayViewFromDate:self.selectDate];
    
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(lys_Calendar:beforeSelectMonthView:weekView:dayView:)]) {
        return [self.delegate lys_Calendar:self
                     beforeSelectMonthView:(LYSCalendarMonthView *)dayView.superview.superview
                                  weekView:(LYSCalendarWeekView *)dayView.superview
                                   dayView:dayView];
    }
}




#pragma mark - lastView


/**
 底部视图的高度:没有配置.默认0;
 */
- (CGFloat)lys_CalendarLastViewHeight{
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(lys_CalendarLastViewHeight:)]) {
        return ceil([self.delegate lys_CalendarLastViewHeight:self]);
    }
    return 0;
    
}


/**
 自定义底部视图
 */
- (void)lys_CalendarLastView:(LYSCalendarLastView *)lastView{
    if (self.delegate && [self.delegate respondsToSelector:@selector(lys_Calendar:lastView:)]) {
        return [self.delegate lys_Calendar:self lastView:lastView];
    }
    //TODO<MrLYS>: 自定义底部视图
    
}


- (instancetype)initDelegate:(id)delegate
{
    self = [super init];
    if (self) {
        self.delegate = delegate;
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
    //    DLog(@"old: %@", [change objectForKey:NSKeyValueChangeOldKey]);
    //    DLog(@"new: %@", [change objectForKey:NSKeyValueChangeNewKey]);
    
    if ([change objectForKey:NSKeyValueChangeOldKey] != [change objectForKey:NSKeyValueChangeNewKey]) {
        
        [self lys_reloadCalendar];
    }
    
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


@end
