//
//  MoveTransitionAnimation.m
//  UICollectionView_Layout
//
//  Created by LiliEhuu on 17/6/29.
//  Copyright © 2017年 LiliEhuu. All rights reserved.
//

#import "MoveTransitionAnimation.h"
#import "DetailViewController.h"

@implementation MoveTransitionAnimation

- (void)showTransitionAnimation:(id<UIViewControllerContextTransitioning>)transitionContext
{
    DetailViewController *toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    CGRect originRect = [[self valueForKey:@"_originRect"] CGRectValue];
    
    UIImageView *logoView = [[UIImageView alloc] initWithImage:toViewController.image];
    
    logoView.frame = originRect;
    
    [[transitionContext containerView] addSubview:toViewController.view];
    [[transitionContext containerView] addSubview:logoView];
    
    toViewController.textView.hidden = YES;
    toViewController.logoImageView.hidden = YES;
    toViewController.view.alpha = 0;
    
    [UIView animateWithDuration:.3 animations:^{
        CGRect frame = toViewController.logoImageView.frame;
        logoView.frame = CGRectMake([UIScreen mainScreen].bounds.size.width/2.0f - frame.size.width/2.0f, frame.origin.y, frame.size.width, frame.size.height);
        toViewController.view.alpha = 1;
    } completion:^(BOOL finished) {
        [logoView removeFromSuperview];
        toViewController.textView.hidden = NO;
        toViewController.logoImageView.hidden = NO;
        [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
    }];
}

- (void)hideTransitionAnimation:(id<UIViewControllerContextTransitioning>)transitionContext
{
    
}



@end
