//
//  TestViewController.m
//  DetectNetwork
//
//  Created by MiYa-ShaoCong on 17/4/13.
//  Copyright © 2017年 MiYa-ShaoCong. All rights reserved.
//

#import "TestViewController.h"
#import "ZSCDetectNetWork.h"


@interface TestViewController ()

@end

@implementation TestViewController

- (void)dealloc {
    NSLog(@"释放了。。。。。。。。");
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    self.title = @"测试";
    self.view.backgroundColor = [UIColor orangeColor];
    
    ZSCDetectNetWork *network = [ZSCDetectNetWork sharedInstance];
    [network startDetectNetwork:self.view];
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
