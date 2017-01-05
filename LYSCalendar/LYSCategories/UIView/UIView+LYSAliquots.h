//
//  UIView+LYSAliquots.h
//  LYSCalendar
//
//  Created by 刘永生 on 2017/1/5.
//  Copyright © 2017年 刘永生. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum
{
    LYSViewAliquots_Horizontal = 0,
    LYSViewAliquots_Vertical
}
LYSViewAliquotsDirection;

@interface UIView (LYSAliquots)


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
                     direction:(LYSViewAliquotsDirection)direction;



/**
 添加. 并居中对齐
 
 @param centerOffset 中心点偏移量
 */
-(void)lys_AddAndInsideCenterViews:(NSArray *)views
                       viewPadding:(CGFloat)viewPadding
                         direction:(LYSViewAliquotsDirection)direction
                      centerOffset:(CGFloat)centerOffset;

@end
