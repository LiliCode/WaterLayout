//
//  ViewController.m
//  UICollectionView_Layout
//
//  Created by LiliEhuu on 17/6/21.
//  Copyright © 2017年 LiliEhuu. All rights reserved.
//

#import "ViewController.h"
#import "UIViewController+Transition.h"
#import "AlertViewController.h"
#import "AlertTransitionAnimation.h"
#import "AlertPresentationController.h"



@interface ViewController ()<UIViewControllerTransitioningDelegate>

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
}






- (IBAction)alert:(UIButton *)sender
{
    AlertViewController *alert = [[AlertViewController alloc] init];
//    alert.transitioningDelegate = self;
//    alert.modalTransitionStyle = UIModalPresentationCustom;
    [self presentViewController:alert animated:YES completion:nil];
}


//- (UIPresentationController *)presentationControllerForPresentedViewController:(UIViewController *)presented presentingViewController:(UIViewController *)presenting sourceViewController:(UIViewController *)source
//{
//    return [[AlertPresentationController alloc] initWithPresentedViewController:presented presentingViewController:presenting];
//}




- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
}


@end





