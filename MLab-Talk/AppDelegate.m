//
//  AppDelegate.m
//  MLab-Talk
//
//  Created by apple on 15/12/2.
//  Copyright © 2015年 wangxiaofa. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import <RongIMKit/RongIMKit.h>
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    /**
     * 推送处理1
     */
    if ([application
         respondsToSelector:@selector(registerUserNotificationSettings:)]) {
        UIUserNotificationSettings *settings = [UIUserNotificationSettings
                                                settingsForTypes:(UIUserNotificationTypeBadge |
                                                                  UIUserNotificationTypeSound |
                                                                  UIUserNotificationTypeAlert)
                                                categories:nil];
        [application registerUserNotificationSettings:settings];
    } else {
        UIRemoteNotificationType myTypes = UIRemoteNotificationTypeBadge |
        UIRemoteNotificationTypeAlert |
        UIRemoteNotificationTypeSound;
        [application registerForRemoteNotificationTypes:myTypes];
    }
    
    
    self.window = [[UIWindow alloc]initWithFrame:[[UIScreen mainScreen] bounds]];
    ViewController *viewController = [[ViewController alloc]initWithNibName:nil bundle:nil];
    UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:viewController];
    [nav.navigationBar setBarTintColor:[UIColor colorWithRed:195/255.0 green:201/255.0 blue:206/255.0 alpha:1.0]];
    [nav.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor blackColor],UITextAttributeTextColor,nil]];

    self.window.rootViewController = nav;
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    //初始化融云SDK。
    [[RCIM sharedRCIM] initWithAppKey:@"pwe86ga5e0wr6" ];
    // 设置用户信息提供者。
    [[RCIM sharedRCIM] setUserInfoDataSource:self];
    // 设置群组信息提供者。
    [[RCIM sharedRCIM] setGroupUserInfoDataSource:self];
   [[RCIM sharedRCIM] setGroupInfoDataSource:self];
    return YES;
}

/**
 * 推送处理2
 */
//注册用户通知设置
- (void)application:(UIApplication *)application
didRegisterUserNotificationSettings:
(UIUserNotificationSettings *)notificationSettings {
    // register to receive notifications
    [application registerForRemoteNotifications];
}



// 获取苹果推送权限成功。
- (void)application:(UIApplication *)application
didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken {
    NSString *token =
    [[[[deviceToken description] stringByReplacingOccurrencesOfString:@"<"
                                                           withString:@""]
      stringByReplacingOccurrencesOfString:@">"
      withString:@""]
     stringByReplacingOccurrencesOfString:@" "
     withString:@""];
    
    [[RCIMClient sharedRCIMClient] setDeviceToken:token];
}

// 获取用户信息的方法。
-(void)getUserInfoWithUserId:(NSString *)userId completion:(void(^)(RCUserInfo* userInfo))completion
{
    
    NSLog(@"userid----------%@",userId);
    

    
    // 此处最终代码逻辑实现需要您从本地缓存或服务器端获取用户信息。
    if ([@"mlabId_1" isEqual:userId]) {
            RCUserInfo *user = [[RCUserInfo alloc]init];
            user.userId = @"mlabId_1";
            user.name = @"汪小发";
            user.portraitUri = @"http://img4.duitang.com/uploads/item/201510/07/20151007124603_4Tj2K.jpeg";

            return completion(user);
        }

    if ([@"mlabId_2" isEqual:userId]) {
        RCUserInfo *user = [[RCUserInfo alloc]init];
        user.userId = @"mlabId_2";
        user.name = @"刘凯阳";
        user.portraitUri = @"http://b.hiphotos.baidu.com/zhidao/pic/item/0b7b02087bf40ad153f700a5562c11dfa9ecce61.jpg";
        return completion(user);
    }
    
    if ([@"mlabId_3" isEqual:userId]) {
        RCUserInfo *user = [[RCUserInfo alloc]init];
        user.userId = @"mlabId_3";
        user.name = @"吴友聪";
        user.portraitUri = @"http://www.itouxiang.net/uploads/allimg/140403/1_140403085708_1.jpg";
        
        return completion(user);
    }
    if ([@"mlabId_4" isEqual:userId]) {
        RCUserInfo *user = [[RCUserInfo alloc]init];
        user.userId = @"mlabId_4";
        user.name = @"毕澍";
        user.portraitUri = @"http://v1.qzone.cc/avatar/201306/08/21/20/51b32fbadff76742.jpg%21200x200.jpg";
        
        return completion(user);
    }
    if ([@"mlabId_5" isEqual:userId]) {
        RCUserInfo *user = [[RCUserInfo alloc]init];
        user.userId = @"mlabId_5";
        user.name = @"王娅楠";
        user.portraitUri = @"http://www.ttoou.com/qqtouxiang/allimg/120514/co1205140H423-2-lp.jpg";
        
        return completion(user);
    }
    
    

    return completion(nil);
}

- (void)getUserInfoWithUserId:(NSString *)userId inGroup:(NSString *)groupId
                   completion:(void (^)(RCUserInfo *userInfo))completion;
{
    if ([@"mlab" isEqual:groupId]) {
        RCUserInfo *user = [[RCUserInfo alloc]init];
        user.userId = @"mlabId_5";
        user.name = @"王娅楠";
        user.portraitUri = @"http://www.ttoou.com/qqtouxiang/allimg/120514/co1205140H423-2-lp.jpg";
    }
    
    return completion(nil);

}

// 获取群组信息的方法。
-(void)getGroupInfoWithGroupId:(NSString*)groupId completion:(void (^)(RCGroup *group))completion
{
    // 此处最终代码逻辑实现需要您从本地缓存或服务器端获取群组信息。
    NSLog(@"2e21132131231231313");
    
    if ([@"mlab" isEqual:groupId]) {
        RCGroup *group = [[RCGroup alloc]init];
        group.groupId = @"mlab";
        group.groupName = @"矩阵成员聊天室";
        group.portraitUri = @"http://img4.duitang.com/uploads/item/201510/07/20151007124603_4Tj2K.jpeg";
        
        return completion(group);
    }
    
    return completion(nil);
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
