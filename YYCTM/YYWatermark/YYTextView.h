//
//  TextView.h
//  YYCTM
//
//  Created by houjianan on 2018/4/3.
//  Copyright © 2018年 houjianan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YYWatermarkModel.h"
@interface YYTextView : UIView

@property(nonatomic,strong)YYWatermarkModel *model;

@property(nonatomic, assign)int row;
@property(nonatomic, assign)int line;
@property(nonatomic, strong)NSString *text;
@property(nonatomic, assign)CGFloat rowSpace;
@property(nonatomic, assign)CGFloat lineSpace;
@property(nonatomic, strong)UIColor *color;
@property(nonatomic, strong)UIFont *font;

- (void)initViews;
@end
