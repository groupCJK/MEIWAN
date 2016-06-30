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
        self.headImage = headImage;
        //昵称
        UILabel * nickname = [[UILabel alloc]init];
        nickname.font = [UIFont systemFontOfSize:12.0];
        nickname.text = @"RainBow";
        CGSize size = [nickname.text sizeWithAttributes:[NSDictionary dictionaryWithObjectsAndKeys:nickname.font,NSFontAttributeName, nil]];
        nickname.frame = CGRectMake(headImage.frame.origin.x+headImage.frame.size.width+10, headImage.frame.origin.y+10, size.width, size.height);
        [self addSubview:nickname];
        self.nickname = nickname;
        //浏览次数
        UILabel * lookNumber = [[UILabel alloc]init];
        lookNumber.font = [UIFont systemFontOfSize:12.0];
        lookNumber.text = @"浏览3次";
        lookNumber.textColor = RGB(181, 193, 193);
        CGSize lookSize = [lookNumber.text sizeWithAttributes:[NSDictionary dictionaryWithObjectsAndKeys:lookNumber.font,NSFontAttributeName, nil]];
        lookNumber.frame = CGRectMake(nickname.frame.origin.x, nickname.frame.size.height+nickname.frame.origin.y+4, lookSize.width, lookSize.height);
        [self addSubview:lookNumber];
        self.looksCount = lookNumber;
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
        self.feelings = feelingsLabel;
        //年龄
        UILabel * age = [[UILabel alloc]init];
        age.font = [UIFont systemFontOfSize:12.0];
        age.textColor = RGB(181, 193, 193);
        age.text = @"22";
        CGSize ageSize = [age.text sizeWithAttributes:[NSDictionary dictionaryWithObjectsAndKeys:age.font,NSFontAttributeName, nil]];
        age.frame = CGRectMake(nickname.frame.size.width+nickname.frame.origin.x + 5, nickname.frame.origin.y, ageSize.width, ageSize.height);
        [self addSubview:age];
        self.age = age;
        //
        UIImageView * sexImage = [[UIImageView alloc]init];
        sexImage.center = CGPointMake(age.center.x+age.bounds.size.width+8, age.center.y);
        sexImage.bounds = CGRectMake(0, 0, 12, 12);
        sexImage.image = [UIImage imageNamed:@"nvsheng_logo"];
        [self addSubview:sexImage];
        self.sex = sexImage;
        //
        UILabel * dynamicTime = [[UILabel alloc]init];
        dynamicTime.font =  [UIFont systemFontOfSize:10.0];
        dynamicTime.text = @"今天 15:27";
        dynamicTime.textColor = age.textColor;
        CGSize timeSize = [dynamicTime.text sizeWithAttributes:[NSDictionary dictionaryWithObjectsAndKeys:dynamicTime.font,NSFontAttributeName, nil]];
        dynamicTime.center = CGPointMake(width_screen-10-timeSize.width/2, age.center.y);
        dynamicTime.bounds = CGRectMake(0, 0, timeSize.width, timeSize.height);
        [self addSubview:dynamicTime];
        self.timeRelease = dynamicTime;
        
        //
        UIImageView * image = [[UIImageView alloc]initWithFrame:CGRectMake(10, feelingsLabel.frame.origin.y+feelingsLabel.frame.size.height, width_screen-20, 100)];
        image.backgroundColor = [UIColor grayColor];
        [self addSubview:image];
        self.showImage = image;
        //分享图片 按钮
        UIImageView * share = [[UIImageView alloc]init];
        share.image = [UIImage imageNamed:@"fenxiang"];
        share.frame = CGRectMake(width_screen-40, image.frame.origin.y+image.frame.size.height+10, 15, 15);
        
        UIButton * ShareButton = [UIButton buttonWithType:UIButtonTypeCustom];
        ShareButton.center = share.center;
        ShareButton.bounds = CGRectMake(0, 0, 30, 30);
        [ShareButton addTarget:self action:@selector(ShareButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:ShareButton];
        [self addSubview:share];
        self.share = ShareButton;
        //信息图片 按钮
        
        UIImageView * message = [[UIImageView alloc]init];
        message.center = CGPointMake(ShareButton.center.x-50, ShareButton.center.y);
        message.bounds = CGRectMake(0, 0, 15, 15);
        message.image = [UIImage imageNamed:@"xinxi"];
        
        UIButton * messageButton = [UIButton buttonWithType:UIButtonTypeCustom];
        messageButton.center = message.center;
        messageButton.bounds = CGRectMake(0, 0, 30, 30);
        [messageButton addTarget:self action:@selector(MessageButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:messageButton];
        [self addSubview:message];
        self.Message = messageButton;
        /**信息数量*/
        UILabel * messageLabel = [[UILabel alloc]init];
        messageLabel.font = [UIFont systemFontOfSize:10.0];
        messageLabel.text = @"120";
        CGSize messagesize = [messageLabel.text sizeWithAttributes:[NSDictionary dictionaryWithObjectsAndKeys:messageLabel.font,NSFontAttributeName, nil]];
        messageLabel.frame = CGRectMake(message.frame.size.width+message.frame.origin.x + 3, message.center.y - messagesize.height/2, messagesize.width + 5, messagesize.height);
        messageLabel.textColor = RGB(181, 193, 193);
        [self addSubview:messageLabel];
        self.MessageCount = messageLabel;
        
        //点赞图片 按钮
        
        UIImageView * praise = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"dianzan"]];
        praise.center = CGPointMake(messageButton.center.x-50, messageButton.center.y);
        praise.bounds = CGRectMake(0, 0, 15, 15);
        UIButton * touchPraise = [UIButton buttonWithType:UIButtonTypeCustom];
        touchPraise.center = praise.center;
        touchPraise.bounds = CGRectMake(0, 0, 30, 30);
        [touchPraise addTarget:self action:@selector(TouchiPrsiseClick:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:touchPraise];
        [self addSubview:praise];
        self.praise = touchPraise;
        /**点赞数量*/
        UILabel * dianNumber = [[UILabel alloc]init];
        dianNumber.font = messageLabel.font;
        dianNumber.text = @"12";
        CGSize numsize = [dianNumber.text sizeWithAttributes:[NSDictionary dictionaryWithObjectsAndKeys:dianNumber.font,NSFontAttributeName, nil]];
        dianNumber.center = CGPointMake(praise.center.x+praise.bounds.size.width/2+10, praise.center.y);
        dianNumber.bounds = CGRectMake(0, 0, numsize.width, numsize.height);
        [self addSubview:dianNumber];
        self.praiseCount = dianNumber;

        UIImageView * lineColor = [[UIImageView alloc]initWithFrame:CGRectMake(0, 230, width_screen, 10)];
        lineColor.backgroundColor = RGB(170, 184, 184);
        [self addSubview:lineColor];
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
- (void)TouchiPrsiseClick:(UIButton *)sender
{
    NSLog(@"点赞");
    [self.delegate praiseClick:sender];
}
- (void)MessageButtonClick:(UIButton *)sender
{
    NSLog(@"信息");
    [self.delegate commentClick:sender];
}
- (void)ShareButtonClick:(UIButton *)sender
{
    NSLog(@"分享");
    [self.delegate shareClick:sender];
}

@end
