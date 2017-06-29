//
//  ShowPhotoViewController.h
//  UICollectionView_Layout
//
//  Created by LiliEhuu on 17/6/21.
//  Copyright © 2017年 LiliEhuu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ShowPhotoViewController : UIViewController

@property (strong , nonatomic) UIImage *image;

@property (strong , nonatomic) UIImageView *imageView;

@property (assign , nonatomic) CGRect originRect;   // 模态使用

@end
