//
//  PhotoCollectionViewCell.m
//  UICollectionView_Layout
//
//  Created by LiliEhuu on 17/6/21.
//  Copyright © 2017年 LiliEhuu. All rights reserved.
//

#import "PhotoCollectionViewCell.h"

@interface PhotoCollectionViewCell ()
@property (weak, nonatomic) IBOutlet UIImageView *imageVIew;

@end

@implementation PhotoCollectionViewCell

- (void)awakeFromNib
{
    [super awakeFromNib];
    
    self.imageVIew.layer.borderColor = [UIColor redColor].CGColor;
    self.imageVIew.layer.borderWidth = 1;
    
}

- (void)setImage:(UIImage *)image
{
    _image = image;
    self.imageVIew.image = image;
}


@end


