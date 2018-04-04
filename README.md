# YYCTM

增加水印，缓存图片。

    YYWatermarkModel *model = [[YYWatermarkModel alloc] init];
    model.text= @"1314***8617 HJN";
    UIImage *image = [[YYWatermarkManager sharedManager] getDefaultWatermarkImageWithModel:model];


