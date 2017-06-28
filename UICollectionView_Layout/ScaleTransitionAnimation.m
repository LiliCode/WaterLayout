//
//  ScaleTransitionAnimation.m
//  UICollectionView_Layout
//
//  Created by LiliEhuu on 17/6/28.
//  Copyright © 2017年 LiliEhuu. All rights reserved.
//

#import "ScaleTransitionAnimation.h"


@interface ScaleTransitionAnimation ()
@property (assign , nonatomic) CGRect originRect;

@end

@implementation ScaleTransitionAnimation

+ (instancetype)transitionWithOriginRect:(CGRect)originRect
{
    return [[self alloc] initWithOriginRect:originRect];
}

- (instancetype)initWithOriginRect:(CGRect)originRect
{
    if (self = [super init])
    {
        self.originRect = originRect;
    }
    
    return self;
}


#pragma mark - AnimatedTransitionning

- (void)showTransitionAnimation:(id<UIViewControllerContextTransitioning>)transitionContext
{
//    UIViewController *fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
//    [[transitionContext containerView] addSubview:fromViewController.view];
    [[transitionContext containerView] addSubview:toViewController.view];
    
    CGRect frame = toViewController.view.frame;
    toViewController.view.frame = self.originRect;
    
    [UIView animateWithDuration:[self transitionDuration:transitionContext ] delay:0 usingSpringWithDamping:.7 initialSpringVelocity:0 options:0 animations:^{
        toViewController.view.frame = frame;
    } completion:^(BOOL finished) {
        [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
        NSLog(@"complete transition");
    }];
}

- (void)hideTransitionAnimation:(id<UIViewControllerContextTransitioning>)transitionContext
{
    UIViewController *fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
//    UIViewController *toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
//    [[transitionContext containerView] addSubview:toViewController.view];
    [[transitionContext containerView] addSubview:fromViewController.view];
    
    [UIView animateWithDuration:[self transitionDuration:transitionContext] delay:0 usingSpringWithDamping:.7 initialSpringVelocity:0 options:0 animations:^{
        fromViewController.view.frame = self.originRect;
    } completion:^(BOOL finished) {
        [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
        NSLog(@"complete transition");
    }];
}



@end




