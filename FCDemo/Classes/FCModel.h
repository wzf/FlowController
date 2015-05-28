//
//  FCModel.h
//  FlowNodes
//
//  Created by wangzhanfeng-PC on 15-5-28.
//  Copyright (c) 2015年 Do.Best. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FCNode.h"

@interface FCModel : NSObject

@property (nonatomic, strong) NSMutableArray      *flowNodes; //流程节点集合
@property (nonatomic, strong) NSMutableDictionary *flowData;  //流程数据

/**
 * 设置流程数据
 * 操作flowData，存取数据
 */
- (void)setFlowData:(id)data forKey:(NSString *)key;


/**
 * 增加节点
 */
- (void)addOneNode:(FCNode *)node;

/**
 * index位置下的节点
 */
- (FCNode *)nodeAtIndex:(NSInteger)index;

@end
