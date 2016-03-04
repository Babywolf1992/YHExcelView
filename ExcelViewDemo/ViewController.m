//
//  ViewController.m
//  ExcelViewDemo
//
//  Created by Yahui on 16/3/4.
//  Copyright © 2016年 Yahui. All rights reserved.
//

#import "ViewController.h"
#import "YHExcel.h"

@interface ViewController ()<YHExcelTitleViewDataSource,YHExcelViewDataSource>

@property (weak, nonatomic) IBOutlet YHExcelTitleView *titleView;
@property (weak, nonatomic) IBOutlet YHExcelView *excelView;
@property (strong, nonatomic) NSArray *titleArray;
@property (strong, nonatomic) NSArray *colWidthArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.excelView.showBorder = YES;
    self.excelView.borderWidth = 1;
    self.excelView.borderColor = [UIColor blueColor];
    self.titleArray = @[@"一",@"二",@"三",@"四",@"五",@"六",@"七",@"八",@"九"];
    self.colWidthArray = @[@(35.0),@(35.0),@(35.0),@(35.0),@(35.0),@(35.0),@(35.0),@(35.0),@(40.0)];
//    self.titleArray = @[@"一",@"二",@"三",@"四",@"五",@"六",@"七",@"八",@"九"];
//    self.colWidthArray = @[@(35.0),@(35.0),@(35.0),@(35.0),@(35.0),@(35.0),@(35.0),@(35.0),@(40.0)];
    self.titleView.dataSource = self;
    self.excelView.dataSource = self;
}
#pragma mark - YHExcelTitleViewDataSource
- (NSInteger)excelTitleViewItemCount:(YHExcelTitleView *)titleView {
    return self.titleArray.count;
}

- (NSString *)excelTitleView:(YHExcelTitleView *)titleView titleNameAtIndex:(NSInteger)index {
    return self.titleArray[index];
}

- (CGFloat)excelTitleView:(YHExcelTitleView *)titleView widthForItemAtIndex:(NSInteger)index
{
    return [self.colWidthArray[index] doubleValue] * ([UIScreen mainScreen].bounds.size.width/320);
}

#pragma mark - YHExcelViewDataSource
- (NSInteger)excelView:(YHExcelView *)excelView columnCountAtIndexPath:(NSIndexPath *)indexPath {
    return self.titleArray.count;
//    return ((indexPath.row) % 9 ) + 1;
}

- (CGFloat)excelView:(YHExcelView *)excelView widthForColumnAtIndex:(YHExcelViewIndexPath *)indexPath {
    return [self.colWidthArray[indexPath.col] doubleValue] * ([UIScreen mainScreen].bounds.size.width/320);
}

- (YHExcelViewColumn *)excelView:(YHExcelView *)excelView columnForRowAtIndexPath:(YHExcelViewIndexPath *)indexPath {
    YHExcelViewColumn *col = [excelView dequeueReusableColumnWithIdentifier:@"col"];
    if (col == nil) {
        col = [[YHExcelViewColumn alloc] initWithReuseIdentifier:@"col"];
        col.textLabel.font = [UIFont systemFontOfSize:10];
    }
    NSString *text = [NSString stringWithFormat:@"%@行%@列",@(indexPath.row),@(indexPath.col)];
    col.textLabel.text = text;
    return col;
}

- (NSInteger)numberOfSectionsInExcelView:(YHExcelView *)excelView {
    return 1;
}

- (NSInteger)excelView:(YHExcelView *)excelView numberOfRowsInSection:(NSInteger)section {
    return 20;
}

@end
