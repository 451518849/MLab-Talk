//
//  ViewController.m
//  MLab-Talk
//
//  Created by apple on 15/12/4.
//  Copyright © 2015年 wangxiaofa. All rights reserved.
//

#import "ViewController.h"
#import "ConversationListViewController.h"
#import "UILoginTextField.h"
#import <RongIMKit/RongIMKit.h>
#import "common.h"
@interface ViewController ()
@property(nonatomic,copy)NSString *token;
@property(nonatomic,retain)UILoginTextField *login;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //Marker Felt
    
    self.title = @"LOGIN";
    CGFloat ViewCenterX = self.view.center.x;
    CGFloat ViewCenterY = self.view.center.y;
    
    UILabel *Matrix_M = [[UILabel alloc]initWithFrame:CGRectMake(0, 100, 200, 250)];
    Matrix_M.text = @"M";
    Matrix_M.font = [UIFont fontWithName:@"Zapfino" size:100];
    [self.view addSubview:Matrix_M];

    
    UILabel *Matrix_atrix = [[UILabel alloc]initWithFrame:CGRectMake(180, 170, 200, 100)];
    Matrix_atrix.text = @"atrix";
    Matrix_atrix.font = [UIFont fontWithName:@"Marker Felt" size:40];
    [self.view addSubview:Matrix_atrix];
    
    UILabel *declare = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 250, 60)];
    declare.center = CGPointMake(ViewCenterX, ViewCenterY + 150);
    declare.font = [UIFont systemFontOfSize:14];
    declare.text = @"@专为mlab矩阵实验室提供\n的学习交流平台";
    declare.numberOfLines = 2;
    declare.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:declare];
    
    UILabel *url = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 250, 30)];
    url.center = CGPointMake(ViewCenterX+50, ViewCenterY+200);
    url.font = [UIFont systemFontOfSize:14];
    url.text = @"http://mlab.njtech.edu.cn";
    [self.view addSubview:url];
    
    NSUserDefaults *userDefualt = [NSUserDefaults standardUserDefaults];
    NSString *username = [userDefualt objectForKey:@"USERNAME"];
    
    _login = [[UILoginTextField alloc]initWithFrame:CGRectMake(0, 0, 200, 30)];
    _login.delegate = self;
    _login.returnKeyType = UIReturnKeyDone;
    _login.placeholder = @"请输入你的工号";
    if (![username isEqualToString:@""] )
    {
        _login.text = username;
    }
    [_login setValue:[UIColor blackColor] forKeyPath:@"_placeholderLabel.textColor"];
    _login.center =  CGPointMake(ViewCenterX, ViewCenterY +20);
    [self.view addSubview:_login];
    
    
    UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 50, 30)];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button setTitle:@"登录" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(registerto) forControlEvents:UIControlEventTouchUpInside];
    button.center = CGPointMake(ViewCenterX, ViewCenterY+70);
    [self.view addSubview:button];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)textFieldDidBeginEditing:(UITextField *)textField;
{
//    textField.backgroundColor = [UIColor colorWithRed:210/255.0 green:210/255.0 blue:203/255.0 alpha:0.8];
//    [textField setValue:[UIColor blackColor] forKeyPath:@"_placeholderLabel.textColor"];
//
//    NSLog(@"qweqw");
}

- (void)textFieldDidEndEditing:(UITextField *)textField;
{
 //   [textField setValue:[UIColor whiteColor] forKeyPath:@"_placeholderLabel.textColor"];

}

- (BOOL)textFieldShouldReturn:(UITextField *)textField;
{
    [textField resignFirstResponder];
    return YES;
}

- (void)registerto {
    
    NSString *username = _login.text;
    if ([username isEqualToString:@""]) {
        UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"非法登录" message:@"请填写你的工号" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        [alertView show];
        return;

    }
    if ([username isEqualToString:@"汪小发"]) {
        _token = WANGXIAOFA_TOKEN_KEY;
    }
    else if ([username isEqualToString:@"刘凯阳"])
    {
        _token = LIUKAIYANG_TONKEN_KEY;
    }
    else if ([username isEqualToString:@"王娅楠"])
    {
        _token = WANGXYANAN_TONKEN_KEY;
    }
    else if ([username isEqualToString:@"吴友聪"])
    {
        _token = WUYOUCONG_TONKEN_KEY;
    }
    else if ([username isEqualToString:@"毕澍"])
    {
        _token = BISHU_TONKEN_KEY;
    }
    else{
        UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"非法登录" message:@"对不起～你不是mlab成员，不能进入聊天室" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        [alertView show];
        return;
    }
    
    NSUserDefaults *userDefualt = [NSUserDefaults standardUserDefaults];
    [userDefualt setObject:_login.text forKey:@"USERNAME"];
    [userDefualt setObject:_token forKey:@"USERTOKEN"];
    _token = [userDefualt objectForKey:@"USERTOKEN"];
    
    //NiX9ZvGIsAIXIMEoMpFUQBo6lCHML2t6tdfUnfdoD1zocua9MsU1Z5hRgy8HfhAgGUa/GBihQ1TcFYbSi8emfw==  666
    //VjiSb+qEno/giUr5zqB6aaWd2JxAhydhUgOm5mmDQjERbjidWK1kvYKBB1mfTqr6bgVifQGxLI/hZIT7UMjgfA==  123
    
    // 快速集成第二步，连接融云服务器
    [[RCIM sharedRCIM] connectWithToken:_token success:^(NSString *userId) {
        // Connect 成功
        NSLog(@"success,%@",userId);

//        NSArray *list1 = [[NSArray alloc]initWithObjects:@"1234",nil];
//        RCIMClient  *client = [[RCIMClient alloc]init];
//        
//        [client addMemberToDiscussion:@"111" userIdList:list1 success:^(RCDiscussion *discussion) {
//            NSLog(@"添加成功");
//        } error:^(RCErrorCode status) {
//            NSLog(@"添加失败");
//        }];
//
//        NSArray *list = [[NSArray alloc]initWithObjects:@"666",@"123",nil];
//        NSLog(@"%@",list);
//        [[RCIMClient sharedRCIMClient] createDiscussion:@"123" userIdList:list success:^(RCDiscussion *discussion) {
//            
//            NSLog(@"创建成功-------%@",discussion.discussionName);
//            
//            
//            [[RCIMClient sharedRCIMClient] setDiscussionName:discussion.discussionId name:@"wowow" success:^{
//                NSLog(@"修改成功1");
//
//            } error:^(RCErrorCode status) {
//                NSLog(@"修改失败1%ld",(long)status);
//
//            }];
//
//            
//            
//            
//        } error:^(RCErrorCode status) {
//            NSLog(@"创建失败");
//            
//        }];


    }
    error:^(RCConnectErrorCode status) {
        // Connect 失败
        NSLog(@"fail");
    }
    tokenIncorrect:^() {
        // Token 失效的状态处理
        NSLog(@"no effect");
    }];
    
    
        ConversationListViewController * chatListViewController=[[ConversationListViewController alloc]initWithDisplayConversationTypes:@[@(ConversationType_PRIVATE),@(ConversationType_DISCUSSION), @(ConversationType_APPSERVICE), @(ConversationType_PUBLICSERVICE),@(ConversationType_GROUP),@(ConversationType_SYSTEM)] collectionConversationType:@[@(ConversationType_GROUP),@(ConversationType_DISCUSSION)]];
    
    [self.navigationController pushViewController:chatListViewController animated:YES];

}



@end
