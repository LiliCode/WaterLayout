//
//  DetailViewController.h
//  UICollectionView_Layout
//
//  Created by LiliEhuu on 17/6/29.
//  Copyright © 2017年 LiliEhuu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (strong , nonatomic) UIImage *image;

@property (weak, nonatomic) IBOutlet UIImageView *logoImageView;
@property (weak, nonatomic) IBOutlet UITextView *textView;



@end
