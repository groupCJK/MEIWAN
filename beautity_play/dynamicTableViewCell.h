//
//  dynamicTableViewCell.h
//  beautity_play
//
//  Created by user_kevin on 16/6/29.
//  Copyright © 2016年 user_kevin. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol dynamicTableViewCellDelegate <NSObject>

/**点赞按钮点击方法*/
-(void)praiseClick:(UIButton *)sender;
/**评论按钮点击方法*/
- (void)commentClick:(UIButton *)sender;
/**分享按钮点击方法*/
- (void)shareClick:(UIButton *)sender;

@end

@interface dynamicTableViewCell : UITableViewCell

/**用户头像*/
@property(nonatomic,assign)UIImageView * headImage;
/**昵称*/
@property(nonatomic,assign)UILabel * nickname;
/**年龄*/
@property(nonatomic,assign)UILabel * age;
/**性别*/
@property(nonatomic,assign)UIImageView * sex;
/**发布时间*/
@property(nonatomic,assign)UILabel * timeRelease;
/**浏览次数*/
@property(nonatomic,assign)UILabel * looksCount;
/**心情说说*/
@property(nonatomic,assign)UILabel * feelings;
/**展示图片*/
@property(nonatomic,assign)UIImageView * showImage;
/**点赞次数*/
@property(nonatomic,assign)UILabel * praiseCount;
/**信息数量*/
@property(nonatomic,assign)UILabel * MessageCount;
/**点赞*/
@property(nonatomic,assign)UIButton * praise;
/**评论*/
@property(nonatomic,assign)UIButton * Message;
/**分享*/
@property(nonatomic,assign)UIButton * share;

@property(nonatomic,weak)id<dynamicTableViewCellDelegate>delegate;

@end
