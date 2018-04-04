//
//  YYWatermarkModel.h
//  YYCTM
//
//  Created by houjianan on 2018/4/3.
//  Copyright © 2018年 houjianan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface YYWatermarkModel : NSObject

@property(nonatomic, assign)CGRect mRect;
@property(nonatomic, assign)int row; // max 4
@property(nonatomic, assign)int line; // max 6
@property(nonatomic, strong)NSString *text;
@property(nonatomic, assign)CGFloat rowSpace;
@property(nonatomic, assign)CGFloat lineSpace;
@property(nonatomic, strong)UIColor *color;
@property(nonatomic, strong)UIFont *font;
@end
