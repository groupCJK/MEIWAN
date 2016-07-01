//
//  VPTribeSegmentedControl.h
//  beautity_play
//
//  Created by 钟伟迪 on 15/6/17.
//  Copyright (c) 2015年 zjh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VPTribeSegmentedControl : UIView

@property (assign ,nonatomic , readonly)NSInteger numberOfSegments;

@property (assign , nonatomic)NSInteger selectedIndex;

@property (strong , nonatomic)UIColor * tintColor;

- (id)initWithFrame:(CGRect)frame withItems:(NSArray *)items;

- (void)addTarget:(id)target action:(SEL)action;

@end
