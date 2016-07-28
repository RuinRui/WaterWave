//
//  ViewController.m
//  WaterWave
//
//  Created by FBI on 16/4/18.
//  Copyright © 2016年 君陌. All rights reserved.
//

#import "ViewController.h"

#import "WaterView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    WaterView * view = [[WaterView alloc] initWithFrame:CGRectMake(0, 0, 375, [UIScreen mainScreen].bounds.size.height)];
    view.amplitude = 20;
    view.verSurfaceY = 345;
    view.period = 180;

    view.backgroundColor = [UIColor clearColor];
    
    [self.view addSubview:view];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
