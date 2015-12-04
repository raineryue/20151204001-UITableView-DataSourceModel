//
//  StudentsModel.h
//  20151204001-UITableView-DataSourceModel
//
//  Created by Rainer on 15/12/4.
//  Copyright © 2015年 Rainer. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface StudentsModel : NSObject

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *footer;

@property (nonatomic, strong) NSArray *students;


@end
