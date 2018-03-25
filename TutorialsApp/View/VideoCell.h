//
//  VideoCell.h
//  TutorialsApp
//
//  Created by Duminica Octavian on 25/03/2018.
//  Copyright © 2018 Duminica Octavian. All rights reserved.
//

#import <UIKit/UIKit.h>
//#import "VideoCell.h"

@class Video; // @class brings in less than import statement


@interface VideoCell : UITableViewCell

-(void)updateUI:(nonnull Video *)video;

@end
