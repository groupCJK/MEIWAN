//
//  MineViewTableViewCell.m
//  beautity_play
//
//  Created by mac on 16/6/28.
//  Copyright © 2016年 user_kevin. All rights reserved.
//

#import "MineViewTableViewCell.h"

@implementation MineViewTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        UIImageView *titleImage = [[UIImageView alloc] initWithFrame:CGRectMake(15, 15, 20, 20)];
        [self addSubview:titleImage];
        self.titleImage = titleImage;
        
        UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(titleImage.frame.origin.x+titleImage.frame.size.width+20, 10, 100, 30)];
        [self addSubview:titleLabel];
        self.titleLabel = titleLabel;
        
        UIImageView *styleImage = [[UIImageView alloc] initWithFrame:CGRectMake(self.frame.size.width-30, 15, 20, 20)];
        [self addSubview:styleImage];
        self.titleStyleImage = styleImage;
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
