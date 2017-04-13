//
//  ZSCDetectNetWork.m
//  DetectNetwork
//
//  Created by MiYa-ShaoCong on 17/4/13.
//  Copyright © 2017年 MiYa-ShaoCong. All rights reserved.
//

#import "ZSCDetectNetWork.h"
#import "Reachability.h"
#import <Masonry/Masonry.h>

@interface ZSCDetectNetWork ()

@property (nonatomic, strong) Reachability *reachability;
@property (nonatomic, assign) NetworkStatus status;
@property (nonatomic, strong) UIImageView *photoImageView;
@property (nonatomic, strong) UIButton *detectBtn;
@property (nonatomic, strong) UIView *addView; //背景view

@end

@implementation ZSCDetectNetWork

static ZSCDetectNetWork *instance = nil;
+ (instancetype)sharedInstance
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance.addView = nil;
        instance.status = 10;
        instance = [[[self class] alloc] init];
        instance.photoImageView = [[UIImageView alloc] init];
        instance.photoImageView.image = [UIImage imageNamed:@"noNetwork"];
        [instance addSubview:instance.photoImageView];
        instance.detectBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        instance.detectBtn.titleLabel.font = [UIFont systemFontOfSize:14];
        [instance.detectBtn setTitle:@"网络状态待提升，点击重试" forState:UIControlStateNormal];
        [instance.detectBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [instance.detectBtn addTarget:instance action:@selector(refreshNetwork) forControlEvents:UIControlEventTouchUpInside];
        [instance addSubview:instance.detectBtn];
    });
    return instance;
}

+ (instancetype)allocWithZone:(struct _NSZone *)zone
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [super allocWithZone:zone];
    });
    return instance;
}


// 输出对应的网络状态
- (void)reachabilityStatus
{
    NetworkStatus status = self.reachability.currentReachabilityStatus;
    if (status == self.status) {
        
    }
    
    self.status = status;
    
    switch (status) {
        case NotReachable:
            NSLog(@"没有联网");
            
            instance.backgroundColor = [UIColor colorWithRed:239/255.0 green:239/255.0 blue:244/255.0 alpha:1];
            instance.frame = instance.addView.frame;
            [instance.addView addSubview:instance];
            
            [instance.photoImageView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(instance).offset(170);
                make.left.equalTo(instance).offset(instance.frame.size.width/2 - (198/2));
                make.width.mas_equalTo(198);
                make.height.mas_equalTo(151.5);
            }];
            
            [instance.detectBtn mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(instance.photoImageView.mas_bottom).offset(7);
                make.left.equalTo(instance);
                make.width.mas_equalTo(instance.frame.size.width);
                make.height.mas_equalTo(40);
            }];
            
            break;
            
        case ReachableViaWiFi:
            NSLog(@"连接的是WIFI");
            
            [instance removeFromSuperview];
            
            break;
            
        case ReachableVia4G:
            NSLog(@"连接的是4G");
            
            [instance removeFromSuperview];
            break;
            
        case ReachableVia3G:
            NSLog(@"连接的是3G");
            
            [instance removeFromSuperview];
            break;
            
        case ReachableVia2G:
            NSLog(@"连接的是2G");
            
            [instance removeFromSuperview];
            break;
            
        default:
            break;
    }
}

- (void)refreshNetwork {
    
    instance.reachability = [Reachability reachabilityWithHostName:@"baidu.com"];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(reachabilityStatus) name:kReachabilityChangedNotification object:nil];
    // 3.开始对网络的检测
    [instance.reachability startNotifier];
}

- (void)startDetectNetwork:(UIView *)view {
    
    instance.addView = view;
    
    
    instance.reachability = [Reachability reachabilityWithHostName:@"baidu.com"];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(reachabilityStatus) name:kReachabilityChangedNotification object:nil];
    // 3.开始对网络的检测
    [instance.reachability startNotifier];
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
