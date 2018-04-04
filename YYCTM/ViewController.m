//
//  ViewController.m
//  YYCTM
//
//  Created by houjianan on 2018/4/3.
//  Copyright © 2018年 houjianan. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor clearColor];
    
    YYWatermarkModel *model = [[YYWatermarkModel alloc] init];
    model.text= @"13146218617 侯佳男";
    UIImage *image = [[YYWatermarkManager sharedManager] getDefaultWatermarkImageWithModel:model];
    
    UIImageView* i = [[UIImageView alloc] initWithImage:image];
    i.frame = self.view.bounds;
    [self.view addSubview:i];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

