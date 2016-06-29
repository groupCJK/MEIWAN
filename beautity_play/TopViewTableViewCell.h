//
//  TopViewTableViewCell.h
//  beautity_play
//
//  Created by mac on 16/6/27.
//  Copyright © 2016年 user_kevin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TopViewTableViewCell : UITableViewCell

@property(nonatomic, strong)UIImageView *headImage;
@property(nonatomic, strong)UILabel *userName;
@property(nonatomic, strong)UILabel *userAge;
@property(nonatomic, strong)UIImageView *userSex;
@property(nonatomic, strong)UIImageView *hotImage;
@property(nonatomic, strong)UILabel *hotNumber;
@property(nonatomic, strong)UIImageView *location;
@property(nonatomic, strong)UILabel *locationNumber;

@end
