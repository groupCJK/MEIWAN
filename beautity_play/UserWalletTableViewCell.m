//
//  UserWalletTableViewCell.m
//  beautity_play
//
//  Created by mac on 16/7/5.
//  Copyright © 2016年 user_kevin. All rights reserved.
//

#import "UserWalletTableViewCell.h"

@implementation UserWalletTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        UILabel *moneyTitle = [[UILabel alloc] initWithFrame:CGRectMake(15, 15, 120, 15)];
        [self addSubview:moneyTitle];
        self.moneyTitle = moneyTitle;
        
        UILabel *money = [[UILabel alloc] initWithFrame:CGRectMake(width_screen-100, 15, 60, 15)];
        [self addSubview:money];
        self.money = money;
        self.money.hidden = YES;
        
        UILabel *withdrawal = [[UILabel alloc] initWithFrame:CGRectMake(width_screen-50, 15, 60, 15)];
        [self addSubview:withdrawal];
        self.withdrawalTitle = withdrawal;
    }
    return self;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
