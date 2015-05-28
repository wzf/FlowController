//
//  FCModel.m
//  FlowNodes
//
//  Created by wangzhanfeng-PC on 15-5-28.
//  Copyright (c) 2015年 Do.Best. All rights reserved.
//

#import "FCModel.h"

@implementation FCModel

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.flowData  = [NSMutableDictionary dictionary];
        self.flowNodes = [NSMutableArray array];
    }
    return self;
}

/**
 * 设置流程数据
 * 操作flowData，存取数据
 */
- (void)setFlowData:(id)data forKey:(NSString *)key;
{
    [_flowData setValue:data forKey:key];
}


- (void)addOneNode:(FCNode *)node;
{
    [self.flowNodes addObject:node];
}


- (FCNode *)nodeAtIndex:(NSInteger)index;
{
    if (index >= self.flowNodes.count) {
        return nil;
    }
    return _flowNodes[index];
}

#pragma mark -
#pragma mark 内存回收
//- (void)dealloc
//{
//    NSLog(@"wzf= log => \n%@",@"FCModelObject已回收");
//}
@end
