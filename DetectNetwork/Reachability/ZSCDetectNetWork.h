//
//  ZSCDetectNetWork.h
//  DetectNetwork
//
//  Created by MiYa-ShaoCong on 17/4/13.
//  Copyright © 2017年 MiYa-ShaoCong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZSCDetectNetWork : UIView

+ (instancetype)sharedInstance;

- (void)startDetectNetwork:(UIView *)view;

@end
