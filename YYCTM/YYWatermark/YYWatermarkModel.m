//
//  YYWatermarkModel.m
//  YYCTM
//
//  Created by houjianan on 2018/4/3.
//  Copyright © 2018年 houjianan. All rights reserved.
//

#import "YYWatermarkModel.h"

@implementation YYWatermarkModel

- (instancetype)init {
    if (self = [super init]) {
        _text= @"--";
        _rowSpace = 150;
        _lineSpace = 180;
        _row = 7;
        _line = 3;
        _color = YYColorWithAlpha(220, 220, 220, 0.4);
        _font = [UIFont systemFontOfSize:15];
        _mRect = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
    }
    return self;
}

@end

