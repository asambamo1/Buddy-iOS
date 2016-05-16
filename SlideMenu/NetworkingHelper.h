//
//  NetworkingHelper.h
//  SlideMenu
//
//  Created by Akila Sivapathasekaran on 2/23/16.
//  Copyright © 2016 Aryan Ghassemi. All rights reserved.
//

typedef void (^APICompletionBlock)(BOOL success,NSDictionary *jsonResponse,NSError **error);

#import <Foundation/Foundation.h>
#import <AFNetworking/AFNetworking.h>

@interface NetworkingHelper : NSObject

+(instancetype) sharedHelper;
- (void) createAccount:(NSDictionary *)userData withCompletionBlock:(APICompletionBlock)completionBlock;
- (void) login:(NSDictionary *)userData withCompletionBlock:(APICompletionBlock)completionBlock;
@end
