//
//  XMGTopWindowViewController.m
//  备课-百思不得姐
//
//  Created by MJ Lee on 15/9/22.
//  Copyright © 2015年 小码哥. All rights reserved.
//

#import "XMGTopWindowViewController.h"

@interface XMGTopWindowViewController ()

@end

@implementation XMGTopWindowViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor clearColor];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    // 取出所有的window
    NSArray *windows = [UIApplication sharedApplication].windows;
    
    // 遍历程序中的所有控件
    for (UIWindow *window in windows) {
        [self searchSubviews:window];
    }
}

/**
 * 搜索superview内部的所有子控件
 */
- (void)searchSubviews:(UIView *)superview
{
    for (UIScrollView *scrollView in superview.subviews) {
        [self searchSubviews:scrollView];
        
        // 判断是否为scrollView
        if (![scrollView isKindOfClass:[UIScrollView class]]) continue;
        
        // 计算出scrollView在window坐标系上的矩形框
        CGRect scrollViewRect = [scrollView convertRect:scrollView.bounds toView:scrollView.window];
        CGRect windowRect = scrollView.window.bounds;
        // 判断scrollView的边框是否和window的边框交叉
        if (!CGRectIntersectsRect(scrollViewRect, windowRect)) continue;
        
        // 让scrollView滚动到最前面
        CGPoint offset = scrollView.contentOffset;
        // 偏移量不一定是0
        offset.y = - scrollView.contentInset.top;
        [scrollView setContentOffset:offset animated:YES];
    }
}

- (BOOL)prefersStatusBarHidden
{
    return NO;
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleDefault;
}

@end
