//
//  pushAndDismissView.h
//  beautity_play
//
//  Created by user_kevin on 16/6/30.
//  Copyright © 2016年 user_kevin. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol pushAndDismissViewDelegate <NSObject>

- (void)backPoPView:(UIButton *)sender;
- (void)finishClick:(UIButton *)sender;

@end

@interface pushAndDismissView : UIView

@property(nonatomic,retain)UILabel * titleLabel;
@property(nonatomic,weak)id<pushAndDismissViewDelegate>delegate;

@end
