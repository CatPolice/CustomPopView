//
//  CustomPopView.m
//  CustomPopView
//
//  Created by gavin on 2016/11/28.
//  Copyright © 2016年 gavin. All rights reserved.
//

#import "CustomPopView.h"

@implementation CustomPopView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}



- (instancetype)initWithFrame:(CGRect)frame withView:(UIView *)viewParam{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        self.backgroundView = [[UIView alloc] initWithFrame:frame];
        self.backgroundView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.5];
        
        CGSize size = self.backgroundView.frame.size;
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(size.width/2 - viewParam.frame.size.width/2, size.height/2 - viewParam.frame.size.height/2, viewParam.frame.size.width, viewParam.frame.size.height)];
        
        [view addSubview:viewParam];
        [self.backgroundView addSubview:view];
        [self addSubview:self.backgroundView];
        self.backgroundColor = [[UIColor clearColor] colorWithAlphaComponent:0];
        
        
        [self showAnimationPopView];
        
    }
    return self;
}



//show动画
- (void)showAnimationPopView{
    
    self.transform = CGAffineTransformMakeScale(0, 0);
    [UIView animateWithDuration:0.6 delay:0 usingSpringWithDamping:0.55 initialSpringVelocity:0 options:UIViewAnimationOptionTransitionNone animations:^{
        
        self.transform = CGAffineTransformMakeScale(1, 1);
        
    } completion:^(BOOL finished) {
        
    }];
}

//// dissmiss 动画
//- (void)disssmissAnimationPopView{
//    
//    //设置还原 window 的 leavel
//    self.window.windowLevel = self.windowLevel;
//    
//    [UIView animateKeyframesWithDuration:0.4 delay:0 options:UIViewKeyframeAnimationOptionRepeat animations:^{
//        CABasicAnimation *basicAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
//        basicAnimation.fromValue = @1.0f;
//        basicAnimation.toValue = @0.f;
//        basicAnimation.duration = 0.4;
//        basicAnimation.removedOnCompletion = NO;
//        basicAnimation.fillMode = kCAFillModeForwards;
//        [self.layer addAnimation:basicAnimation forKey:@"scale"];
//    } completion:^(BOOL finished) {
//        
//        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.4 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//            [self.bottomButton removeFromSuperview];
//            
//        });
//    }];
//}
//
////画图动画
//- (void)drawRectAnimation{
//    
//    CABasicAnimation *basicAnimation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
//    basicAnimation.fromValue = @0;
//    basicAnimation.toValue = @1;
//    basicAnimation.duration = 0.6;
//    [self.shaperLayer addAnimation:basicAnimation forKey:@"strokeEnd"];
//}

@end
