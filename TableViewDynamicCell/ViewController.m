//
//  ViewController.m
//  TableViewDynamicCell
//
//  Created by Gino on 16/4/6.
//  Copyright © 2016年 Gino. All rights reserved.
//

#import "ViewController.h"
#import "ItemCell.h"

#define TAG_ITEM_CELL       200

@interface ViewController ()
<UITableViewDataSource,
UITableViewDelegate
>
{
//    UITableView *mainTableView;
//    NSMutableArray *dataArray;
    
    ItemCell *templateCell;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self initDataArray];
    [self buildUI];
    
    
    //修改图片
    
    __weak __typeof(&*self)weakSelf = self;
    
    dispatch_time_t time = dispatch_time(DISPATCH_TIME_NOW, (int64_t) 3.0 * NSEC_PER_SEC);

    
    dispatch_after(time,dispatch_get_main_queue(), ^{
        
        CommonCellData *item2 = [(NSMutableArray *)[weakSelf.dataArray objectAtIndex:0] objectAtIndex:1];
        
        item2.leftTitle = @"avatar1";
        
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:1 inSection:0];
        NSArray *indexPathArray = [NSArray arrayWithObjects:indexPath, nil];
        
        [weakSelf.mainTableView reloadRowsAtIndexPaths:indexPathArray withRowAnimation:UITableViewRowAnimationFade];
        
    });
}


-(void)initDataArray
{
    if (!_dataArray) {
        _dataArray = [NSMutableArray array];
    }
    
    [_dataArray removeAllObjects];
    
    NSMutableArray *section0 = [NSMutableArray arrayWithCapacity:1];
    
    CommonCellData *item1 = [CommonCellData new];
    item1.TAG = TAG_ITEM_CELL;
    item1.leftTitle = @"default_avatar";
    item1.rightTitle = @"this is the first avatar.方形的";
    
    CommonCellData *item2 = [CommonCellData new];
    item2.TAG = TAG_ITEM_CELL;
    item2.leftTitle = @"default_avatar";
    item2.rightTitle = @"this is the second avatar.长条形的";
    
    [section0 addObject:item1];
    [section0 addObject:item2];
    
    [_dataArray addObject:section0];
    
    
    
}


-(void)buildUI
{
    [self initTemplateCell];
    [self initMainTableView];
}

-(void)initTemplateCell
{
    NSArray *nib = [[NSBundle mainBundle] loadNibNamed:ItemCellId owner:self options:nil];
    if ([nib count]>0)
    {
        templateCell = [nib objectAtIndex:0];
    }
    
    
}

-(void)initMainTableView
{
    _mainTableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
    
    _mainTableView.backgroundColor = [UIColor clearColor];
    
    _mainTableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    
    
    _mainTableView.dataSource = self;
    _mainTableView.delegate = self;
    
    
    UINib *tipCardNib = [UINib nibWithNibName:ItemCellId bundle:nil];
    [_mainTableView registerNib:tipCardNib forCellReuseIdentifier:ItemCellId];
    
    
    
    [self.view addSubview:_mainTableView];
    
    
    
    if ([_mainTableView respondsToSelector:@selector(setSeparatorInset:)]) {
        
        [_mainTableView setSeparatorInset:UIEdgeInsetsZero];
        
    }
    
    if ([_mainTableView respondsToSelector:@selector(setLayoutMargins:)]) {
        
        [_mainTableView setLayoutMargins:UIEdgeInsetsZero];
        
    }
    
}

-(void)initConstraints
{
    
    [_mainTableView autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:0.0f];
    [_mainTableView autoPinEdgeToSuperviewEdge:ALEdgeBottom withInset:0.0f];
    
    
    [_mainTableView autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:0.0f];
    [_mainTableView autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:0.0f];
    
}

-(CommonCellData *)dataAtIndexPath:(NSIndexPath *)indexPath
{
    NSInteger section = indexPath.section;
    NSInteger row = indexPath.row;
    
    return [[_dataArray objectAtIndex:section] objectAtIndex:row];
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    // Return the number of sections.
    
    return [_dataArray count];
    
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSInteger n = [((NSArray *)_dataArray[section]) count];
    return n;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    CommonCellData *item = [self dataAtIndexPath:indexPath];
    
    CGFloat n = 44.0f;
    
    switch (item.TAG) {
        case TAG_ITEM_CELL:
        {
            templateCell.avatarImageName = item.leftTitle;
            templateCell.title = item.rightTitle;
            
            [templateCell setNeedsUpdateConstraints];
            [templateCell updateConstraintsIfNeeded];
    
            [templateCell setNeedsLayout];
            [templateCell layoutIfNeeded];
    
    
            CGFloat height = [templateCell.contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize].height;
    
            
            height += 1.0f;
            
            n = height;
            
            
//            n = [templateCell heightOfCell];
            
            if (n < 190.0f) {
                n = 190.0f;
            }
        }
            
            break;
            
        default:
            break;
    }
    
    
    
    return n;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    
    CGFloat n = 0.0000001f;
    return n;
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    CGFloat n = 0.00001f;
    

    return n;
}




- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CommonCellData *item = [self dataAtIndexPath:indexPath];
    switch (item.TAG) {
        case TAG_ITEM_CELL:{
            
            ItemCell *cell = [tableView dequeueReusableCellWithIdentifier:ItemCellId forIndexPath:indexPath];
            
   
            cell.avatarImageName = item.leftTitle;
            cell.title = item.rightTitle;
            

            
            [cell setNeedsLayout];
        
            
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            cell.userInteractionEnabled = YES;
            
            return cell;
            
        }
            
        default:
            break;
    }
    
    
    
    return nil;
    
}

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if ([cell respondsToSelector:@selector(setSeparatorInset:)]){
        [cell setSeparatorInset:UIEdgeInsetsZero];
    }
    
    if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
        [cell setLayoutMargins:UIEdgeInsetsZero];
    }
    
}



-(void)updateViewConstraints
{
    //新方法
    [self.LayoutConstraints autoRemoveConstraints];
    
    
    self.LayoutConstraints = [UIView autoCreateConstraintsWithoutInstalling:^{
        [self initConstraints];
    }];
    
    
    [self.LayoutConstraints autoInstallConstraints];
    
    [super updateViewConstraints];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
