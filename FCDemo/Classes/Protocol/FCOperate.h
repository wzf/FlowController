//
//  FCOperate.h
//  FlowNodes
//
//  Created by wangzhanfeng-PC on 15-5-28.
//  Copyright (c) 2015年 Do.Best. All rights reserved.
//

#import <Foundation/Foundation.h>
// 协议：流程处理，具体实现各个节点上的操作，比如输入文字，选择发送通知等
//@class FCManager;
#import "FCManager.h"

@protocol FCOperate <NSObject>
@property (nonatomic, weak) FCManager *fcManager; //

@end
