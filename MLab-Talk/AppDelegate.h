//
//  AppDelegate.h
//  MLab-Talk
//
//  Created by apple on 15/12/2.
//  Copyright © 2015年 wangxiaofa. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <RongIMKit/RongIMKit.h>
#import <RongIMLib/RongIMLib.h>
@interface AppDelegate : UIResponder <UIApplicationDelegate, RCIMUserInfoDataSource,RCIMGroupInfoDataSource,RCIMGroupUserInfoDataSource>

@property (strong, nonatomic) UIWindow *window;

@end

