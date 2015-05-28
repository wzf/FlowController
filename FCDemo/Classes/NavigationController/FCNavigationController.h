//
//  FCNavigationController.h
//  FlowNodes
//
//  Created by wangzhanfeng-PC on 15-5-28.
//  Copyright (c) 2015年 Do.Best. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FCHeaders.h"

/**
 * Description : 为FCManager创建的专用Navigation。
 * Bug：当进行pop相关的操作时，节点无法back，所以会造成节点混乱。
 * Resolve：
 *      case 1 => 增加FCNavigationController，重写了相关pop的操作，方法中显性的调用FCManager的nodeOperationBack方法，维持正常的节点顺序
 *      case 2 => 每个实现了FCOperate协议的ViewController中，再back/pop操作中，显性调用FCManager的nodeOperationBack方法。注：不能通过比较isKindOfClass:，只能通过index,因为一种类型的处理界面(比如输入框)，可能会多次使用，并且可能相邻。
 *   ***** case 1 与 case 2不要一块使用，否则就乱套了，%>_<% *****
 */

@interface FCNavigationController : UINavigationController
@property (nonatomic, weak) FCManager *flowManager; //
@end
