//
//  AlertTransitionAnimation.m
//  UICollectionView_Layout
//
//  Created by LiliEhuu on 17/6/30.
//  Copyright © 2017年 LiliEhuu. All rights reserved.
//

#import "AlertTransitionAnimation.h"

@implementation AlertTransitionAnimation

- (void)showTransitionAnimation:(id<UIViewControllerContextTransitioning>)transitionContext
{
    UIViewController *toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIView *alertView = [toViewController valueForKey:@"_contentView"];
    UIView *backgroundView = [toViewController valueForKey:@"_backgroundView"];
    
    CGPoint center = alertView.center;
    center.y = [UIScreen mainScreen].bounds.size.height + alertView.bounds.size.height / 2.0f;
    alertView.center = center;
    
    toViewController.view.frame = [transitionContext containerView].bounds;
    [[transitionContext containerView] addSubview:toViewController.view];
    
    backgroundView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:.0f];
    
    [UIView animateWithDuration:[self transitionDuration:transitionContext] delay:0 usingSpringWithDamping:.6 initialSpringVelocity:0 options:0 animations:^{
        CGPoint center = alertView.center;
        center.y = [UIScreen mainScreen].bounds.size.height - alertView.bounds.size.height / 2.0f;
        alertView.center = center;
        
        backgroundView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:.6f];
    } completion:^(BOOL finished) {
        [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
    }];
}




@end
