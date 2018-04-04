//
//  YYWatermarkHeader.h
//  YYCTM
//
//  Created by houjianan on 2018/4/4.
//  Copyright © 2018年 houjianan. All rights reserved.
//

#ifndef YYWatermarkHeader_h
#define YYWatermarkHeader_h

#import "YYWatermarkManager.h"

// 自定义颜色
#define YYColor(r, g, b) [UIColor colorWithRed:(r) / 255.0 green:(g) / 255.0 blue:(b) / 255.0 alpha:1]
// 自定义颜色 透明度
#define YYColorWithAlpha(r, g, b, a) [UIColor colorWithRed:(r) / 255.0 green:(g) / 255.0 blue:(b) / 255.0 alpha:a]

// 随机色
#define YYRandomColor [UIColor colorWithRed:arc4random_uniform(256) / 255.0 green:arc4random_uniform(256) / 255.0 blue:arc4random_uniform(256) / 255.0 alpha:1]
// 随机色 透明度
#define YYRandomColorWithAlpha(a) [UIColor colorWithRed:arc4random_uniform(256) / 255.0 green:arc4random_uniform(256) / 255.0 blue:arc4random_uniform(256) / 255.0 alpha:(a)]

#endif /* YYWatermarkHeader_h */
