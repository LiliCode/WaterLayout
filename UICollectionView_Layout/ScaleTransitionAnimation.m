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
    UIViewController *fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    UIView *fromView = [transitionContext viewForKey:UITransitionContextFromViewKey];
    UIView *toView = [transitionContext viewForKey:UITransitionContextToViewKey];
    //添加到从container中
    [[transitionContext containerView] addSubview:toView];
    
    CGRect frame = toView.frame;
    toViewController.view.frame = self.originRect;
    
    [UIView animateWithDuration:[self transitionDuration:transitionContext] delay:0 usingSpringWithDamping:0.7f initialSpringVelocity:0 options:0 animations:^{
        toView.frame = frame;
    } completion:^(BOOL finished) {
        [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
        NSLog(@"complete transition");
    }];
}

- (void)hideTransitionAnimation:(id<UIViewControllerContextTransitioning>)transitionContext
{
    UIViewController *fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    UIView *fromView = [transitionContext viewForKey:UITransitionContextFromViewKey];
    UIView *toView = [transitionContext viewForKey:UITransitionContextToViewKey];
    //添加到从container中
    [[transitionContext containerView] addSubview:fromView];
    
    [UIView animateWithDuration:[self transitionDuration:transitionContext ] delay:0 usingSpringWithDamping:.7 initialSpringVelocity:0 options:0 animations:^{
        fromView.frame = self.originRect;
    } completion:^(BOOL finished) {
        [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
        NSLog(@"complete transition");
    }];
}



@end




