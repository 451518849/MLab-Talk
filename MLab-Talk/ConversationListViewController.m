//
//  ConversationListViewController.m
//  MLab-Talk
//
//  Created by apple on 15/12/4.
//  Copyright © 2015年 wangxiaofa. All rights reserved.
//

#import "ConversationListViewController.h"
@interface ConversationListViewController ()

@end

@implementation ConversationListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"矩阵聊天室";

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//重载函数，onSelectedTableRow 是选择会话列表之后的事件，该接口开放是为了便于您自定义跳转事件。在快速集成过程中，您只需要复制这段代码。
-(void)onSelectedTableRow:(RCConversationModelType)conversationModelType conversationModel:(RCConversationModel *)model atIndexPath:(NSIndexPath *)indexPath

{
    if (model.conversationType == ConversationType_GROUP) {
        RCConversationViewController *conversationVC = [[RCConversationViewController alloc]init];
        conversationVC.conversationType  = ConversationType_GROUP;
        conversationVC.targetId = model.targetId;
        conversationVC.userName =model.conversationTitle;
        conversationVC.title = @"聊天室";
        [self.navigationController pushViewController:conversationVC animated:YES];
        return;
    }
    
    RCConversationViewController *conversationVC = [[RCConversationViewController alloc]init];
    conversationVC.conversationType  = model.conversationType;
    conversationVC.targetId = model.targetId;
    conversationVC.userName =model.conversationTitle;
    conversationVC.title = model.conversationTitle;
    
    
    [self.navigationController pushViewController:conversationVC animated:YES];
}

@end
