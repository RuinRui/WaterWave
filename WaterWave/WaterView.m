//
//  WaterView.m
//  WaterWave
//
//  Created by FBI on 16/4/18.
//  Copyright © 2016年 君陌. All rights reserved.
//

#import "WaterView.h"

@implementation WaterView{
    //初相 用于横向的移动
    float _initPhase;
    //初相二 用于横向的移动
    float _initPhaseTwo;
}

- (id) initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    if (self) {
        //设置默认值
        _growRate = 0.6;
        _amplitude = 10;
        _verSurfaceY = self.frame.size.height / 2;
        _period = self.frame.size.width / 2;
        
        [NSTimer scheduledTimerWithTimeInterval:.05 target:self selector:@selector(animateWaterWave) userInfo:nil repeats:YES];
    }
    
    return self;
}

#pragma mark - 改变初相来控制波的移动
- (void) animateWaterWave{
    
    _initPhase += _growRate;
    _initPhaseTwo += 0.5;
    
    static bool isUp = NO;
    if (_verSurfaceY < 150) {
        isUp = YES;
    } else if (_verSurfaceY >= 345) {
        isUp = NO;
    }

    if (isUp) {
        _verSurfaceY += 2;
    } else {
        _verSurfaceY -= 2;
    }
    
    [self setNeedsDisplay];
}

- (void) drawRect:(CGRect)rect {
    
    CGContextClearRect(UIGraphicsGetCurrentContext(), CGRectMake(0, 0, self.frame.size.width, self.frame.size.height));
    
    UIBezierPath * pathTwo = [self getWaterLine:_amplitude periodWidth:_period * 1.8 initPhase:_initPhaseTwo verSurfaceY:_verSurfaceY];
    [pathTwo fillWithBlendMode:kCGBlendModeMultiply alpha:1];

    UIBezierPath * pathOne = [self getWaterLine:_amplitude periodWidth:_period * 1.2 initPhase:_initPhase verSurfaceY:_verSurfaceY];
    [pathOne fillWithBlendMode:kCGBlendModeMultiply alpha:1];
}

- (UIBezierPath *) getWaterLine:(CGFloat) amplitude periodWidth:(CGFloat) period initPhase:(CGFloat) initPhase verSurfaceY:(CGFloat) surfaceY{
//    用正余弦函数模拟水面,正余弦函数方程为：
//    y = Asin(wx + b) + h ，这个公式里：w影响周期，A影响振幅，h影响y位置，b为初相；
    
    if (initPhase == _initPhase) {
        UIColor * colorSecond = [UIColor colorWithRed:86 / 255.0f green:202 / 255.0f blue:139 / 255.0f alpha:1];
        [colorSecond set];
    } else {
        UIColor * color = [UIColor colorWithRed:43 / 255.0f green:133 / 255.0f blue:1 alpha:1];
        [color set];
    }
    
    
    UIBezierPath * path = [UIBezierPath bezierPath];
    
    [path moveToPoint:CGPointMake(0, self.frame.size.height)];
    [path addLineToPoint:CGPointMake(0, surfaceY)];
    
    float y = surfaceY;
    for(float x = 0; x <= self.frame.size.width; x++) {
        y = amplitude * sin(x / period * M_PI + initPhase / M_PI) + surfaceY;
        [path addLineToPoint:CGPointMake(x, y)];
    }
    
    [path addLineToPoint:CGPointMake(self.frame.size.width, self.frame.size.height)];
    [path closePath];
    
    return path;
}

@end
