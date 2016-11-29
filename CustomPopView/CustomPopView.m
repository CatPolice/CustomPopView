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



- (instancetype)initWithFrame:(CGRect)frame withShowView:(UIView *)viewParam{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.showInView = [[UIView alloc] init];
        self.showInView = viewParam;
        
        self.backgroundView = [[UIView alloc] initWithFrame:frame];
        self.backgroundView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.3];
        
        CGSize size = self.backgroundView.frame.size;
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(size.width/2 - self.showInView.frame.size.width/2, size.height/2 - self.showInView.frame.size.height/2, self.showInView.frame.size.width, self.showInView.frame.size.height)];
        
        [view addSubview:self.showInView];
        [self.backgroundView addSubview:view];
        [self addSubview:self.backgroundView];
        self.backgroundColor = [[UIColor clearColor] colorWithAlphaComponent:0];
        
        
        [self showAnimationPopView];
        
    }
    return self;
}

-(void)setCustomPopViewCallBack:(CustomPopViewCallBack)popViewCallBack{
    _customPopViewCallBack = popViewCallBack;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)eventv{
    UITouch *touch = [touches anyObject];
    CGPoint touchPoint = [touch locationInView:self.showInView];
    if ([self.showInView pointInside:touchPoint withEvent:eventv]) {
        NSLog(@"YES");
    }else{
        NSLog(@"NO");
        _customPopViewCallBack(nil);
        [self disssmissAnimationPopView];
    }
}

//show 动画
- (void)showAnimationPopView{
    self.showInView.transform = CGAffineTransformMakeScale(0, 0);
//    self.transform = CGAffineTransformMakeScale(0, 0);
    [UIView animateWithDuration:0.6 delay:0 usingSpringWithDamping:0.55 initialSpringVelocity:0 options:UIViewAnimationOptionTransitionNone animations:^{
        
//        self.transform = CGAffineTransformMakeScale(1, 1);
        self.showInView.transform = CGAffineTransformMakeScale(1, 1);
        
    } completion:^(BOOL finished) {
        
    }];
    
}

// dissmiss 动画
- (void)disssmissAnimationPopView{
    
    [UIView animateKeyframesWithDuration:0.4 delay:0 options:UIViewKeyframeAnimationOptionRepeat animations:^{
        CABasicAnimation *basicAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
        basicAnimation.fromValue = @1.0f;
        basicAnimation.toValue = @0.f;
        basicAnimation.duration = 0.4;
        basicAnimation.removedOnCompletion = NO;
        basicAnimation.fillMode = kCAFillModeForwards;
        [self.showInView.layer addAnimation:basicAnimation forKey:@"scale"];
    } completion:^(BOOL finished) {
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self removeFromSuperview];
            NSLog(@"=====================");
            
        });
    }];
}

@end
