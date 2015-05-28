//
//  FCNode.h
//  FlowNodes
//
//  Created by wangzhanfeng-PC on 15-5-28.
//  Copyright (c) 2015年 Do.Best. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FCNode : NSObject

@property (nonatomic, copy) NSString *nodeIdentifier; //identifier,用来从storyboard初始化实例用
@property (nonatomic, copy) NSString *nodeName;       //名字
@property (nonatomic, copy) NSString *nodeTitle;      //标题，显示在navigationItem.title

/**
 * 初始化
 * @param identifier 赋值给nodeIdentifier
 * @param name       赋值给nodeName
 * @param ttitle     赋值给nodeTitle
 */
- (instancetype)initWithIdentifier:(NSString *)identifier name:(NSString *)name title:(NSString *)title;


/**
 * 描述
 * 格式 nodeName : identifier
 */
- (NSString *)description;
@end
