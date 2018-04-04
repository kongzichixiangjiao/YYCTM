//
//  ViewController.m
//  YYCTM
//
//  Created by houjianan on 2018/4/3.
//  Copyright © 2018年 houjianan. All rights reserved.
//

#import "ViewController.h"
#import "TextView.h"
#import "UIImage+SubImage.h"	
#import "UIImage+Rotate.h"
#import "UIImage+Color.h"
#import "UIImage+watermark.h"
#import "YYWatermarkManager.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor clearColor];
    YYWatermarkModel *model = [[YYWatermarkModel alloc] init];
    model.text= @"1234 侯佳男";
    model.rowSpace = 150;
    model.lineSpace = 180;
    model.row = 7;
    model.line = 3;
    model.color = [UIColor whiteColor];
    model.font = [UIFont systemFontOfSize:15];
    model.mRect = self.view.bounds;
    
    TextView *vie = [[TextView alloc] init];
    vie.model = model; 
    [self.view addSubview:vie];
//    UIImageView* i = [[UIImageView alloc] initWithImage:[YYWatermarkManager getDefaultWatermarkImageWithModel:model]];
//    i.frame = self.view.bounds;
//    [self.view addSubview:i];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

