//
//  DetailViewController.m
//  CBWEmptyViewDemo
//
//  Created by 陈博文 on 16/8/8.
//  Copyright © 2016年 陈博文. All rights reserved.
//

#import "DetailViewController.h"
#import "UIView+CBWPlaceHolderView.h"
#import "CBWPlaceHolderView.h"
#import <objc/message.h>

@interface DetailViewController ()
@end

@implementation DetailViewController


-(void)viewDidLoad{
    
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor greenColor];

    
    self.tableView.tableFooterView = [[UIView alloc]init];
//
//    if ([self.selectorStr isEqualToString:@"setUpReloadDataButton"]) {
//        [self setUpReloadDataButton];
//    }else if([self.selectorStr isEqualToString:@"setUpFullScreenRefresh"]){
//        [self setUpFullScreenRefresh];
//    }else if ([self.selectorStr isEqualToString:@"setUpImageArray"]){
//        [self setUpImageArray];
//    }else if([self.selectorStr isEqualToString:@"setUpGifImage"]){
//        [self setUpGifImage];
//    }

    
    SEL sel = NSSelectorFromString(self.selectorStr);
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
    [self performSelector:sel withObject:nil];
#pragma clang diagnostic pop
    
    
  }

-(void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    
   
}



#pragma mark - 样例一(不能全屏点击,有刷新按钮)

/**
 *  这里也可以创建新增送货地址按钮
 */
- (void)setUpReloadDataButton{
    
    self.view.cbw_placeHolderView = [CBWPlaceHolderView showEmptyViewWithMessage:@"暂无数据" inparentView:self.view];
    
 
    self.view.cbw_placeHolderView.buttonTiltle = @"重新加载";
        __weak typeof(self)weakSelf = self;
    self.view.cbw_placeHolderView.ButtonClickedBlock = ^(){
        
        [weakSelf.view.cbw_placeHolderView dismiss];
        
      
    };
    
    self.view.cbw_placeHolderView.messageTextColor = [UIColor greenColor];
    self.view.cbw_placeHolderView.messageFont = [UIFont systemFontOfSize:12.0];
    
    self.view.cbw_placeHolderView.buttonBackgroundColor = [UIColor redColor];
    self.view.cbw_placeHolderView.buttonTitleFont = [UIFont systemFontOfSize:20.0];
    self.view.cbw_placeHolderView.buttonTitleColor = [UIColor yellowColor];
    
    self.view.cbw_placeHolderView.customImage = [UIImage imageNamed:@"norecord"];
    
}


#pragma mark - 样例二 传入一个图片数组,

- (void)setUpImageArray{
    
    self.view.cbw_placeHolderView = [CBWPlaceHolderView showEmptyViewWithMessage:@"加载中..." inparentView:self.view];

    NSMutableArray * images = [NSMutableArray array];
    for (int index = 0; index<=19; index++) {
        NSString * imageName = [NSString stringWithFormat:@"%d.png",index];
        UIImage *image = [UIImage imageNamed:imageName];
        [images addObject:image];
    }
    
    self.view.cbw_placeHolderView.customAnimationImages = images;
    
}

#pragma mark - 样例三 传入一个 gif 图片

- (void)setUpGifImage{
    
    self.view.cbw_placeHolderView = [CBWPlaceHolderView showEmptyViewWithMessage:@"加载中..." inparentView:self.view];
    //loadinggif4
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"loadinggif3" ofType:@"gif"];
    
    NSData *data = [NSData dataWithContentsOfFile:path];
    
    self.view.cbw_placeHolderView.gifImageData = data;
    
}


@end
