//
//  CustomPopView.h
//  CustomPopView
//
//  Created by gavin on 2016/11/28.
//  Copyright © 2016年 gavin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomPopView : UIView


@property (nonatomic , strong)UIView *backgroundView;


- (instancetype)initWithFrame:(CGRect)frame withView:(UIView *)viewParam;

@end
