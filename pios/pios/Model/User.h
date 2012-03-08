//
//  User.h
//  pios
//
//  Created by Víctor on 16/02/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject


@property (nonatomic, retain) NSString *username;
@property (nonatomic, readonly) NSString *screenname;

- (User *) initWithUsername:(NSString *)username;
+ (User *) userWithUsername:(NSString *)username;

+ (NSArray *) getUsers;

@end
