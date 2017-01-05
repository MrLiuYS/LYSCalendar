//
//  LYSCalendarDeploy.h
//  LYSCalendar
//
//  Created by 刘永生 on 2017/1/4.
//  Copyright © 2017年 刘永生. All rights reserved.
//
//  配置表
#import <Foundation/Foundation.h>

#import <UIKit/UIKit.h>

typedef enum
{
    /**< 固定6行 */
    LYSCalendarTypeFixedSixRows = 0,
}
LYSCalendarType;

@interface LYSCalendarDeploy : NSObject

//@property (nonatomic, assign) CGFloat headerViewHeight; /**< headerWeekView的高度 */
//@property (nonatomic, assign) CGFloat headerYearViewHeight; /**< headerYearView的高度 */
//@property (nonatomic, assign) CGFloat headerWeekViewHeight; /**< headerWeekView的高度 */
//
//
//@property (nonatomic, assign) CGFloat bodyCellHeight; /**< bodyView的高度 */
//@property (nonatomic, assign) int bodyCellRowInt; /**< body cell 的行数 */
//
//@property (nonatomic, assign) CGFloat bodyViewHeight; /**< bodyView的高度 */
//
//@property (nonatomic, assign) CGFloat lastViewHeight; /**< <#explain#> */

@property (nonatomic, assign) LYSCalendarType calendarType; /**< 展示方式 */


@property (nonatomic, strong) NSDate *today; /**< 当前 */


@end
