//
//  Video.h
//  TutorialsApp
//
//  Created by Duminica Octavian on 25/03/2018.
//  Copyright © 2018 Duminica Octavian. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Video : NSObject

@property (nonatomic, strong) NSString *videoTitle;
@property (nonatomic, strong) NSString *videoDescription;
@property (nonatomic, strong) NSString *videoIframe;
@property (nonatomic, strong) NSString *thumbnailUrl;

@end
