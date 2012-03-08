//
//  TweetsViewController.h
//  pios
//
//  Created by Víctor on 16/02/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "User.h"

@interface TweetsViewController : UITableViewController

@property (nonatomic, retain) NSDateFormatter *dateFormatter;
@property (nonatomic, assign) BOOL loading;
@property (nonatomic, retain) User *user;
@property (nonatomic, retain) NSArray *tweets;

@end
