//
//  DatabaseOption+Answers.h
//  healthApp
//
//  Created by yczx on 13-7-8.
//  Copyright (c) 2013年 yczx. All rights reserved.
//

#import "DatabaseOption.h"

@interface DatabaseOption (Answers)

/* 将答案列表数据写入数据库*/
- (BOOL)writeAnswerDataToDatabase:(NSMutableArray *)array;

/*查询 Answer 表中的全部数据*/
- (NSArray *)queryAnswerDataFromDatabaseByQuestinoID:(int) questionID;


/*清空 Answer表中的问题对应的数据*/
- (BOOL)deleteAnswerDataByQuestionID:(int)questionID;



@end
