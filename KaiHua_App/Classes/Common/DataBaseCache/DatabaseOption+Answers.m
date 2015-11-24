//
//  DatabaseOption+Answers.m
//  healthApp
//
//  Created by yczx on 13-7-8.
//  Copyright (c) 2013年 yczx. All rights reserved.
//

#import "DatabaseOption+Answers.h"

@implementation DatabaseOption (Answers)

/* 将答案列表数据写入数据库*/
- (BOOL)writeAnswerDataToDatabase:(NSMutableArray *)array
{
   // NSLog(@"get in %s\n" , __func__);
    BOOL bol = NO;
    if (!array) {
        return bol;
    }
    
//    int i;
//    for (i = 0; i < [array count]; i++) {
//     AnswerData *data = [array objectAtIndex:i];
//        
//    NSString *sql = @"insert into T_ANSWER(id,text,answer_time,question_id,admin_id,admin_name,head_img,type) values(?,?,?,?,?,?,?,?)";
//    
//    NSArray *paramArray = [NSArray arrayWithObjects:data.answerID, data.text, data.answer_time, data.question_id, data.admin_id,data.admin_name,data.head_img,data.type, nil];
//    
//     bol = [self.fmdb executeUpdate:sql withArgumentsInArray:paramArray];
//    
//    }
    
    return bol;
}

/*查询 Answer 表中的全部数据*/
- (NSArray *)queryAnswerDataFromDatabaseByQuestinoID:(int) questionID
{

    NSString *sql = [NSString stringWithFormat:@"select * from T_ANSWER WHERE question_id = %i",questionID];
    
    NSMutableArray *QuestionList = [NSMutableArray array];
    
    
//    FMResultSet *resulet = [self.fmdb executeQuery:sql];
//    while ([resulet next]) {
//        
//        /*将数据封装成 QuestionData数据****/
//        AnswerData*data = [[AnswerData alloc]init];
//        data.answerID = [resulet stringForColumn:Field_Name_ANSWERID];
//        data.text = [resulet stringForColumn:Field_Name_ANSTEXT];
//        data.answer_time = [resulet stringForColumn:Field_Name_ANSWER_TIME];
//        data.question_id = [resulet stringForColumn:Field_Name_QUESTIONID];
//        data.admin_id = [resulet stringForColumn:Field_Name_ADMINID];
//        data.admin_name = [resulet stringForColumn:Field_Name_AdminName];
//        data.likecount = [resulet stringForColumn:Field_Name_LIKECOUNT];
//        data.head_img = [resulet stringForColumn:Field_Name_Admin_ICO];
//        data.type =[resulet stringForColumn:Field_Name_TYPE];
//        
//        [QuestionList addObject:data];
//    }
    
    return QuestionList;
}

/*清空 Answer表中的问题对应的数据*/
- (BOOL)deleteAnswerDataByQuestionID:(int)questionID
{

    NSString *sql = [NSString stringWithFormat:@"delete from T_ANSWER WHERE question_id = %i",questionID];
    
    BOOL bol = [self.fmdb executeStatements:sql];
    
    return bol;
}


@end
