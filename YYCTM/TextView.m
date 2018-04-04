//
//  TextView.m
//  YYCTM
//
//  Created by houjianan on 2018/4/3.
//  Copyright © 2018年 houjianan. All rights reserved.
//

#import "TextView.h"

@implementation TextView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return  self;
}

- (void)setModel:(YYWatermarkModel *)model {
    _model = model;
    
    [self initViews];
    self.backgroundColor = [UIColor greenColor];
}

- (void)initViews {
    for (int i = 0; i < self.model.line; i++) {
        for (int j = 0; j < self.model.row; j++) {
            UILabel * l = [[UILabel alloc] init];
            NSDictionary *attr = @{
                                   //设置字体大小
                                   NSFontAttributeName: self.model.font,
                                   //设置文字颜色
                                   NSForegroundColorAttributeName : self.model.color,
                                   
                                   };
//            NSMutableAttributedString *attrStr = [[NSMutableAttributedString alloc] initWithString:self.model.text attributes:attr];
            NSMutableAttributedString *attrStr = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"%d--%d", i, j] attributes:attr];
            CGFloat strWidth = attrStr.size.width;
            CGFloat strHeight = attrStr.size.height;
            l.attributedText = attrStr;
            /*
             if (i % 2 == 0) {
             l.frame = CGRectMake(j * (self.model.rowSpace + strWidth), i * (strHeight + self.model.lineSpace), strWidth, strHeight);
             } else {
             l.frame = CGRectMake(-strWidth + j * (self.model.rowSpace + strWidth), i * (strHeight + self.model.lineSpace), strWidth, strHeight);
             }
             */
            
            l.frame = CGRectMake(i * (self.model.rowSpace + strWidth), j * (strHeight + self.model.lineSpace), strWidth, strHeight);

            l.transform = CGAffineTransformRotate(l.transform, -0.4);
            [self addSubview:l];
        }
    }
}

@end

