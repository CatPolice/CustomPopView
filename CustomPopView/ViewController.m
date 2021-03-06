//
//  ViewController.m
//  CustomPopView
//
//  Created by gavin on 2016/11/28.
//  Copyright © 2016年 gavin. All rights reserved.
//

#import "ViewController.h"
#import "CustomPopView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)show:(id)sender {
    
    //初始化需要弹出的view
    UIView *vp = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 300, 150)];
    vp.backgroundColor = [UIColor redColor];
    
    //将需要弹出的view添加到customView
    CustomPopView *customView = [[CustomPopView alloc] initWithFrame:self.view.bounds withShowView:vp];
    [customView showAnimationPopView];
    
    [customView setCustomPopViewCallBack:^(id obj) {
        NSLog(@"%@",obj);
    }];
    
    //将customview添加到当前视图中
    [self.view addSubview:customView];
    
}

@end
