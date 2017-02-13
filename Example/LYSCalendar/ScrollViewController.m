//
//  ScrollViewController.m
//  LYSCalendar
//
//  Created by 刘永生 on 2017/2/13.
//  Copyright © 2017年 刘永生. All rights reserved.
//

#import "ScrollViewController.h"


#import "LYSCalendarHeader.h"

@interface ScrollViewController ()

@property (nonatomic, strong) UIScrollView *bgScrollView; /**< <#explain#> */
@property (nonatomic, strong) UIView *containerView; /**< <#explain#> */
@property (nonatomic, strong) UIView *topImageView; /**< <#explain#> */



@end

@implementation ScrollViewController

+ (void)pushInViewController:(UIViewController *)aViewController {
    
    ScrollViewController * ctrl = [[ScrollViewController alloc]init];
    ctrl.view.backgroundColor = [UIColor whiteColor];
    [aViewController.navigationController pushViewController:ctrl animated:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self initUI];
}

- (void)initUI {
    
    [self.view addSubview:self.bgScrollView];
    
    [self.bgScrollView addSubview:self.containerView];
    
    
    
    [self makeConstraints];
    
}

- (void)makeConstraints {
    
    [self.bgScrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view).with.insets(UIEdgeInsetsMake(0,0,0,0));
    }];
    
    [self.containerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.bgScrollView);
        make.width.equalTo(self.bgScrollView);
    }];
    
    
}

#pragma mark - 滑动代理
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    //    NSLog(@"%lf", scrollView.contentOffset.y);
    CGFloat offsetY = scrollView.contentOffset.y + _bgScrollView.contentInset.top;//注意
    
    float a = 0.0;
    if (offsetY >= 0 && offsetY <= 160) {
        _topImageView.transform = CGAffineTransformMakeScale(1 - offsetY/300, 1 - offsetY/300);
    }
    else if (offsetY > 160) {
        _topImageView.transform = CGAffineTransformMakeScale(0.5, 0.5);
    }else if (offsetY <= 0) {
        a = a - offsetY;
        _topImageView.transform = CGAffineTransformMakeScale(1.0, 1.0);
    }
    
    
//    CGRect frame = _topImageView.frame;
//    frame.origin.y = 2 + a;
//    _topImageView.frame = frame;
//    
//    CGRect frame_2 = _bgView.frame;
//    frame_2.origin.y = 42 + a;
//    _bgView.frame = frame_2;
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    CGFloat offsetY = scrollView.contentOffset.y;
    if (offsetY > 80)
    {
        [_bgScrollView setContentOffset:CGPointMake(0, 160) animated:YES];
    }
    else
    {
        [_bgScrollView setContentOffset:CGPointMake(0, 0) animated:YES];
    }
}


- (UIScrollView *)bgScrollView {
    
    if(!_bgScrollView) {
        _bgScrollView = [[UIScrollView alloc] init];
        
        [_bgScrollView lys_RandomBackgroundColor];
    }
    return _bgScrollView;
}

- (UIView *)containerView {
    
    if(!_containerView) {
        _containerView = [[UIView alloc] init];
    }
    return _containerView;
}
- (UIView *)topImageView {
    
    if(!_topImageView) {
        _topImageView = [[UIView alloc] init];
    }
    return _topImageView;
}




@end
