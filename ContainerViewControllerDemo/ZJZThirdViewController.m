//
//  ZJZThirdViewController.m
//  ContainerViewControllerDemo
//
//  Created by Jzzhou on 16/3/17.
//  Copyright © 2016年 Jzzhou. All rights reserved.
//

#import "ZJZThirdViewController.h"

@interface ZJZThirdViewController ()

@end

@implementation ZJZThirdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor grayColor];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(30, 250, 50, 50)];
    label.text = @"VC3";
    [self.view addSubview:label];
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
