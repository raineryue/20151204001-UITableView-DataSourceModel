//
//  ViewController.m
//  20151204001-UITableView-DataSourceModel
//
//  Created by Rainer on 15/12/4.
//  Copyright © 2015年 Rainer. All rights reserved.
//

#import "ViewController.h"
#import "StudentsModel.h"

@interface ViewController () <UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic, strong) NSArray *studentArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // 设置tableView的内边距，避开状态栏
    self.tableView.contentInset = UIEdgeInsetsMake(20, 0, 0, 0);
}

/**
 *  返回UITableView分组数
 */
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.studentArray.count;
}

/**
 *  返回UITableView当前分组行数
 */
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    StudentsModel *studentsModel = self.studentArray[section];
    
    return studentsModel.students.count;
}

/**
 *  返回UITableView的单元格
 */
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *tableViewCell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    
    StudentsModel *studentsModel = self.studentArray[indexPath.section];
    
    NSString *textTitle = studentsModel.students[indexPath.row];
    
    tableViewCell.textLabel.text = textTitle;
    
    return tableViewCell;
}

/**
 *  返回UITableView头部标题
 */
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    StudentsModel *studentsModel = self.studentArray[section];
    
    return studentsModel.title;
}

/**
 *  返回UITableView尾部标题
 */
- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section {
    return [self.studentArray[section] footer];
}

/**
 *  懒加载创建学生数据源信息
 */
- (NSArray *)studentArray {
    if (nil == _studentArray) {
        // 1.创建第一组学生信息
        StudentsModel *studentsModel1 = [[StudentsModel alloc] init];
        
        studentsModel1.title = @"第一组学生信息";
        studentsModel1.footer = @"这是一批牛逼闪闪亮的学生";

        NSMutableArray *students1 = [NSMutableArray array];
        
        for (int i = 0; i < 20; i++) {
            NSString *student = [NSString stringWithFormat:@"牛逼闪闪亮学生%d", i];
            
            [students1 addObject:student];
        }
        
        studentsModel1.students = students1;
        
        // 2.创建第二组学生信息
        StudentsModel *studentsModel2 = [[StudentsModel alloc] init];
        
        studentsModel2.title = @"第二批学生信息";
        studentsModel2.footer = @"这是一批傻逼闪闪亮的学生";
        
        NSMutableArray *students2 = [NSMutableArray array];
        
        for (int i = 0; i < 50; i++) {
            NSString *student = [NSString stringWithFormat:@"傻逼闪闪亮学生%d", i];
            
            [students2 addObject:student];
        }
        
        studentsModel2.students = students2;
        
        _studentArray = @[studentsModel1, studentsModel2];
    }
    
    return _studentArray;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
