//
//  FormatData.m
//  请求下来的数据转化成数据对象
//
//  AppDelegate.h
//  ShouGouAPP
//
//  Created by yczx on 13-3-25.
//  Copyright (c) 2013年 yczx. All rights reserved.
//

#import "FormatData.h"
#import "UserInfo.h"
//#import "HomePageModule"

static FormatData *fdata;

@implementation FormatData

+ (id)shareInstance
{
	if(fdata == nil)
	{
		fdata = [[self alloc] init];
	}
	return fdata;
}


- (NSMutableArray *)formatDictToQuestionData:(NSArray *)dictArray
{
    NSMutableArray *tempArray = [[[NSMutableArray alloc]init]autorelease];
    
//    for (int i = 0; i < [dictArray count]; i ++) {
//        QuestionData *data = [[QuestionData alloc]init];
//        
//        NSDictionary *dict = [dictArray objectAtIndex:i];        
//        data.questionID = [[Util shareInstance] checkNullString:[dict objectForKey:Field_Name_Questionid]];
//        data.title = [[Util shareInstance] checkNullString:[dict objectForKey:Field_Name_TITLE]];
//        data.text = [[Util shareInstance] checkNullString:[dict objectForKey:Field_Name_TEXT]];
//        
//        /*判断UId是否为NULL*/
//        NSString *strAdmin = [[Util shareInstance] checkNullString:[dict objectForKey:Field_Name_ADMINID]];
//
//        /*判断RANKING是否为NULL*/
//        NSString *strState = [[Util shareInstance] checkNullString:[dict objectForKey:Field_Name_STATUS]];
//
//        data.admin_id = strAdmin;
//        data.status = strState;
//        data.question_time = [[Util shareInstance] checkNullString:[dict objectForKey:Field_Name_QUESTIONTIME]];
//        data.member_id = [[Util shareInstance] checkNullString:[dict objectForKey:Field_Name_MEMBERID]];
//        data.pic_url = [[Util shareInstance] checkNullString:[dict objectForKey:Field_Name_PIC_URL]];
//        data.voice_url = [[Util shareInstance] checkNullString:[dict objectForKey:Field_Name_VOICE_Url]];
//
//        [tempArray addObject:data];
//        [data release];
//    }
    
    
//    for (int i = 0; i < [dictArray count]; i ++) {
//        QuestionData *data = [[QuestionData alloc]init];
//        
//        NSDictionary *dict = [dictArray objectAtIndex:i];
//        data.questionID = [[Util shareInstance] checkNullString:[dict objectForKey:Field_Name_Questionid]];
//        data.title = [[Util shareInstance] checkNullString:[dict objectForKey:Field_Name_TITLE]];
//        data.question_time = [[Util shareInstance] checkNullString:[dict objectForKey:Field_Name_QUESTIONTIME]];
//        data.text = [[Util shareInstance] checkNullString:[dict objectForKey:Field_Name_TEXT]];
//        data.pic_url = [[Util shareInstance] checkNullString:[dict objectForKey:Field_Name_PIC_URL]];
//        data.voice_url = [[Util shareInstance] checkNullString:[dict objectForKey:Field_Name_VOICE_Url]];
//
//        data.status = [[Util shareInstance] checkNullString:[dict objectForKey:Field_Name_STATUS]];
//
//        data.answer_count = [[Util shareInstance] checkNullString:[dict objectForKey:Field_Name_answer_count]];
//        
//        [tempArray addObject:data];
//        [data release];
//    }
//    
    return tempArray;
}


/* 请求的 回答数据完成封装*/
- (NSMutableArray *)formatToAnswerData:(NSArray *)dictArray
{
    NSMutableArray *tempArray = [[[NSMutableArray alloc]init]autorelease];
//    
//    for (int i = 0; i < [dictArray count]; i ++) {
//        AnswerData *data = [[AnswerData alloc]init];
//        
//        NSDictionary *dict = [dictArray objectAtIndex:i];
//        data.answerID = [[Util shareInstance] checkNullString:[dict objectForKey:Field_Name_ANSWERID]];
//        data.text = [[Util shareInstance] checkNullString:[dict objectForKey:Field_Name_ANSTEXT]];
//        data.answer_time = [[Util shareInstance] checkNullString:[dict objectForKey:Field_Name_ANSWER_TIME]];
//        data.question_id = [[Util shareInstance] checkNullString:[dict objectForKey:Field_Name_QUESTIONID]];
//        data.admin_id = [[Util shareInstance] checkNullString:[dict objectForKey:Field_Name_ADMINID]];
//        data.likecount = [[Util shareInstance] checkNullString:[dict objectForKey:Field_Name_LIKECOUNT]];
//        data.admin_name = [[Util shareInstance] checkNullString:[dict objectForKey:Field_Name_AdminName]];
//        data.father_id = [[Util shareInstance] checkNullString:[dict objectForKey:Field_Name_FatherID]];
//        data.head_img = [[Util shareInstance] checkNullString:[dict objectForKey:Field_Name_Admin_ICO]];
//        data.type = [[Util shareInstance] checkNullString:[dict objectForKey:Field_Name_TYPE]];
//        
//        data.pic_url = [[Util shareInstance] checkNullString:[dict objectForKey:Field_Name_PICURl]];
//        data.voice_url = [[Util shareInstance] checkNullString:[dict objectForKey:Field_Name_VOICEURL]];
//        
//        
//        [tempArray addObject:data];
//        [data release];
//    }
//    
    return tempArray;
}





@end
