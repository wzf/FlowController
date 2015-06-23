//
//  ContainerViewController.m
//  FCDemo
//
//  Created by wangzhanfeng-PC on 15-5-29.
//  Copyright (c) 2015年 F.E. All rights reserved.
//

#import "ContainerViewController.h"
#import "FCHeaders.h"

@implementation ContainerViewController {
    FCManager *flowMng;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    FCModel *model = [[FCModel alloc] init];
    [model addOneNode:[[FCNode alloc] initWithIdentifier:@"FlowInputText" name:@"输入名称" title:@"输入名称"]];
    [model addOneNode:[[FCNode alloc] initWithIdentifier:@"FlowSwitch"    name:@"启动提示" title:@"启动提示"]];
    [model addOneNode:[[FCNode alloc] initWithIdentifier:@"FlowProgress"  name:@"周期"    title:@"周期"]];
    
    
    UINavigationController *navigation = [self.storyboard instantiateViewControllerWithIdentifier:@"fcNav"];
    flowMng = [[FCManager alloc] initWithContainer:navigation flwoModel:model];
    
    __weak typeof(self) weakSelf = self;
    [flowMng setFlowComplete:^(FCManager *mng, FCModel *model) {
        //        NSLog(@"wzf= log [%s](%d) => %@",__func__,__LINE__,model.flowData);
        [weakSelf.navigationController popToViewController:weakSelf animated:YES];
    }];
    
    self.navigationController.delegate = flowMng;
}


- (IBAction)btnAction_start:(id)sender {
    //
    UIViewController *childVC = flowMng.fcNavContainer;
    [self addChildViewController:childVC];
    [self.view addSubview:childVC.view];
    childVC.view.frame = self.view.bounds;
}

@end
