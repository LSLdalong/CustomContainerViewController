//
//  ViewController.m
//  ContainerViewControllerDemo
//
//  Created by Jzzhou on 16/3/17.
//  Copyright © 2016年 Jzzhou. All rights reserved.
//

#import "ViewController.h"
#import "ZJZFirstViewController.h"
#import "ZJZSecondViewController.h"
#import "ZJZThirdViewController.h"
#import "ZJZForthViewController.h"

#define ZJZColor(r, g, b, a) [UIColor colorWithRed:r / 255.f green:g / 255.f blue:b / 255.f alpha:a]
#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height

@interface ViewController () <UIScrollViewDelegate>

@property (nonatomic, strong) ZJZFirstViewController *firstViewController;
@property (nonatomic, strong) ZJZSecondViewController *secondViewController;
@property (nonatomic, strong) ZJZThirdViewController *thirdViewController;
@property (nonatomic, strong) ZJZForthViewController *forthViewController;

@property (nonatomic, strong) UIViewController *currViewController;

@property (nonatomic, strong) UIScrollView *headScrollView;
@property (nonatomic, strong) NSArray *headArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"自定义控制器Demo";
    [self.navigationController.navigationBar setBarTintColor: ZJZColor(100, 149, 237, 1)];
    self.headArray = @[@"VC1", @"VC2", @"VC3", @"VC4"];

    self.automaticallyAdjustsScrollViewInsets = NO;
    self.headScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, 40)];
    self.headScrollView.backgroundColor = ZJZColor(213, 54, 65, 1);
    self.headScrollView.contentSize = CGSizeMake(520, 0);
    self.headScrollView.bounces = NO;
    self.headScrollView.pagingEnabled = YES;
    [self.view addSubview:_headScrollView];
    
    // 为headScrollView添加按钮
    for(int i = 0; i < _headArray.count; i++) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
        button.frame = CGRectMake(0 + i*130, 0, 130, 40);
        [button setTitle:_headArray[i] forState:UIControlStateNormal];
        button.tag = i;
        [button addTarget:self action:@selector(headBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
        [self.headScrollView addSubview:button];
    }
    
    // 添加addViewController
    self.firstViewController = [[ZJZFirstViewController alloc] init];
    [self.firstViewController.view setFrame:CGRectMake(0, 104, SCREEN_WIDTH, SCREEN_HEIGHT - 104)];
    [self addChildViewController:_firstViewController];
    
    self.secondViewController = [[ZJZSecondViewController alloc] init];
    [self.secondViewController.view setFrame:CGRectMake(0, 104, SCREEN_WIDTH, SCREEN_HEIGHT - 104)];
    [self addChildViewController:_secondViewController];
    
    self.thirdViewController = [[ZJZThirdViewController alloc] init];
    [self.thirdViewController.view setFrame:CGRectMake(0, 104, SCREEN_WIDTH, SCREEN_HEIGHT - 104)];
    [self addChildViewController:_thirdViewController];
    
    self.forthViewController = [[ZJZForthViewController alloc] init];
    [self.forthViewController.view setFrame:CGRectMake(0, 104, SCREEN_WIDTH, SCREEN_HEIGHT - 104)];
    [self addChildViewController:_forthViewController];
    
    [self.view addSubview:self.firstViewController.view];
    self.currViewController = self.firstViewController;
}

- (void)headBtnClicked:(UIButton *)button
{
    if ( (self.currViewController == _firstViewController && button.tag == 0 )||
        (self.currViewController == _secondViewController && button.tag == 1) ||
        (self.currViewController == _thirdViewController && button.tag == 2) ||
        (self.currViewController == _forthViewController && button.tag == 3) )
    {
        return;
    }
    else
    {
        switch (button.tag) {
            case 0:
                [self replaceController:_currViewController newController:_firstViewController];
                break;
            case 1:
                [self replaceController:_currViewController newController:_secondViewController];
                break;
            case 2:
                [self replaceController:_currViewController newController:_thirdViewController];
                break;
            case 3:
                [self replaceController:_currViewController newController:_forthViewController];
                break;
                
            default:
                break;
        }
    }
}
- (void)replaceController:(UIViewController*)oldViewController newController:(UIViewController*)newViewController{
    [self transitionFromViewController:newViewController
                      toViewController:oldViewController
                              duration:0.5
                               options:UIViewAnimationOptionTransitionCrossDissolve
                            animations:nil
                            completion:^(BOOL finished) {
                                if (finished) {
                                    [newViewController didMoveToParentViewController:self];
                                    [oldViewController willMoveToParentViewController:nil];
                                    
                                    [oldViewController.view removeFromSuperview];
                                    [self.view addSubview:newViewController.view];
                                    
                                    self.currViewController = newViewController;
                                } else {
                                    self.currViewController = oldViewController;
                                }
                            }];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}

@end
