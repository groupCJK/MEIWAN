//
//  playerInfoTableViewCell.h
//  beautity_play
//
//  Created by mac on 16/7/5.
//  Copyright © 2016年 user_kevin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface playerInfoTableViewCell : UITableViewCell

@property (nonatomic, strong)UIImageView *playerHeadImage;

@property (nonatomic, strong)UILabel *playerName;

@property (nonatomic, strong)UILabel *playerAge;

@property (nonatomic, strong)UILabel *playerSex;

@property (nonatomic, strong)UIView *locationView;

@property (nonatomic, strong)UIImageView *locationImage;

@property (nonatomic, strong)UILabel *playerDistance;

@property (nonatomic, strong)UILabel *lastLoginTime;

@property (nonatomic, strong)UILabel *playerID;

@property (nonatomic, strong)UILabel *playerSign;


@end
