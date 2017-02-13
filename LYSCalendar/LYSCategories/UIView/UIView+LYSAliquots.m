//
//  UIView+LYSAliquots.m
//  LYSCalendar
//
//  Created by 刘永生 on 2017/1/5.
//  Copyright © 2017年 刘永生. All rights reserved.
//

#import "LYSCalendarHeader.h"


#define gConstInsideCenterTag 9876

@implementation UIView (LYSAliquots)


/**
 添加并等分视图 |-LRpadding -|-view0-|-view1-|view2-|-LRpadding-|
 
 @param views 视图
 @param LRpadding 左右间距
 @param viewPadding views内部间距
 @param direction 方向
 */
-(void)lys_AddAndAliquotsViews:(NSArray *)views
                     LRpadding:(CGFloat)LRpadding
                   viewPadding:(CGFloat)viewPadding
                     direction:(LYSViewAliquotsDirection)direction
{
    UIView *lastView;
    for (UIView *view in views) {
        
        if (!view.superview){
            [self addSubview:view];
        }
        
        if (lastView) {
            [view mas_makeConstraints:^(MASConstraintMaker *make) {
                if (direction == LYSViewAliquots_Horizontal) {
                    make.top.bottom.equalTo(self);
                    make.left.equalTo(lastView.mas_right).offset(viewPadding);
                    make.width.equalTo(lastView);
                }else {
                    make.left.right.equalTo(self);
                    make.top.equalTo(lastView.mas_bottom).offset(viewPadding);
                    make.height.equalTo(lastView);
                }
            }];
        }else
        {
            [view mas_makeConstraints:^(MASConstraintMaker *make) {
                if (direction == LYSViewAliquots_Horizontal) {
                    make.left.equalTo(self).offset(LRpadding);
                    make.top.bottom.equalTo(self);
                }else {
                    make.top.equalTo(self).offset(LRpadding);
                    make.left.right.equalTo(self);
                }
            }];
        }
        lastView=view;
    }
    [lastView mas_makeConstraints:^(MASConstraintMaker *make) {
        if (direction == LYSViewAliquots_Horizontal) {
            make.right.equalTo(self).offset(-LRpadding);
        }else {
            make.bottom.equalTo(self).offset(-LRpadding);
        }
    }];
}




-(void)lys_AddAndInsideCenterViews:(NSArray *)views
                       viewPadding:(CGFloat)viewPadding
                         direction:(LYSViewAliquotsDirection)direction
                      centerOffset:(CGFloat)centerOffset
{
    
    UIView * contentView = [self getContentView];
    
    UIView *lastView;
    for (UIView *view in views) {
        
        if (!view.superview){
            [contentView addSubview:view];
        }
        
        if (lastView) {
            [view mas_updateConstraints:^(MASConstraintMaker *make) {
                
                if (direction == LYSViewAliquots_Horizontal) {
                    make.centerY.mas_equalTo(contentView.mas_centerY);
                    make.left.mas_equalTo(lastView.mas_right).offset(viewPadding);
                }else {
                    make.centerX.mas_equalTo(contentView.mas_centerX);
                    make.top.mas_equalTo(lastView.mas_bottom).offset(viewPadding);
                }
            }];
        }else
        {
            [view mas_updateConstraints:^(MASConstraintMaker *make) {
                
                if (direction == LYSViewAliquots_Horizontal) {
                    
                    make.left.equalTo(contentView);
                    make.centerY.mas_equalTo(contentView.mas_centerY);
                    
                }else {
                    
                    make.top.equalTo(contentView);
                    make.centerX.mas_equalTo(contentView.mas_centerX);
                    
                }
            }];
        }
        lastView=view;
    }
    
    [contentView mas_updateConstraints:^(MASConstraintMaker *make){
        
        if (direction == LYSViewAliquots_Horizontal) {
            make.right.mas_equalTo(lastView.mas_right);
            make.centerX.mas_equalTo(self.mas_centerX).offset(centerOffset);
            make.centerY.mas_equalTo(self.mas_centerY);
            make.height.mas_equalTo(self.mas_height);
        }else {
            make.bottom.mas_equalTo(lastView.mas_bottom);
            make.centerX.mas_equalTo(self.mas_centerX);
            make.centerY.mas_equalTo(self.mas_centerY).offset(centerOffset);
            make.width.mas_equalTo(self.mas_width);
        }
    }];
    
}

- (UIView *)getContentView {
    
    UIView * contentView = [self viewWithTag:gConstInsideCenterTag];
    
    if (!contentView) {
        contentView = [[UIView alloc]init];
        contentView.tag = gConstInsideCenterTag;
        contentView.backgroundColor = [UIColor clearColor];
        [self addSubview:contentView];
    }
    
    for (UIView *pView in contentView.subviews) {
        [pView removeFromSuperview];
    }
    
    return contentView;
    
}


@end
