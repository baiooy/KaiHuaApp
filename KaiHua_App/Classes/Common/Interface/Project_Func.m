//
//  ReseriveDataFromServer.m
//  KaiHua_InterfaceTest
//
//  Created by lx on 14-6-20.
//  Copyright (c) 2014年 Amsante. All rights reserved.
//

#import "Project_Func.h"
#import "Constant.h"
#include <CommonCrypto/CommonDigest.h>
#import <CommonCrypto/CommonHMAC.h>


@implementation Project_Func

+(Project_Func *)shareInstance{
   
    static dispatch_once_t pred;
    static Project_Func *instance = nil;
    dispatch_once(&pred, ^{
        instance = [[self alloc] initReserive];
    });
    
    return instance;
}

- (id)initReserive{
    self  = [super init];
    if (self == [super init]){
       self.appSecrect = SECRECT;
       self.appVersion = VERSION;
    
    }
    return self;
}

// hmac Sh1 方法加密参数
- (NSString *)hmacsha1:(NSString *)data secret:(NSString *)key {
    
    const char *cKey  = [key cStringUsingEncoding:NSASCIIStringEncoding];
    const char *cData = [data cStringUsingEncoding:NSASCIIStringEncoding];
    
    unsigned char cHMAC[CC_SHA1_DIGEST_LENGTH];//CC_SHA1_DIGEST_LENGTH
    
    CCHmac(kCCHmacAlgSHA1, cKey, strlen(cKey), cData, strlen(cData), cHMAC);
    
    NSData *HMAC = [[NSData alloc] initWithBytes:cHMAC length:sizeof(cHMAC)];
    
    NSString *hash = [HMAC base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
    
    return hash;
}

- (NSString *)getCurrentDataInterval{
    NSDate* dat = [NSDate dateWithTimeIntervalSinceNow:0];
    NSTimeInterval a=[dat timeIntervalSince1970];
    NSString *timeString = [NSString stringWithFormat:@"%f", a];
    return timeString;
}


/*
// 遍历字典对象组合post数据
-(void)addPostDataWith:(NSDictionary *)dict ToRequest:(ASIFormDataRequest *)request{
    
    [request setRequestMethod:@"POST"];
    //执行发起请求,将来还要就收服务器的数据
    [request addRequestHeader:@"Authorization" value:@""];
    
    [dict enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        
        NSString *postValue = (NSString *)obj;
        NSString *postKey = (NSString *)key;
        
        NSLog(@"postData -- Key is %@,  ----Value is %@",postKey,postValue);
        
        [request addPostValue:postValue forKey:postKey];
        
    }];
    
    [request setDefaultResponseEncoding:NSUTF8StringEncoding];
    [request startSynchronous];//start方法会启动request的main(),只要执行到这一行,就会有反应了
    
}

*/

// 请求数据方法
-(NSDictionary *) makePostParamsWithCondation:(NSDictionary *)dict AndSignDict:(NSDictionary *)signDict{
// 初始化参数
    NSMutableArray *postList = [NSMutableArray array];
    NSString *postSign = @"";
    
    NSMutableDictionary *postDict = [NSMutableDictionary dictionaryWithDictionary:signDict];
   // [postDict setObject:_appVersion forKey:APP_VERSION];
   // [postDict setObject:[self getCurrentDataInterval] forKey:APP_TIMESTAMP];
    
    [signDict enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        
        NSString *postValue = (NSString *)obj;
        NSString *postKey = (NSString *)key;
        [postList addObject:[NSDictionary dictionaryWithObjectsAndKeys:postKey,@"key", postValue,@"value",nil]];
        
    }];
    
    // 签名参数按 字典Key值 升序排列
    NSSortDescriptor *_sorterKey  = [[NSSortDescriptor alloc] initWithKey:@"key" ascending:YES];
    
    NSArray * array = [postList sortedArrayUsingDescriptors:[NSArray arrayWithObjects:_sorterKey, nil]];
    
    NSLog(@"根据key ASC排序:\n%@",[postList sortedArrayUsingDescriptors:[NSArray arrayWithObjects:_sorterKey, nil]]);
    
    
    // 拼接 签名字符串 格式 (key1=xx@key2=xx@key3=xxxx)
    for (int i=0; i< array.count; i++) {
        
        NSDictionary * paramDict = [array objectAtIndex:i];
       
        NSString *postKey = [paramDict objectForKey:@"key"];
        NSString *postValue = [paramDict objectForKey:@"value"];
       
        postSign = [postSign stringByAppendingString:[NSString stringWithFormat:@"%@=%@&",postKey,postValue]];
        
    }

    NSString *signStr = [postSign substringToIndex:[postSign length] - 1];
    NSLog(@"postSing is %@",signStr);
    
    // 生成签名参数值  计算方式(base64_encode(hash_hmac("sha1", $plaintext, $appSecrect) 跟接口端保持一致算法
    NSString *signValue = [self hmacsha1:signStr secret:_appSecrect];
    
    NSLog(@"sign is %@",signValue);
    
    [postDict setObject:signValue forKey:APP_SIGN];
    
    if (dict){
      
        [dict enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
            
            NSString *postValue = (NSString *)obj;
            NSString *postKey = (NSString *)key;
            [postDict setObject:postValue forKey:postKey];
            
        }];
    }
    
    return postDict;

}


@end
