//
//  UserInfoTableViewCell.m
//  beautity_play
//
//  Created by mac on 16/6/30.
//  Copyright © 2016年 user_kevin. All rights reserved.
//

#import "UserInfoTableViewCell.h"

@implementation UserInfoTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        UILabel *title = [[UILabel alloc] initWithFrame:CGRectMake(10, (self.frame.size.height/2+20/2)/2, 68, 20)];
        [self addSubview:title];
        self.userInfoTitle = title;
        
        UITextField *editUserInfo = [[UITextField alloc] initWithFrame:CGRectMake(title.frame.origin.x+title.frame.size.width+5, (self.frame.size.height/2+title.frame.size.height/2)/2, self.frame.size.width-title.frame.size.width-15, 20)];
        editUserInfo.textAlignment = NSTextAlignmentLeft;
        [self addSubview:editUserInfo];
        self.userInfoEdit = editUserInfo;
        self.userInfoEdit.hidden = YES;
        
        UILabel *detail = [[UILabel alloc] initWithFrame:CGRectMake(title.frame.origin.x+title.frame.size.width+5, (self.frame.size.height/2+title.frame.size.height/2)/2, self.frame.size.width-40, 20)];
        detail.textAlignment = NSTextAlignmentLeft;
        [self addSubview:detail];
        self.userInfoDetail = detail;
        
        NSLog(@"%f",self.frame.size.height);
        
        UILabel *line = [[UILabel alloc] initWithFrame:CGRectMake(title.frame.origin.x+title.frame.size.width+1, self.frame.origin.x+self.frame.size.height+4, self.frame.size.width, 1)];
        line.backgroundColor = [UIColor redColor];
        [self addSubview:line];
        self.line = line;
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
