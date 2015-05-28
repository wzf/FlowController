//
//  FlowDemoVController.m
//  FlowNodes
//
//  Created by wangzhanfeng-PC on 15-5-28.
//  Copyright (c) 2015年 Do.Best. All rights reserved.
//

#import "FlowDemoVController.h"
#import "FCHeaders.h"

@implementation FlowDemoVController {
    FCManager *flowMng;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    FCModel *model = [[FCModel alloc] init];
    [model addOneNode:[[FCNode alloc] initWithIdentifier:@"FlowInputText" name:@"输入名称" title:@"输入名称"]];
    [model addOneNode:[[FCNode alloc] initWithIdentifier:@"FlowSwitch"    name:@"启动提示" title:@"启动提示"]];
    [model addOneNode:[[FCNode alloc] initWithIdentifier:@"FlowProgress"  name:@"周期"    title:@"周期"]];
    
    
    flowMng = [[FCManager alloc] initWithContainer:self.navigationController flwoModel:model];
    
    __weak typeof(self) weakSelf = self;
    [flowMng setFlowComplete:^(FCManager *mng, FCModel *model) {
//        NSLog(@"wzf= log [%s](%d) => %@",__func__,__LINE__,model.flowData);
        [weakSelf.navigationController popToViewController:weakSelf animated:YES];
    }];
    
    self.navigationController.delegate = flowMng;
}

- (IBAction)btnAction_startOneOperate:(id)sender
{
    // 开始流程
    [flowMng start];
}

#pragma mark -
#pragma mark 内存回收
- (void)dealloc
{
    NSLog(@"wzf= log => \n%@",@"viewController消息");
}
@end
