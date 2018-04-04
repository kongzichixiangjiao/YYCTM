//
//  YYWatermarkManager.m
//  YYCTM
//
//  Created by houjianan on 2018/4/3.
//  Copyright © 2018年 houjianan. All rights reserved.
//

#import "YYWatermarkManager.h"
#import "YYTextView.h"
#import "UIImage+watermark.h"
#import "YYCatchTools.h"
@interface YYWatermarkManager()

@property (nonatomic, strong)NSFileManager *fileManager;
@end

@implementation YYWatermarkManager

- (NSFileManager *)fileManager
{
    if (!_fileManager) {
        _fileManager = [[NSFileManager alloc]init];
    }
    return _fileManager;
}

+ (instancetype)sharedManager {
    
    static YYWatermarkManager *manager = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[YYWatermarkManager alloc] init];
    });
    
    return manager;
}

+ (UIImage *)getDefaultWatermarkImageWithText: (NSString *)text andFrame: (CGRect)frame {
    YYTextView *t = [[YYTextView alloc] initWithFrame:frame];
    t.text= @"13146218617 侯佳男";
    t.rowSpace = 100;
    t.lineSpace = 150;
    t.row = 6;
    t.line = 5;
    t.color = [UIColor whiteColor];
    t.font = [UIFont systemFontOfSize:15];
    [t initViews];
    
    return [UIImage yy_imageFromView:t];
}

+ (UIImage *)getDefaultWatermarkImageWithModel: (YYWatermarkModel *)model {
    if ([YYCatchTools yy_hasImageWithName:model.text]) {
        return [YYCatchTools yy_getCatchImageWithName:model.text];
    }
    YYTextView *t = [[YYTextView alloc] initWithFrame:model.mRect];
    t.model= model;
    [t initViews];
    
    UIImage *image = [UIImage yy_imageFromView:t];
    
    if ([self saveImage:image andModel:model]) {
        return image;
    } else {
        return nil;
    }
}

+ (BOOL)saveImage: (UIImage *)image andModel: (YYWatermarkModel *)model {
    NSLog(@"text == %@", model.text);
    [YYCatchTools yy_saveCacheWithDataName:model.text andImage:image];
    return YES;
}
//  创建缓存目录文件
- (void)createDirectory:(NSString *)directory {
    if (![self.fileManager fileExistsAtPath:directory]) {
        NSString* fullPath = [[NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"com.watermark.img.yy"];
        [self createDirectory:fullPath];
        [self.fileManager createDirectoryAtPath:directory withIntermediateDirectories:YES attributes:nil error:NULL];
    }
}

- (UIImage *)getDefaultWatermarkImageWithText: (NSString *)text andFrame: (CGRect)frame {
    YYTextView *t = [[YYTextView alloc] initWithFrame:frame];
    t.text= @"13146218617 侯佳男";
    t.rowSpace = 100;
    t.lineSpace = 150;
    t.row = 6;
    t.line = 5;
    t.color = [UIColor whiteColor];
    t.font = [UIFont systemFontOfSize:15];
    [t initViews];
    
    
    return [UIImage yy_imageFromView:t];
}

- (UIImage *)getDefaultWatermarkImageWithModel: (YYWatermarkModel *)model {
    YYTextView *t = [[YYTextView alloc] initWithFrame:model.mRect];
    t.model= model;
    [t initViews];
    
    return [UIImage yy_imageFromView:t];
}

@end
