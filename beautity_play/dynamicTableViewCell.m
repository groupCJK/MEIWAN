//
//  dynamicTableViewCell.m
//  beautity_play
//
//  Created by user_kevin on 16/6/29.
//  Copyright © 2016年 user_kevin. All rights reserved.
//

#import "dynamicTableViewCell.h"
#import "headerName.pch"

@implementation dynamicTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        UIImageView * headImage = [[UIImageView alloc]initWithFrame:CGRectMake(10, 10, 52, 52)];
        headImage.layer.cornerRadius = 26;
        headImage.clipsToBounds = YES;
        headImage.backgroundColor = RGB(166, 166, 166);
        [self addSubview:headImage];
        
        //昵称
        UILabel * nickname = [[UILabel alloc]init];
        nickname.font = [UIFont systemFontOfSize:12.0];
        nickname.text = @"RainBow";
        CGSize size = [nickname.text sizeWithAttributes:[NSDictionary dictionaryWithObjectsAndKeys:nickname.font,NSFontAttributeName, nil]];
        nickname.frame = CGRectMake(headImage.frame.origin.x+headImage.frame.size.width+10, headImage.frame.origin.y+10, size.width, size.height);
        [self addSubview:nickname];
        
        //浏览次数
        UILabel * lookNumber = [[UILabel alloc]init];
        lookNumber.font = [UIFont systemFontOfSize:12.0];
        lookNumber.text = @"浏览3次";
        lookNumber.textColor = RGB(181, 193, 193);
        CGSize lookSize = [lookNumber.text sizeWithAttributes:[NSDictionary dictionaryWithObjectsAndKeys:lookNumber.font,NSFontAttributeName, nil]];
        lookNumber.frame = CGRectMake(nickname.frame.origin.x, nickname.frame.size.height+nickname.frame.origin.y+4, lookSize.width, lookSize.height);
        [self addSubview:lookNumber];
        //发表的心情
        UILabel * feelingsLabel  =[[UILabel alloc]init];
        feelingsLabel.font = [UIFont systemFontOfSize:10.0];
        feelingsLabel.text = @"做主播的可以找我，出去约的可以找我，出去撸的也可以找我";
        feelingsLabel.numberOfLines = 0;
        feelingsLabel.textColor = [UIColor blackColor];
        
        //计算多行文字高度
        CGSize feelingSize = [feelingsLabel.text boundingRectWithSize:CGSizeMake(width_screen-10-nickname.frame.origin.x, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:[NSDictionary dictionaryWithObjectsAndKeys:feelingsLabel.font,NSFontAttributeName, nil] context:nil].size;
        
        feelingsLabel.frame = CGRectMake(nickname.frame.origin.x, lookNumber.frame.size.height+lookNumber.frame.origin.y+8, width_screen-10-nickname.frame.origin.x, feelingSize.height);
        [self addSubview:feelingsLabel];
        
        //年龄
        UILabel * age = [[UILabel alloc]init];
        age.font = [UIFont systemFontOfSize:12.0];
        age.textColor = RGB(181, 193, 193);
        age.text = @"22";
        CGSize ageSize = [age.text sizeWithAttributes:[NSDictionary dictionaryWithObjectsAndKeys:age.font,NSFontAttributeName, nil]];
        age.frame = CGRectMake(nickname.frame.size.width+nickname.frame.origin.x + 5, nickname.frame.origin.y, ageSize.width, ageSize.height);
        [self addSubview:age];
        //
        UIImageView * sexImage = [[UIImageView alloc]init];
        sexImage.center = CGPointMake(age.center.x+age.bounds.size.width+8, age.center.y);
        sexImage.bounds = CGRectMake(0, 0, 12, 12);
        sexImage.image = [UIImage imageNamed:@"nvsheng_logo"];
        [self addSubview:sexImage];
        
        //
        UILabel * dynamicTime = [[UILabel alloc]init];
        dynamicTime.font =  [UIFont systemFontOfSize:10.0];
        dynamicTime.text = @"今天 15:27";
        dynamicTime.textColor = age.textColor;
        CGSize timeSize = [dynamicTime.text sizeWithAttributes:[NSDictionary dictionaryWithObjectsAndKeys:dynamicTime.font,NSFontAttributeName, nil]];
        dynamicTime.center = CGPointMake(width_screen-10-timeSize.width/2, age.center.y);
        dynamicTime.bounds = CGRectMake(0, 0, timeSize.width, timeSize.height);
        [self addSubview:dynamicTime];
        
        
        //
        UIImageView * image = [[UIImageView alloc]initWithFrame:CGRectMake(10, feelingsLabel.frame.origin.y+feelingsLabel.frame.size.height, width_screen-20, 100)];
        image.backgroundColor = [UIColor grayColor];
        [self addSubview:image];
        
        //
        UIButton * share = [UIButton buttonWithType:UIButtonTypeCustom];
        [share setImage:[UIImage imageNamed:@"'"] forState:UIControlStateNormal];
        share.frame = CGRectMake(width_screen-60, image.frame.origin.y+image.frame.size.height+10, 15, 15);
        [self addSubview:share];

    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
