//
//  AlertViewController.m
//  UICollectionView_Layout
//
//  Created by LiliEhuu on 17/6/30.
//  Copyright © 2017年 LiliEhuu. All rights reserved.
//


#import "AlertViewController.h"

@interface AlertViewController ()

@end

@implementation AlertViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    CGSize size = [UIScreen mainScreen].bounds.size;
    CGFloat height = 250.0f;
    self.contentView.frame = CGRectMake(0, size.height - height, size.width, height);
    [self.view addSubview:self.contentView];
    self.contentView.backgroundColor = [UIColor yellowColor];
    
//    self.view.backgroundColor = [UIColor whiteColor];
}


- (UIView *)contentView
{
    if (!_contentView)
    {
        _contentView = [[UIView alloc] init];
    }
    
    return _contentView;
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self dismissViewControllerAnimated:YES completion:nil];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
}


@end





