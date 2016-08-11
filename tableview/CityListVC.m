//
//  CityListVC.m
//  AtourLife
//
//  Created by Anasue on 16/2/25.
//  Copyright © 2016年 Anasue. All rights reserved.
//

#import "CityListVC.h"

@interface CityListVC ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *cityTableView;


@property (nonatomic, strong) NSArray *values;
@property (nonatomic, strong) NSArray *cityTitles;
@property (nonatomic, strong) NSArray *capitalTitle;
@property (nonatomic, strong) NSMutableArray *cityNames;
@property (nonatomic, strong) NSMutableArray *hotCityNames;

@end

@implementation CityListVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupData];
    [self getCitiesHttpRequest];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

- (void)setupData {
    self.cityTitles = [NSArray array];
    self.capitalTitle = [NSArray array];
    self.values = [NSArray array];
    [self refreshData];
}

- (void)refreshData {
    [self.cityTableView reloadData];
}

- (void)getCitiesHttpRequest {
    
    _cityTitles       = [[NSArray alloc] initWithObjects:
                           @"A",@"C",@"F",@"G",@"H",@"M",@"S",@"T",@"X",@"Z", nil];
    _capitalTitle       = [[NSArray alloc] initWithObjects:
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
    [self refreshData];
}

- (UITableView *)cityTableView {
    if (!_cityTableView) {
        _cityTableView = [[UITableView alloc]init];
        _cityTableView.frame = self.view.bounds;
        _cityTableView.userInteractionEnabled = YES;
        _cityTableView.tableHeaderView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 100, 100)];
        
        _cityTableView.tableFooterView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 100, 100)];
        _cityTableView.delegate = self;
        _cityTableView.dataSource = self;
        [self.view addSubview:_cityTableView];
    }
    return _cityTableView;
}




#pragma mark - UITableViewDelegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    if (tableView == self.cityTableView) {
        return self.capitalTitle.count;
    }else {
        return 1;
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
        return [self.capitalTitle[section] count];

}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    if (tableView == self.cityTableView) {
        return [self.cityTitles objectAtIndex:section];
    }else {
        return nil;
    }
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UILabel *lab = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 300, 10)];
    lab.text = [NSString stringWithFormat:@"    %@",[self.cityTitles objectAtIndex:section]];
    lab.textColor = [UIColor blackColor];

    return lab;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (tableView == self.cityTableView) {
        return 20;
    }else {
        return 0;
    }
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    for(UIView *view in [tableView subviews])
    {
        if([[[view class] description] isEqualToString:@"UITableViewIndex"])
        {
            NSLog(@"%@",view);
            [view performSelector:@selector(setFont:) withObject:[UIFont systemFontOfSize:14]];
        }
    }
    static NSString *cellIdentifier = @"cityCell";
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if(!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }

        cell.textLabel.text = [[self.capitalTitle objectAtIndex:indexPath.section] objectAtIndex:indexPath.row];
        tableView.sectionIndexBackgroundColor = [UIColor clearColor];
        tableView.sectionIndexColor = [UIColor redColor];

    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *cityName;
    if (tableView == self.cityTableView) {
        if (self.cityClickBlock) {
            cityName = [[self.capitalTitle objectAtIndex:indexPath.section] objectAtIndex:indexPath.row];
            self.cityClickBlock(nil,cityName);
        }
    }else {
        if (self.cityClickBlock) {
            cityName = [self.values objectAtIndex:indexPath.row];
            self.cityClickBlock(nil,cityName);
        }
        
    }
//    [[CacheManager sharedCacheManager] cacheCurrentCityWith:cityName];
    [self.navigationController popViewControllerAnimated:YES];
}

- (NSArray<NSString *> *)sectionIndexTitlesForTableView:(UITableView *)tableView {
    if (tableView == self.cityTableView) {
        return self.cityTitles;
    }else {
        return 0;
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
