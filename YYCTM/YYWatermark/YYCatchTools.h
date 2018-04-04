//
//  YYCatchTools.h
//  YYCTM
//
//  Created by houjianan on 2018/4/3.
//  Copyright © 2018年 houjianan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface YYCatchTools : NSObject
+ (CGFloat)yy_folderSize;
+ (void)yy_removeCache;
+ (BOOL)yy_removeCacheWithDataName: (NSString *)name;

+ (BOOL)yy_saveCacheWithDataName: (NSString *)name andImage: (UIImage *)image;
+ (BOOL)yy_hasImageWithName: (NSString *)name;
+ (UIImage *)yy_getCatchImageWithName: (NSString *)name;
@end
