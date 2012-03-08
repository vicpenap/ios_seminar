//
//  Tweet.m
//  pios
//
//  Created by Víctor on 16/02/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Tweet.h"
#import "JSONKit.h"


#define kTweetURL @"http://api.twitter.com/statuses/user_timeline.json?include_rts=true&screen_name=%@&page=%d&count=%d"

@implementation Tweet
@synthesize author, text, date;

- (void) dealloc 
{
    self.author = nil;
    self.text = nil;
    self.date = nil;
    
    [super dealloc];
}

- (Tweet *) initWithAuthor:(User *)aUser
                      text:(NSString *)aText 
                      date:(NSDate *)aDate 
{
    if (self = [super init]) {
        self.author = aUser;
        self.text = aText;
        self.date = aDate;
    }
    return self;
}


+ (NSArray *) getTweetsByAuthor:(User *)author
{
    NSString *url = [NSString stringWithFormat:kTweetURL,author.username,1,20];
    
    NSError *error = nil;
    
    // obtain response from the source url
    NSString *response = [NSString stringWithContentsOfURL:[NSURL URLWithString:url] 
                                                  encoding:NSUTF8StringEncoding
                                                     error:&error];
    if (error)
    {
        return nil;
    }
    
    // parse response into an array
    NSArray *parsedResponse = [response objectFromJSONString];
    if (error)
    {
        return nil;
    }
    
    
    // start processing the objects
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    // Wed Feb 15 22:54:08 +0000 2012
    [formatter setDateFormat:@"EEE MMM dd HH:mm:ss +0000 yyyy"];

    NSMutableArray *tweets = [NSMutableArray array];
    for (NSDictionary *parsedTweet in parsedResponse)
    {
        NSDate *date = [formatter dateFromString:[parsedTweet objectForKey:@"created_at"]];
        NSString *text = [[parsedTweet objectForKey:@"text"] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
        
        Tweet *t = [[Tweet alloc] initWithAuthor:author text:text date:date];
        [tweets addObject:t];
        [t release];
    }
    
    [formatter release];
    
    return tweets;
}

@end
