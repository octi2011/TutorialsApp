//
//  VideoVC.h
//  TutorialsApp
//
//  Created by Duminica Octavian on 25/03/2018.
//  Copyright © 2018 Duminica Octavian. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Video;
@interface VideoVC : UIViewController <UIWebViewDelegate>

@property (nonatomic, strong) Video *video;

@end
