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
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ShowPhotoViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.imageView.image = self.image;
    
    
}


- (IBAction)back:(UIBarButtonItem *)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
}


@end
