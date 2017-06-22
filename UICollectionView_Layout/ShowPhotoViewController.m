//
//  ShowPhotoViewController.m
//  UICollectionView_Layout
//
//  Created by LiliEhuu on 17/6/21.
//  Copyright © 2017年 LiliEhuu. All rights reserved.
//

#import "ShowPhotoViewController.h"

@interface ShowPhotoViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ShowPhotoViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.imageView.image = self.image;
    
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
}


@end
