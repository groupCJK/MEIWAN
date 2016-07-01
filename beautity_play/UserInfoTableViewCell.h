//
//  UserInfoTableViewCell.h
//  beautity_play
//
//  Created by mac on 16/6/30.
//  Copyright © 2016年 user_kevin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UserInfoTableViewCell : UITableViewCell<UITextFieldDelegate>

@property (nonatomic, strong)UILabel *userInfoTitle;
@property (nonatomic, strong)UILabel *userInfoDetail;
@property (nonatomic, strong)UIButton *manButton;
@property (nonatomic, strong)UIButton *WomanButton;
@property (nonatomic, strong)UITextField *userInfoEdit;
@property (nonatomic, strong)UILabel *line;

@end
