//
//  Tweet.h
//  pios
//
//  Created by Víctor on 16/02/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "User.h"

@interface Tweet : NSObject

@property (nonatomic, retain) User *author;
@property (nonatomic, retain) NSString *text;
@property (nonatomic, retain) NSDate *date;


- (Tweet *) initWithAuthor:(User *)author
                      text:(NSString *)text 
                      date:(NSDate *)date;

+ (NSArray *) getTweetsByAuthor:(User *)author;


@end
