//
//  ShowPhotoViewController.m
//  UICollectionView_Layout
//
//  Created by LiliEhuu on 17/6/21.
//  Copyright © 2017年 LiliEhuu. All rights reserved.
//

#import "ShowPhotoViewController.h"
#import "UIViewController+Transition.h"
#import "ScaleTransitionAnimation.h"

@interface ShowPhotoViewController ()


@end

@implementation ShowPhotoViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.imageView = [[UIImageView alloc] initWithImage:self.image];
    
    CGSize size = [UIScreen mainScreen].bounds.size;
    
    CGFloat imgScale = self.image.size.width / self.image.size.height;
    
    if (imgScale > 1)
    {
        self.imageView.bounds = CGRectMake(0, 0, size.width, size.width/imgScale);
    }
    else if (imgScale < 1)
    {
        self.imageView.bounds = CGRectMake(0, 0, size.height * imgScale, size.height);
    }
    else if (imgScale == 1.0f)
    {
        self.imageView.bounds = CGRectMake(0, 0, size.width, size.width);
    }
    
    self.imageView.center = self.view.center;
    self.imageView.userInteractionEnabled = YES;
    [self.view addSubview:self.imageView];
    
//    self.view.backgroundColor = [UIColor redColor];
//    self.transitioningDelegate = self;
//    self.modalPresentationStyle = UIModalPresentationCustom;
//    self.presentTransitionAnimation = [ScaleTransitionAnimation transitionWithOriginRect:self.originRect];
//    self.dismissTransitionAnimation = [ScaleTransitionAnimation transitionWithOriginRect:self.originRect];
    
    
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (UIView *)transitionAnimationView
{
    return self.imageView;
}


- (IBAction)back:(UIBarButtonItem *)sender
{
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
}


@end
