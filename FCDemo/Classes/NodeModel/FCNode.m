//
//  FCNode.m
//  FlowNodes
//
//  Created by wangzhanfeng-PC on 15-5-28.
//  Copyright (c) 2015年 Do.Best. All rights reserved.
//

#import "FCNode.h"

@implementation FCNode

/**
 * 初始化
 * @param identifier 赋值给nodeIdentifier
 * @param name       赋值给nodeName
 * @param ttitle     赋值给nodeTitle
 */
- (instancetype)initWithIdentifier:(NSString *)identifier name:(NSString *)name title:(NSString *)title;
{
    self = [super init];
    if (self) {
        self.nodeIdentifier = identifier;
        self.nodeName       = name;
        self.nodeTitle      = title;
    }
    return self;
}


/**
 * 描述
 * 格式 nodeName : identifier
 */
- (NSString *)description;
{
    return [NSString stringWithFormat:@"%@ : %@", _nodeName, _nodeIdentifier];
}

#pragma mark -
#pragma mark 内存回收
//- (void)dealloc
//{
//    NSLog(@"wzf= log => \n%@",@"Node已回收");
//}

@end
