//
//  ViewController.m
//  ChartsTest
//
//  Created by wyhaiapple on 2017/3/25.
//  Copyright © 2017年 钱李林. All rights reserved.
//

#import "ViewController.h"
#import "HistoryDateCell.h"
#import "HistoryDateModel.h"
#import "MJExtension.h"
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
/** 表格 */
@property(strong,nonatomic) UITableView *tableView;
@property(strong,nonatomic) NSArray *historyArray;

@end

@implementation ViewController
static NSString *HistoryDateCellID = @"HistoryDateCellId";

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupTableView];
    [self initJson];
       
}


#pragma mark - JSON 解析
-(void)initJson{
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"test" ofType:@"json"];
    NSData *jdata = [[NSData alloc]initWithContentsOfFile:filePath];

    NSDictionary *hisDict = [NSJSONSerialization JSONObjectWithData:jdata options:kNilOptions error:nil];
    self.historyArray = [HistoryDateModel mj_objectArrayWithKeyValuesArray:hisDict[@"data"]];
}

#pragma mark - 设置表格
-(void)setupTableView{
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
//    self.tableView.backgroundColor = [UIColor redColor];
    for (UIView *subView in self.tableView.subviews) {
        if ([subView isKindOfClass:[UIScrollView class]]) {
            ((UIScrollView *)subView).delaysContentTouches = NO;
        }
    }
    self.tableView.delaysContentTouches = NO;
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([HistoryDateCell class]) bundle:nil] forCellReuseIdentifier:HistoryDateCellID];
    
    [self.view addSubview:self.tableView];



}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    HistoryDateCell *cell = [tableView dequeueReusableCellWithIdentifier:HistoryDateCellID];
    cell.historyDate = self.historyArray;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 320;

}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
