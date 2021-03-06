//
//  PhotoCollectionViewController.m
//  UICollectionView_Layout
//
//  Created by LiliEhuu on 17/6/21.
//  Copyright © 2017年 LiliEhuu. All rights reserved.
//

#import "PhotoCollectionViewController.h"
#import "PhotoCollectionViewCell.h"
#import "CollectionViewWaterLayout.h"

#import "UIViewController+Transition.h"
#import "ScaleTransitionAnimation.h"
#import "MoveTransitionAnimation.h"

#import "ShowPhotoViewController.h"
#import "DetailViewController.h"



@interface PhotoCollectionViewController ()<CollectionViewWaterLayoutDelegate>
@property (strong , nonatomic) NSMutableArray *list;
@property (assign , nonatomic) BOOL flag;   //点击Cell的展示内容模式

@end

@implementation PhotoCollectionViewController

static NSString * const reuseIdentifier = @"Cell";

- (void)viewDidLoad
{
    [super viewDidLoad];
    
//    [self.collectionView registerClass:[PhotoCollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 2), ^{
        self.list = [[NSMutableArray alloc] init];
        for (NSInteger count = 0; count <= 30; count++)
        {
            NSString *imageName = [NSString stringWithFormat:@"image%ld.jpeg", count];
            [self.list addObject:[UIImage imageNamed:imageName]];
        }
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.collectionView reloadData];
        });
    });
    
    
    self.collectionView.backgroundColor = [UIColor blackColor];
    
    CollectionViewWaterLayout *layout = (CollectionViewWaterLayout *)self.collectionView.collectionViewLayout;
    layout.layoutDelegate = self;
    
//    layout.edgeInsets = UIEdgeInsetsMake(8, 8, 8, 8);
//    layout.minimumInteritemSpacing = 8;
//    layout.minimumLineSpacing = 8;
    
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    self.navigationController.delegate = nil;
    self.pushTransitionAnimation = nil;
    self.popTransitionAnimation = nil;
}

- (IBAction)switchMode:(UISwitch *)sender
{
    self.flag = sender.isOn;
}



#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.list.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    PhotoCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    cell.image = [self.list objectAtIndex:indexPath.row];
    
    return cell;
}

#pragma mark <UICollectionViewDelegate>

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView cellForItemAtIndexPath:indexPath];
    CGRect rect = [cell.superview convertRect:cell.frame toView:self.view]; //坐标转换
    
    if (self.flag)
    {
        //详情
        self.navigationController.delegate = self;
        self.pushTransitionAnimation = [MoveTransitionAnimation transitionWithOriginRect:rect];
        
        [self performSegueWithIdentifier:@"detail" sender:[self.list objectAtIndex:indexPath.row]];
    }
    else
    {
        //查看照片
        self.navigationController.delegate = self;
        self.pushTransitionAnimation = [ScaleTransitionAnimation transitionWithOriginRect:rect];
        self.popTransitionAnimation = [ScaleTransitionAnimation transitionWithOriginRect:rect];
        
        [self performSegueWithIdentifier:@"show" sender:[self.list objectAtIndex:indexPath.row]];
    }

//    ShowPhotoViewController *vc = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"show"];
//    vc.image = [self.list objectAtIndex:indexPath.row];
//    vc.originRect = rect;
//    [self.navigationController pushViewController:vc animated:YES];
//    [self presentViewController:vc animated:YES completion:nil];
}

#pragma mark <PhotoCollectionViewFlowLayout>

- (CGSize)layout:(CollectionViewWaterLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UIImage *image = [self.list objectAtIndex:indexPath.row];
    return CGSizeMake(self.view.bounds.size.width / 2.0f, ((self.view.bounds.size.width / 2.0f) / image.size.width) * image.size.height);
}

- (NSUInteger)layout:(CollectionViewWaterLayout *)layout numberOfColumnsAtIndexPath:(NSIndexPath *)indexPath
{
    return 2;
}


#pragma mark - 内存管理

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"show"])
    {
        ShowPhotoViewController *showPhotoVC = segue.destinationViewController;
        showPhotoVC.image = sender;
    }
    else if ([segue.identifier isEqualToString:@"detail"])
    {
        DetailViewController *detail = [segue destinationViewController];
        detail.image = sender;
    }
}



@end



