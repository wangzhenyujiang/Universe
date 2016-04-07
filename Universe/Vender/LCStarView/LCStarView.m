//
//  LCStarView.m
//  StarView
//
//  Created by bawn on 9/15/15.
//  Copyright (c) 2015 bawn. All rights reserved.
//

#import "LCStarView.h"

@interface LCStarView ()

@property (nonatomic, strong) CAShapeLayer *maskLayer;
@property (nonatomic, strong) UIView *fillView;

@end
@implementation LCStarView

- (void)setMaskImage:(UIImage *)maskImage{
    _maskImage = maskImage;
    if (!_maskLayer) {
        self.maskLayer = [CAShapeLayer layer];
        self.maskLayer.frame = CGRectMake(0,0, _maskImage.size.width, _maskImage.size.height);
        self.layer.mask = _maskLayer;
    }
    self.maskLayer.contents = (id)[_maskImage CGImage];
}

- (void)setFillColor:(UIColor *)fillColor{
    _fillColor = fillColor;
    if (!_fillView) {
        self.fillView = [[UIView alloc] initWithFrame:self.bounds];
        [self addSubview:_fillView];
    }
    self.fillView.backgroundColor = _fillColor;
}


@end
