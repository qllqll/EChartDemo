//
//  HistoryDateCell.m
//  ZYIMC
//
//  Created by wyhaiapple on 2017/3/24.
//  Copyright © 2017年 钱李林. All rights reserved.
//

#import "HistoryDateCell.h"
#import "HistoryDateModel.h"
#import <WebKit/WebKit.h>
#import "TimeTools.h"

#define BTN_BACKCOLOR JdryRGBColorAlpha(25, 180, 212, 0.2)
#define SELECTBTN_BACKCOLOR JdryColorFromHex(0xFFFFFF)
/* 颜色进行宏定义 */
#define JdryColorFromHex(s)  [UIColor colorWithRed:(((s & 0xFF0000) >> 16))/255.0 green:(((s &0xFF00) >>8))/255.0 blue:((s &0xFF))/255.0 alpha:1.0]
#define JdryRGBColor(r,g,b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]
#define JdryRGBColorAlpha(r,g,b,a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:a];
#define BACK_COLOR JdryColorFromHex(0xE8F0F2)
#define BLUE_COLOR JdryColorFromHex(0x19B5D4)
#define RED_COLOR JdryColorFromHex(0xF95656)

/* 获取设备屏幕的大小 */
#define JdryScreeWidth [UIScreen mainScreen].bounds.size.width
#define JdryScreeHeight [UIScreen mainScreen].bounds.size.height
#define JdryScreeBounds [UIScreen mainScreen].bounds
@interface HistoryDateCell ()<WKNavigationDelegate>
@property (weak, nonatomic) IBOutlet UIButton *dayBtn;
@property (weak, nonatomic) IBOutlet UIButton *monthBtn;
@property (weak, nonatomic) IBOutlet UIButton *yearBtn;
/** echart */
@property(strong,nonatomic) WKWebView *wkWebView;
/** xAxisData */
@property(strong,nonatomic) NSString *xAxisData;
/** 总 */
@property(strong,nonatomic) NSMutableString *valueDat;
/** A */
@property(strong,nonatomic) NSMutableString *valueDatA;
/** B */
@property(strong,nonatomic) NSMutableString *valueDatB;
/** C */
@property(strong,nonatomic) NSMutableString *valueDatC;
/** X轴 */
@property(strong,nonatomic) NSMutableString *xAxis;

@end

@implementation HistoryDateCell

- (void)awakeFromNib {
    [super awakeFromNib];
 
    self.xAxis = [NSMutableString string];
    [self setEcharts:self.webContentView];
}

-(void)setHistoryDate:(NSArray *)historyDate{
    _historyDate = historyDate;
    self.subType = @"cos";
    self.timeType = @"2";
    [self selectSubType:self.subType timeType:_timeType];
}

-(void)selectSubType:(NSString *)subType timeType:(NSString *)timeType{
    self.valueDat = [NSMutableString string];
    self.valueDatA = [NSMutableString string];
    self.valueDatB = [NSMutableString string];
    self.valueDatC = [NSMutableString string];
    
    if ([subType isEqualToString:@"I"]) {
        for (HistoryDateModel *model in _historyDate) {
            [_valueDatA appendString:[NSString stringWithFormat:@"'%@',",model.ia]];
            [_valueDatB appendString:[NSString stringWithFormat:@"'%@',",model.ib]];
            [_valueDatC appendString:[NSString stringWithFormat:@"'%@',",model.ic]];
        }
    }else if ([subType isEqualToString:@"U"]){
        for (HistoryDateModel *model in _historyDate) {
            [_valueDatA appendString:[NSString stringWithFormat:@"'%@',",model.ua]];
            [_valueDatB appendString:[NSString stringWithFormat:@"'%@',",model.ub]];
            [_valueDatC appendString:[NSString stringWithFormat:@"'%@',",model.uc]];
        }
    }else if ([subType isEqualToString:@"P"]){
        for (HistoryDateModel *model in _historyDate) {
            [_valueDat appendString:[NSString stringWithFormat:@"'%@',",model.p]];
            [_valueDatA appendString:[NSString stringWithFormat:@"'%@',",model.pa]];
            [_valueDatB appendString:[NSString stringWithFormat:@"'%@',",model.pb]];
            [_valueDatC appendString:[NSString stringWithFormat:@"'%@',",model.pc]];
        }
    }else if ([subType isEqualToString:@"Q"]){
        for (HistoryDateModel *model in _historyDate) {
            [_valueDat appendString:[NSString stringWithFormat:@"'%@',",model.q]];
            [_valueDatA appendString:[NSString stringWithFormat:@"'%@',",model.qa]];
            [_valueDatB appendString:[NSString stringWithFormat:@"'%@',",model.qb]];
            [_valueDatC appendString:[NSString stringWithFormat:@"'%@',",model.qc]];
        }
    }else if ([subType isEqualToString:@"S"]){
        for (HistoryDateModel *model in _historyDate) {
            [_valueDat appendString:[NSString stringWithFormat:@"'%@',",model.s]];
            [_valueDatA appendString:[NSString stringWithFormat:@"'%@',",model.sa]];
            [_valueDatB appendString:[NSString stringWithFormat:@"'%@',",model.sb]];
            [_valueDatC appendString:[NSString stringWithFormat:@"'%@',",model.sc]];
        }
    }else if ([subType isEqualToString:@"cos"]){
        for (HistoryDateModel *model in _historyDate) {
            [_valueDat appendString:[NSString stringWithFormat:@"'%@',",model.cos]];
            [_valueDatA appendString:[NSString stringWithFormat:@"'%@',",model.cosa]];
            [_valueDatB appendString:[NSString stringWithFormat:@"'%@',",model.cosb]];
            [_valueDatC appendString:[NSString stringWithFormat:@"'%@',",model.cosc]];
        }
    }
    
    for (HistoryDateModel *model in _historyDate) {
        if ([timeType isEqualToString:@"0"]) {
            [_xAxis appendString:[NSString stringWithFormat:@"'%@',",[TimeTools timeWithDateAndHourAndMIn:model.fixTimeDate]]];
        }else if ([timeType isEqualToString:@"1"]){
            [_xAxis appendString:[NSString stringWithFormat:@"'%@',",[TimeTools timeWithDayAndMonthString:model.fixTimeDate]]];
        }else if ([timeType isEqualToString:@"2"]){
            [_xAxis appendString:[NSString stringWithFormat:@"'%@月',",[TimeTools timeWithDateAndMonth:model.fixTimeDate]]];
        }
        
    }
    
    
    if (![subType isEqualToString:@"I"] && ![subType isEqualToString:@"U"]) {
        [_valueDat deleteCharactersInRange:NSMakeRange(_valueDat.length -1, 1)];
    }
    [_valueDatA deleteCharactersInRange:NSMakeRange(_valueDatA.length -1, 1)];
    [_valueDatB deleteCharactersInRange:NSMakeRange(_valueDatB.length -1, 1)];
    [_valueDatC deleteCharactersInRange:NSMakeRange(_valueDatC.length -1, 1)];
    [_xAxis deleteCharactersInRange:NSMakeRange(_xAxis.length -1, 1)];
}

#pragma mark - 设置echarts
-(void)setEcharts:(UIView *)contentView{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"HistoryData" ofType:@"html"];
    self.wkWebView = [[WKWebView alloc] initWithFrame:CGRectMake(0, 0, JdryScreeWidth - 30, 406)];
    if(path){
        if ([[UIDevice currentDevice].systemVersion floatValue] >= 9.0) {
            NSURL *fileURL = [NSURL fileURLWithPath:path];
            [self.wkWebView loadFileURL:fileURL allowingReadAccessToURL:fileURL];
        } else {
            NSURL *fileURL = [self fileURLForBuggyWKWebView8:[NSURL fileURLWithPath:path]];
            NSURLRequest *request = [NSURLRequest requestWithURL:fileURL];
            [self.wkWebView loadRequest:request];
        }
    }
    self.wkWebView.navigationDelegate = self;
    [contentView addSubview: self.wkWebView];
}

- (NSURL *)fileURLForBuggyWKWebView8:(NSURL *)fileURL {
    NSError *error = nil;
    if (!fileURL.fileURL || ![fileURL checkResourceIsReachableAndReturnError:&error]) {
        return nil;
    }
    // Create "/temp/www" directory
    NSFileManager *fileManager= [NSFileManager defaultManager];
    NSURL *temDirURL = [[NSURL fileURLWithPath:NSTemporaryDirectory()] URLByAppendingPathComponent:@"www"];
    [fileManager createDirectoryAtURL:temDirURL withIntermediateDirectories:YES attributes:nil error:&error];
    
    NSURL *dstURL = [temDirURL URLByAppendingPathComponent:fileURL.lastPathComponent];
    // Now copy given file to the temp directory
    [fileManager removeItemAtURL:dstURL error:&error];
    [fileManager copyItemAtURL:fileURL toURL:dstURL error:&error];
    // Files in "/temp/www" load flawlesly :)
    return dstURL;
}

-(void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation{

    [self.wkWebView evaluateJavaScript:[NSString stringWithFormat:@"setValueDate([%@])",_valueDat] completionHandler:^(id dict, NSError * error) {
        NSLog(@"%@",error);

    }];
    
    [self.wkWebView evaluateJavaScript:[NSString stringWithFormat:@"setValueDateA([%@])",_valueDatA] completionHandler:^(id dict, NSError * error) {
        NSLog(@"%@",error);

    }];
    
    [self.wkWebView evaluateJavaScript:[NSString stringWithFormat:@"setValueDateB([%@])",_valueDatB]completionHandler:^(id dict, NSError * error) {
        NSLog(@"%@",error);

    }];
    
    [self.wkWebView evaluateJavaScript:[NSString stringWithFormat:@"setValueDateC([%@])",_valueDatC] completionHandler:^(id dict, NSError * error) {
        NSLog(@"%@",error);

    }];
    
    [self.wkWebView evaluateJavaScript:[NSString stringWithFormat:@"setXAxisData([%@])",_xAxis]
completionHandler:^(id dict, NSError * error) {
        NSLog(@"%@",error);
        
    }];

    [self.wkWebView evaluateJavaScript:[NSString stringWithFormat:@"setSubType('%@')",self.subType]
 completionHandler:^(id dict, NSError * error) {
    
        
    
        NSLog(@"%@",error);

    }];
    [self.wkWebView evaluateJavaScript:@"update()" completionHandler:^(id dict, NSError * error) {
        NSLog(@"%@",error);
        
    }];
  
   
}

-(void)setFrame:(CGRect)frame{
    frame.origin.y = frame.origin.y += 10;
    frame.size.height = frame.size.height -= 10;
    
    [super setFrame:frame];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (IBAction)selectDay:(UIButton *)sender {
    sender.backgroundColor = SELECTBTN_BACKCOLOR;
    self.monthBtn.backgroundColor = BTN_BACKCOLOR;
    self.yearBtn.backgroundColor = BTN_BACKCOLOR;
}


- (IBAction)selectMonth:(UIButton *)sender {
    sender.backgroundColor = SELECTBTN_BACKCOLOR;
    self.dayBtn.backgroundColor = BTN_BACKCOLOR;
    self.yearBtn.backgroundColor = BTN_BACKCOLOR;
}


- (IBAction)selectYear:(UIButton *)sender {
    sender.backgroundColor = SELECTBTN_BACKCOLOR;
    self.monthBtn.backgroundColor = BTN_BACKCOLOR;
    self.dayBtn.backgroundColor = BTN_BACKCOLOR;
}

@end
