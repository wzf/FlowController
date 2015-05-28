//
//  FlowInputText.m
//  FlowNodes
//
//  Created by wangzhanfeng-PC on 15-5-28.
//  Copyright (c) 2015年 Do.Best. All rights reserved.
//

#import "FlowInputText.h"

@implementation FlowInputText
@synthesize fcManager=_fcManager;


- (IBAction)btnActon_nodeDone:(id)sender {
    [_fcManager nodeOperationFinished:_txt_input.text];
}

@end
