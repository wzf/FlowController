//
//  FCNavigationController.m
//  FlowNodes
//
//  Created by wangzhanfeng-PC on 15-5-28.
//  Copyright (c) 2015年 Do.Best. All rights reserved.
//

#import "FCNavigationController.h"

@implementation FCNavigationController

- (UIViewController *)popViewControllerAnimated:(BOOL)animated
{
    if (_flowManager) {
        [_flowManager nodeOperationBack];
    }
    return [super popViewControllerAnimated:animated];
}


- (NSArray *)popToViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (_flowManager) {
        [_flowManager nodeOperationBack];
    }
    
    return [super popToViewController:viewController animated:animated];
}

@end
