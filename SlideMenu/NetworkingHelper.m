//
//  NetworkingHelper.m
//  SlideMenu
//
//  Created by Akila Sivapathasekaran on 2/23/16.
//  Copyright © 2016 Aryan Ghassemi. All rights reserved.
//


#import "NetworkingHelper.h"


static NSString *const BASE_URL = @"http://nucleus-backend.herokuapp.com";
static NSString *const CREATE_ACCOUNT = @"createAccount";


@implementation NetworkingHelper

+(instancetype) sharedHelper {
    
    static NetworkingHelper *sharedHelper;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
       
        sharedHelper = [[NetworkingHelper alloc] init];
    });
    return sharedHelper;
}

- (void) createAccount:(NSDictionary *)userData withCompletionBlock:(APICompletionBlock)completionBlock{
    
    NSString *url = [NSString stringWithFormat:@"%@/%@",BASE_URL,CREATE_ACCOUNT];
    
    NSDictionary *parameters = @{@"name": @"Akila12",
                                 @"about_me":@"hiii",
                                 @"src_zip":@"95391",
                                 @"dest_zip":@"94085",
                                 @"phone_number":@"5555525555",
                                 @"email":@"akilas.karthik@gmail.com",
                                 @"gender":@"female",
                                 @"password":@"password"};
    

    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    [manager POST:url parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:responseObject options:0 error:nil];
        NSLog(@"Response : %@",json);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
    
}

@end
