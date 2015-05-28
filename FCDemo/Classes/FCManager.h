//
//  FCManager.h
//  FlowNodes
//
//  Created by wangzhanfeng-PC on 15-5-28.
//  Copyright (c) 2015年 Do.Best. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@protocol FCOperate;
#import "FCModel.h"

@interface FCManager : NSObject <UINavigationControllerDelegate>

@property (nonatomic, weak  ) UINavigationController *fcNavContainer; //
@property (nonatomic, strong) FCModel *fcModel; //

/**
 * 初始化
 * @param nav nav
 * @param aModel 流程模型
 */
- (instancetype)initWithContainer:(UINavigationController *)nav flwoModel:(FCModel *)aModel;


/**
 * 当前节点处理完成
 * <FCOperate>中可以调用此方法，表明自己的处理已经完成
 * @param nodeData 节点数据
 */
- (void)nodeOperationFinished:(id)nodeData;

/**
 * 返回到上一个节点
 */
- (void)nodeOperationBack;


/**
 * 流程信息
 */
- (NSString *)flowDescription;


/**
 * 开启、结束
 */
- (void)start;
- (void)finish;
@property (nonatomic, copy) void (^flowComplete) (FCManager *manager, FCModel *modelObject); //



#pragma mark - 私有部分
/// 节点控制
@property (nonatomic, assign) NSInteger currentFlowIndex; //当前节点

/// 节点处理viewcontroller
- (UIViewController<FCOperate> *)nodeOperateWithNode:(FCNode *)node;

@end
