//
//  YYCatchTools.m
//  YYCTM
//
//  Created by houjianan on 2018/4/3.
//  Copyright © 2018年 houjianan. All rights reserved.
//

#import "YYCatchTools.h"

@implementation YYCatchTools
// 缓存大小
+ (CGFloat)yy_folderSize {
    CGFloat folderSize = 0.0;
    
    //获取路径 /Library/Caches
    NSString *cachePath = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory,NSUserDomainMask,YES)firstObject];
    NSLog(@"cachePath == %@", cachePath);
    //获取所有文件的数组
    NSArray *files = [[NSFileManager defaultManager] subpathsAtPath:cachePath];
    
    NSLog(@"文件数：%ld",files.count);
    
    for(NSString *path in files) {
        
        NSString*filePath = [cachePath stringByAppendingString:[NSString stringWithFormat:@"/%@",path]];
        
        //累加
        folderSize += [[NSFileManager defaultManager]attributesOfItemAtPath:filePath error:nil].fileSize;
    }
    //转换为M为单位
    CGFloat sizeM = folderSize /1024.0/1024.0;
    
    return sizeM;
}

+ (BOOL)yy_removeCacheWithDataName: (NSString *)name {
    
    NSArray *arr = [name componentsSeparatedByString:@"."];
    NSString *newName;
    if ([arr.lastObject isEqualToString:@"png"]) {
        newName = name;
    } else {
        newName = [NSString stringWithFormat:@"%@.png", name];
    }
    
    //===============清除缓存==============
    //获取路径
    NSString*cachePath = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory,NSUserDomainMask,YES)objectAtIndex:0];
    
    //返回路径中的文件数组
    NSArray*files = [[NSFileManager defaultManager] subpathsAtPath:[self yy_YYWatermark:cachePath]];
    
    NSLog(@"文件数：%ld",[files count]);
    
    NSLog(@"%@", [[NSFileManager defaultManager] contentsOfDirectoryAtPath:[self yy_YYWatermark:cachePath] error:nil]);
    NSArray *nameArr = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:[self yy_YYWatermark:cachePath] error:nil];
    for (NSString *videoName in nameArr) {
        if ([newName isEqualToString:videoName]) {
            NSError*error;
            NSString*path = [[self yy_YYWatermark:cachePath] stringByAppendingString:[NSString stringWithFormat:@"/%@",videoName]];
            if([[NSFileManager defaultManager] isDeletableFileAtPath:path])
            {
                BOOL isRemove = [[NSFileManager defaultManager] removeItemAtPath:path error:&error];
                if(isRemove) {
                    NSLog(@"清除成功");
                    return YES;
                }else{
                    NSLog(@"清除失败");
                    return NO;
                }
            }
        }
    }
    return NO;
}

+ (NSString *)yy_YYWatermark: (NSString *)path {
    return [NSString stringWithFormat:@"%@/YYWatermark", path];
}

+ (void)yy_removeCache {
    //===============清除缓存==============
    //获取路径
    NSString*cachePath = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory,NSUserDomainMask,YES)objectAtIndex:0];
    
    //返回路径中的文件数组
    NSArray*files = [[NSFileManager defaultManager]subpathsAtPath:cachePath];
    
    NSLog(@"文件数：%ld",[files count]);
    for(NSString *p in files){
        NSError*error;
        
        NSString*path = [cachePath stringByAppendingString:[NSString stringWithFormat:@"/%@",p]];
        
        if([[NSFileManager defaultManager]fileExistsAtPath:path])
        {
            BOOL isRemove = [[NSFileManager defaultManager]removeItemAtPath:path error:&error];
            if(isRemove) {
                NSLog(@"清除成功");
            }else{
                NSLog(@"清除失败");
            }
        }
    }
}

+ (BOOL)yy_saveCacheWithDataName: (NSString *)name andImage: (UIImage *)image {
    NSString*cachePath = [self yy_YYWatermark:[NSSearchPathForDirectoriesInDomains(NSCachesDirectory,NSUserDomainMask,YES)objectAtIndex:0]];
    
    NSLog(@"%@", cachePath);
    NSData *data = UIImagePNGRepresentation(image);
    [[NSFileManager defaultManager] createDirectoryAtPath:cachePath withIntermediateDirectories:YES attributes:nil error:nil];
    NSString *file = [NSString stringWithFormat:@"%@/%@.png", cachePath, name];
    [data writeToFile:file atomically:YES];

    return YES;
}

+ (BOOL)yy_hasImageWithName: (NSString *)name {
    NSString *cachePath = [self yy_YYWatermark:[NSSearchPathForDirectoriesInDomains(NSCachesDirectory,NSUserDomainMask,YES)objectAtIndex:0]];
    NSArray *nameArr = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:cachePath error:nil];
    for (int i = 0; i < nameArr.count; i++) {
        NSLog(@"name = %@", nameArr[i]);
        NSString *temp = nameArr[i];
        if ([temp isEqualToString:[NSString stringWithFormat:@"%@.png", name]]) {
            return YES;
        }
    }
    return NO;
}

+ (UIImage *)yy_getCatchImageWithName: (NSString *)name {
    NSString *cachePath = [self yy_YYWatermark:[NSSearchPathForDirectoriesInDomains(NSCachesDirectory,NSUserDomainMask,YES)objectAtIndex:0]];
    NSString *file = [NSString stringWithFormat:@"%@/%@.png", cachePath, name];
    NSLog(@"%@", file);
    UIImage *image = [[UIImage alloc] initWithContentsOfFile:file];
    return image;
}

@end


































