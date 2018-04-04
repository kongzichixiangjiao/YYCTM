//
//  YYWatermarkManager.h
//  YYCTM
//
//  Created by houjianan on 2018/4/3.
//  Copyright © 2018年 houjianan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "YYWatermarkModel.h"

@interface YYWatermarkManager : NSObject

+ (instancetype)sharedManager;

+ (UIImage *)getDefaultWatermarkImageWithText: (NSString *)text andFrame: (CGRect)frame;
+ (UIImage *)getDefaultWatermarkImageWithModel: (YYWatermarkModel *)model;

- (UIImage *)getDefaultWatermarkImageWithText: (NSString *)text andFrame: (CGRect)frame;
- (UIImage *)getDefaultWatermarkImageWithModel: (YYWatermarkModel *)model;

@end
