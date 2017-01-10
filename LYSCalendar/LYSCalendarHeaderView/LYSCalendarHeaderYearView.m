//
//  LYSCalendarHeaderYearView.m
//  LYSCalendar
//
//  Created by 刘永生 on 2017/1/4.
//  Copyright © 2017年 刘永生. All rights reserved.
//

#import "LYSCalendarHeader.h"

@implementation LYSCalendarHeaderYearView

- (void)lys_CalendarHeaderYearView:(LYSCalendarHeaderYearView *)yearView date:(NSDate *)date{
 
    [self yearLabel].text = [NSString stringWithFormat:@"%@",date];
    
    
}

- (UILabel *)yearLabel {
    
    UILabel * yearLabel = [self viewWithTag:200];
    if (!yearLabel) {
        yearLabel = [[UILabel alloc]init];
        yearLabel.tag = 200;
        
        [self addSubview:yearLabel];
        
        [yearLabel mas_makeConstraints:^(MASConstraintMaker *make){
            make.top.bottom.mas_equalTo(0);
            make.centerX.mas_equalTo(self.mas_centerX);
        }];
    }
    return yearLabel;
}

- (instancetype)initCalendar:(LYSCalendar *)calendar
{
    self = [super init];
    if (self) {
//        [self initUI];
//        [self initData];
        [self initUICalendar:calendar];
    }
    return self;
}

- (void)initUICalendar:(LYSCalendar *)calendar {
    
    [calendar lys_CalendarHeaderYearView:self];
    
}






- (void)initUI {
    
    
    
    [self makeConstraints];
    
}

- (void)makeConstraints {
//    [self.yearLabel mas_makeConstraints:^(MASConstraintMaker *make){
//        make.top.bottom.mas_equalTo(0);
//        make.centerX.mas_equalTo(self.mas_centerX);
//    }];
//    
//    [self.preMonthBtn mas_makeConstraints:^(MASConstraintMaker *make){
//        
//        make.left.top.bottom.mas_equalTo(0);
//        make.width.mas_equalTo(self.mas_height);
//    }];
//    
//    [self.nextMonthBtn mas_makeConstraints:^(MASConstraintMaker *make){
//        
//        make.right.top.bottom.mas_equalTo(0);
//        make.width.mas_equalTo(self.mas_height);
//    }];
    
}

- (void)initData {
    
    //TODO<MrLYS>: 年份
    self.yearLabel.text = @"年份";
    
}


//- (UILabel *)yearLabel {
//    
//    if(!_yearLabel) {
//        _yearLabel = [[UILabel alloc] init];
//        _yearLabel.font = [UIFont boldSystemFontOfSize:18];
//        _yearLabel.textColor = [UIColor blackColor];
//        
//        
//        
//    }
//    return _yearLabel;
//}
//
//
//- (UIButton *)preMonthBtn {
//    
//    if(!_preMonthBtn) {
//        _preMonthBtn = [[UIButton alloc] init];
//        [_preMonthBtn lys_RandomBackgroundColor];
//        [_preMonthBtn setTitle:@"<" forState:UIControlStateNormal];
//    }
//    return _preMonthBtn;
//}
//- (UIButton *)nextMonthBtn {
//    
//    if(!_nextMonthBtn) {
//        _nextMonthBtn = [[UIButton alloc] init];
//        [_nextMonthBtn lys_RandomBackgroundColor];
//        [_nextMonthBtn setTitle:@">" forState:UIControlStateNormal];
//    }
//    return _nextMonthBtn;
//}


@end
