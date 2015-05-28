//
//  FlowProgress.h
//  FlowNodes
//
//  Created by wangzhanfeng-PC on 15-5-28.
//  Copyright (c) 2015年 Do.Best. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FCOperate.h"

@interface FlowProgress : UIViewController<FCOperate>
@property (weak, nonatomic) IBOutlet UISlider *progressValue;

@end
