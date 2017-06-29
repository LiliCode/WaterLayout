//
//  ScaleTransitionAnimation.m
//  UICollectionView_Layout
//
//  Created by LiliEhuu on 17/6/28.
//  Copyright © 2017年 LiliEhuu. All rights reserved.
//

#import "ScaleTransitionAnimation.h"
#import "ShowPhotoViewController.h"


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
    ShowPhotoViewController *toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    UIImageView *imageView = [[UIImageView alloc] initWithImage:toViewController.imageView.image];
    imageView.frame = self.originRect;
    
    toViewController.view.alpha = 0;
    toViewController.imageView.hidden = YES;
    //添加到从container中
    [[transitionContext containerView] addSubview:toViewController.view];
    [[transitionContext containerView] addSubview:imageView];
    
    CGRect finalFrame = toViewController.imageView.frame;
    
    [UIView animateWithDuration:[self transitionDuration:transitionContext] delay:0 usingSpringWithDamping:0.5f initialSpringVelocity:0 options:0 animations:^{
        imageView.frame = finalFrame;
        toViewController.view.alpha = 1;
    } completion:^(BOOL finished) {
        [imageView removeFromSuperview];
        toViewController.imageView.hidden = NO;
        [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
        NSLog(@"complete transition");
    }];
}

- (void)hideTransitionAnimation:(id<UIViewControllerContextTransitioning>)transitionContext
{
    ShowPhotoViewController *fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    
    UIView *toView = [transitionContext viewForKey:UITransitionContextToViewKey];
    UIImageView *imageView = [[UIImageView alloc] initWithImage:fromViewController.imageView.image];
    imageView.frame = fromViewController.imageView.frame;
    //添加到从container中
    [[transitionContext containerView] addSubview:toView];
    [[transitionContext containerView] addSubview:imageView];
    
    [UIView animateWithDuration:.3 animations:^{
        imageView.frame = self.originRect;
    } completion:^(BOOL finished) {
        [imageView removeFromSuperview];    //删除辅助视图
        [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
        NSLog(@"complete transition");
    }];
}



@end




