//
//  ItemCell.h
//  TableViewDynamicCell
//
//  Created by Gino on 16/4/6.
//  Copyright © 2016年 Gino. All rights reserved.
//

#import <UIKit/UIKit.h>

#define ItemCellId          @"ItemCell"

@interface ItemCell : UITableViewCell

@property (nonatomic,strong) IBOutlet UIImageView *avatarImageView;
@property (nonatomic,strong) IBOutlet UILabel *titleLabel;



@property (nonatomic,copy) NSString *avatarImageName;
@property (nonatomic,copy) NSString *title;


-(CGFloat)heightOfCell;

@end
