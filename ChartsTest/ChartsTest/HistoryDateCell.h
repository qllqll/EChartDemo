//
//  HistoryDateCell.h
//  ZYIMC
//
//  Created by wyhaiapple on 2017/3/24.
//  Copyright © 2017年 钱李林. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HistoryDateCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIView *webContentView;
/** 数组 */
@property(strong,nonatomic) NSArray *historyDate;
/** subType */
@property(strong,nonatomic) NSString *subType;
/** timeType */
@property(strong,nonatomic) NSString *timeType;
@end
