//
//  FCManager.m
//  FlowNodes
//
//  Created by wangzhanfeng-PC on 15-5-28.
//  Copyright (c) 2015年 Do.Best. All rights reserved.
//

#import "FCManager.h"
// 流程控制器
#import "FCOperate.h"
#import "FCNavigationController.h"

@implementation FCManager

- (instancetype)initWithContainer:(UINavigationController *)nav flwoModel:(FCModel *)aModel;
{
    self = [super init];
    if (self) {
        self.fcNavContainer = nav;
        self.fcModel        = aModel;
        
        if ([nav isKindOfClass:[FCNavigationController class]]) {
            [(FCNavigationController *)nav setFlowManager:self];
        }
    }
    return self;
}

/**
 * 设置第一个node对应的viewcontroller为nav.rootViewController
 */
- (void)setupNavRootControllerUseFirstNode;
{
    FCNode *node = [_fcModel nodeAtIndex:0];
    // 有下一个流程节点
    if (node != nil) {
        UIViewController<FCOperate> *nodeOperate = [self nodeOperateWithNode:node];
        // 设置RootViewControllers
        [self.fcNavContainer setViewControllers:@[nodeOperate]];
    }
    _currentFlowIndex = 0;
}

/**
 * 当前节点处理完成
 * <FCOperate>中可以调用此方法，表明自己的处理已经完成
 * @param nodeData 节点信息
 */
- (void)nodeOperationFinished:(id)nodeData;
{
    // 将nodeData存储,key是node.identifier
    FCNode *node = [_fcModel nodeAtIndex:_currentFlowIndex];
    [_fcModel setFlowData:nodeData forKey:node.nodeIdentifier];
    
    // 展示下一个
    _currentFlowIndex++;
    [self showNextNode];
}

/**
 * 返回到上一个节点
 */
- (void)nodeOperationBack;
{
    _currentFlowIndex--;
}

/**
 * 流程信息
 */
- (NSString *)flowDescription;
{
    NSMutableString *desc = [NSMutableString string];
    for (int i = 0; i < _fcModel.flowNodes.count; i++) {
        FCNode *node = _fcModel.flowNodes[i];
        [desc appendFormat:@"【 %@ 】 \n", [node description]];
    }
    return desc;
}

/**
 * 开启、结束
 */
- (void)start;
{
    self.currentFlowIndex = 0;
    if (self.fcNavContainer == nil || self.fcModel == nil) {
        return;
    }
    
//    [self observeNavigationController];
    
    // 开始展示
    [self showNextNode];
}
- (void)finish;
{
    // 回调
    if (_flowComplete) {
        _flowComplete(self, _fcModel);
    }
//    [self cancelObserveToNavigationController];
}

#pragma mark - 私有方法
/// 节点处理viewcontroller
- (UIViewController<FCOperate> *)nodeOperateWithNode:(FCNode *)node;
{
    // 从storyboard初始化
    UIViewController<FCOperate> *nodeOperate = [self.fcNavContainer.storyboard instantiateViewControllerWithIdentifier:node.nodeIdentifier];
    
    // 设置manager为self，方便调用-nodeOperationFinished:
    nodeOperate.fcManager = self;
    
    // 设置标题
    nodeOperate.title = node.nodeTitle;
    
    return nodeOperate;
}

/// 展示下一个
- (void)showNextNode
{
    FCNode *node = [_fcModel nodeAtIndex:_currentFlowIndex];
    // 有下一个流程节点
    if (node != nil) {
        UIViewController<FCOperate> *nodeOperate = [self nodeOperateWithNode:node];
        [self.fcNavContainer pushViewController:nodeOperate animated:YES];
    }
    // 已经结束
    else {
        [self finish];
    }
}

#pragma mark -
#pragma mark 增加对UINavigationController的监听，为了应对back时，数据更新不及时
//- (void)observeNavigationController
//{
//    if (_fcNavContainer) {
//        [_fcNavContainer addObserver:self forKeyPath:@"topViewController" options: NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:NULL];
//    }
//}
//
//- (void)cancelObserveToNavigationController
//{
//    
//}
//
//- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
//{
//    if (object == _fcNavContainer) {
//        NSLog(@"wzf= log [%s](%d) => %@",__func__,__LINE__,@(_fcNavContainer.childViewControllers.count));
//    }
//}

#pragma mark -
#pragma mark 内存回收
//- (void)dealloc
//{
//    NSLog(@"wzf= log => \n%@",@"FCManager已回收");
//}
@end
