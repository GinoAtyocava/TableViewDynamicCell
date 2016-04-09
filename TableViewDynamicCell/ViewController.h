//
//  ViewController.h
//  TableViewDynamicCell
//
//  Created by Gino on 16/4/6.
//  Copyright © 2016年 Gino. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface ViewController : UIViewController
@property (nonatomic,strong) NSArray *LayoutConstraints;

@property (nonatomic,strong) NSMutableArray *dataArray;
@property (nonatomic,strong) UITableView *mainTableView;


@end

