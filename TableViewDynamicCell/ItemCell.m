//
//  ItemCell.m
//  TableViewDynamicCell
//
//  Created by Gino on 16/4/6.
//  Copyright © 2016年 Gino. All rights reserved.
//

#import "ItemCell.h"

@implementation ItemCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


-(void)layoutSubviews
{
    [super layoutSubviews];
    
    _avatarImageView.image = [UIImage imageNamed:_avatarImageName];
    _titleLabel.text = _title;
    
    
    
}

-(CGFloat)heightOfCell
{
    CGFloat n = 40.0f;
    
    CGSize imageSize = [UIImage imageNamed:_avatarImageName].size;
    
    CGFloat imageHeigh = (150.0f*imageSize.height)/imageSize.width;
    
    n += imageHeigh;
    
    return n;
}

@end
