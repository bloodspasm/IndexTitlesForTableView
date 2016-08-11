//
//  ViewController.m
//  tableview
//
//  Created by bloodspasm on 2016/08/10.
//  Copyright © 2016年 bloodspasm. All rights reserved.
//

#import "ViewController.h"
#import "UITableView+LCL.h"
#import "CityListVC.h"
#import "SViewController.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>{
    NSArray *sectionTitles; // 每个分区的标题
    NSArray *contentsArray; // 每行的内容
}
//GCD - 延迟0.1
#define kDISPATCH_AFTER(mainQueueBlock) dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{mainQueueBlock});

@property (strong, nonatomic) UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"索引";
    sectionTitles       = [[NSArray alloc] initWithObjects:@"A",@"C",@"F",@"G",@"H",@"M",@"S",@"T",@"X",@"Z", nil];
    contentsArray       = [[NSArray alloc] initWithObjects:
                           @[@"阿伟",@"阿姨",@"阿三"],
                           @[@"蔡芯",@"成龙",@"陈鑫",@"陈丹",@"成名"],
                           @[@"芳仔",@"房祖名",@"方大同",@"芳芳",@"范伟"],
                           @[@"郭靖",@"郭美美",@"过儿",@"过山车"],
                           @[@"何仙姑",@"和珅",@"郝歌",@"好人"],
                           @[@"妈妈",@"毛主席"],
                           @[@"孙中山",@"沈冰",@"婶婶"],
                           @[@"涛涛",@"淘宝",@"套娃"],
                           @[@"小二",@"夏紫薇",@"许巍",@"许晴"],
                           @[@"周恩来",@"周杰伦",@"张柏芝",@"张大仙"],nil];
    self.tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    self.tableView.userInteractionEnabled = YES;
    self.tableView.tableHeaderView = [[UIView alloc]init];
    self.tableView.tableFooterView = [[UIView alloc]init];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    kDISPATCH_AFTER(
        SViewController * view = [[SViewController alloc]init];
        [self.navigationController pushViewController:view animated:NO];
    )
    [self.view addSubview:self.tableView];
}

#pragma mark --

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [contentsArray count];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [contentsArray[section] count];
}

-(CGFloat)tableView:(UITableView*)tableView heightForHeaderInSection:(NSInteger)section
{
    
    //返回分区头的高度
    
    //数据类型必须为CGFloat
    return 23.0;
    
}



-(CGFloat)tableView:(UITableView*)tableView heightForFooterInSection:(NSInteger)section
{
    
    //返回分区尾的高度
    
    //数据类型必须为CGFloat
    return 1.0;
}



-(CGFloat)tableView:(UITableView*)tableView heightForRowAtIndexPath:(NSIndexPath*)indexPath

{
    
    //每行的高度
    
    //数据类型必须为CGFloat
    return 44;
}



-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    cell.textLabel.text = contentsArray[indexPath.section][indexPath.row];
    [tableView  setSectionIndexFont:[UIFont systemFontOfSize:25] textColor:[UIColor blueColor]];
    [tableView setSectionIndexBackgroundColor:[UIColor colorWithWhite:.5 alpha:1]];
    return cell;

}





#pragma mark --

#pragma mark 自定义 titleof section

// 每个分区的页眉
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return [sectionTitles objectAtIndex:section];
}
// 索引目录
-(NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView
{
    return sectionTitles;
}

// 点击目录
-(NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index
{
    // 获取所点目录对应的indexPath值
    NSIndexPath *selectIndexPath = [NSIndexPath indexPathForRow:0 inSection:index];
    
    // 让table滚动到对应的indexPath位置
    [tableView scrollToRowAtIndexPath:selectIndexPath atScrollPosition:UITableViewScrollPositionBottom animated:YES];
    
    return index;
}



//点击 indexPath
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
