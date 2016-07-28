//
//  WaterView.h
//  WaterWave
//
//  Created by FBI on 16/4/18.
//  Copyright © 2016年 君陌. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WaterView : UIView
/** 振幅 波峰 */
@property (nonatomic) CGFloat amplitude;
/** 波的纵向位置 */
@property (nonatomic) CGFloat verSurfaceY;
/** 周期,决定一个屏幕宽度显示的波数和效果,如果波峰越高,则需要设置越宽的周期来看出波形的调整,如果波峰设为10,周期为180以内最佳,以此类推 */
@property (nonatomic) CGFloat period;
/** 初相的增幅,控制波的移动速度 */
@property (nonatomic) CGFloat growRate;

@end
