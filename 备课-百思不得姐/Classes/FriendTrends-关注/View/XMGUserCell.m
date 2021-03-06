//
//  XMGUserCell.m
//  3期-百思不得姐
//
//  Created by xiaomage on 15/9/20.
//  Copyright (c) 2015年 xiaomage. All rights reserved.
//

#import "XMGUserCell.h"
#import "XMGFollowUser.h"

@interface XMGUserCell()
@property (weak, nonatomic) IBOutlet UIImageView *headerImageView;
@property (weak, nonatomic) IBOutlet UILabel *screenNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *fansCountLabel;
@end

@implementation XMGUserCell

- (void)setUser:(XMGFollowUser *)user
{
    _user = user;
    
    [self.headerImageView setHeader:user.header];
    self.screenNameLabel.text = user.screen_name;
    
    if (user.fans_count >= 10000) {
        self.fansCountLabel.text = [NSString stringWithFormat:@"%.1f万人关注", user.fans_count / 10000.0];
    } else {
        self.fansCountLabel.text = [NSString stringWithFormat:@"%zd人关注", user.fans_count];
    }
}
@end
