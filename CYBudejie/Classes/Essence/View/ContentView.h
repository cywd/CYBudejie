//
//  ContentView.h
//  CYBudejie
//
//  Created by Cyrill on 16/6/28.
//  Copyright © 2016年 Cyrill. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Topic;

@interface ContentView : UIView

@property (strong, nonatomic) Topic *topic;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end
