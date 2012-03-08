//
//  User.m
//  pios
//
//  Created by Víctor on 16/02/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "User.h"

@implementation User
@synthesize username;

- (void) dealloc {
    self.username = nil;
    
    [super dealloc];
}


- (User *) initWithUsername:(NSString *)aUsername {
    if (self = [super init]) {
        self.username = aUsername;
    }
    return self;
}

+ (User *) userWithUsername:(NSString *)username {
    return [[[User alloc] initWithUsername:username] autorelease];
}

+ (NSArray *) getUsers {
    NSMutableArray *users = [NSMutableArray array];
    [users addObject:[User userWithUsername:@"vicpenap"]];
    [users addObject:[User userWithUsername:@"davidbarral"]];
    [users addObject:[User userWithUsername:@"asischao"]];
    [users addObject:[User userWithUsername:@"madtrick"]];
    [users addObject:[User userWithUsername:@"faci"]];
    [users addObject:[User userWithUsername:@"rorcual"]];
    [users addObject:[User userWithUsername:@"reyam"]];
    [users addObject:[User userWithUsername:@"trabe"]];

    NSSortDescriptor *sd = [NSSortDescriptor sortDescriptorWithKey:@"username" ascending:YES];
    return [users sortedArrayUsingDescriptors:[NSArray arrayWithObject:sd]];
}

- (NSString *) screenname {
    return [@"@" stringByAppendingString:self.username];
}

@end
