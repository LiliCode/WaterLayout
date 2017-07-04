//
//  UIViewController+Transition.h
//  UICollectionView_Layout
//
//  Created by LiliEhuu on 17/6/28.
//  Copyright © 2017年 LiliEhuu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TransitionAnimation.h"


@interface UIViewController (Transition)<UIViewControllerTransitioningDelegate, UINavigationControllerDelegate>

@property (strong , nonatomic) TransitionAnimation *pushTransitionAnimation;
@property (strong , nonatomic) TransitionAnimation *popTransitionAnimation;
@property (strong , nonatomic) TransitionAnimation *presentTransitionAnimation;
@property (strong , nonatomic) TransitionAnimation *dismissTransitionAnimation;
@property (strong , nonatomic) UIPresentationController *presentationController;



@end
