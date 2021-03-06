//
//  TabBar.m
//  CYBudejie
//
//  Created by Cyrill on 16/5/1.
//  Copyright © 2016年 Cyrill. All rights reserved.
//

#import "TabBar.h"
#import "CYPublishView.h"

@interface TabBar ()

@end

@implementation TabBar

- (nonnull instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        UIButton *publishButton = [[UIButton alloc] init];
        [publishButton setBackgroundImage:[UIImage imageNamed:@"tabBar_publish_icon"] forState:UIControlStateNormal];
        [publishButton setBackgroundImage:[UIImage imageNamed:@"tabBar_publish_click_icon"] forState:UIControlStateHighlighted];
        [self addSubview:publishButton];
        [publishButton makeConstraints:^(MASConstraintMaker *make) {
            make.center.equalTo(self);
            make.size.equalTo([publishButton backgroundImageForState:UIControlStateNormal].size);
        }];
        [publishButton addTarget:self action:@selector(publishClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return self;
}


- (void)publishClick
{
    [CYPublishView show];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    static BOOL added = NO;
    
    // 原来的4个
    CGFloat width = self.cy_width / 5;
    int index = 0;
    for (UIControl *control in self.subviews) {
        if (![control isKindOfClass:[UIControl class]] || [control isKindOfClass:[UIButton class]]) continue;
        control.cy_width = width;
        control.cy_x = index > 1 ? width * (index + 1) : width * index;
        index++;
        
        if (added == NO) {
            // 监听按钮点击
            [control addTarget:self action:@selector(controlClick) forControlEvents:UIControlEventTouchUpInside];
        }
    }
    
    added = YES;
}

- (void)controlClick {
    [CYNoteCenter postNotificationName:CYTabBarDidSelectNotification object:nil userInfo:nil];
}

@end
