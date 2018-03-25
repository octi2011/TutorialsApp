//
//  HTTPService.m
//  TutorialsApp
//
//  Created by Duminica Octavian on 25/03/2018.
//  Copyright © 2018 Duminica Octavian. All rights reserved.
//

#import "HTTPService.h"

#define URL_BASE "http://localhost:6069"
#define URL_TUTORIALS "/tutorials"
#define URL_COMMENTS "/comments"

@implementation HTTPService

+ (id) instance {
    static HTTPService *sharedInstance = nil;
    
    @synchronized(self) {
        if (sharedInstance == nil)
            sharedInstance = [[self alloc] init];
    }
    
    return sharedInstance;
}

//- (void) postComment {
//    NSDictionary *comment = @{@"username":@"octi2011",@"comment":@"This video is nice!"};
//
//    NSError *error;
//
//    NSURLSession *session = [NSURLSession sharedSession];
//    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%s%s",URL_BASE,URL_COMMENTS]];
//    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
//
//    [request addValue:@"application.json" forHTTPHeaderField:@"Content-Type"];
//    [request addValue:@"application.json" forHTTPHeaderField:@"Accept"];
//
//    [request setHTTPMethod:@"POST"];
//    
//    NSData *postData = [NSJSONSerialization dataWithJSONObject:comment options:0 error:&error];
//
//    [request setHTTPBody:postData];
//
//    NSURLSessionDataTask *postDatatask = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
//        // handle errors
//    }];
//
//    [postDatatask resume];
//}

- (void) getTutorials:(nullable onComplete)completionHandler {
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%s%s", URL_BASE, URL_TUTORIALS]];
    NSURLSession *session = [NSURLSession sharedSession];
    
    [[session dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (data != nil) {
            NSError *err;
            NSArray *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:&err];
            
            if (err == nil) {
                completionHandler(json, nil);
            } else {
                completionHandler(nil, @"Data is corrupt. Please try again!");
            }
            
        } else {
            NSLog(@"Network Err: %@", error.debugDescription);
            completionHandler(nil, @"Problem connecting to the server.");
        }
    }] resume];
}
@end
