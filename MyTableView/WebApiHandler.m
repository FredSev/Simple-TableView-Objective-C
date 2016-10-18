//
//  WebApiHandler.m
//  MyTableView
//
//  Created by admin on 5/3/16.
//  Copyright © 2016 admin. All rights reserved.
//

#import "WebApiHandler.h"
#import "ViewController.h"
#import "Forcast.h"

static NSString* const myURL = @"http://api.openweathermap.org/data/2.5/forecast/daily?q=Montreal&mode=json&units=metric&cnt=7&APPID=301fb5d4f380ec6e52ba2230eeb6507b";

@implementation WebApiHandler

-(instancetype) initWith:(id)delegate{
    self = [super init];
    _delegate = delegate;
    return self;
}

-(NSMutableArray*) getWeatherInfo{
    
    NSMutableArray* forcastList = [NSMutableArray new];
    
    //NSURLSession* session = [NSURLSession sharedSession];
    NSString* strURL = [NSString stringWithFormat:myURL];
    NSURL *url = [NSURL URLWithString:strURL];
    //[[session dataTaskWithURL:[NSURL URLWithString:url] completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), ^{
        NSData* data = [NSData dataWithContentsOfURL:url];
        NSError *error;
        NSDictionary *root = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
        
        NSArray* arr = [root objectForKey:@"list"];
        
        for (NSDictionary* dict in arr){
            Forcast* fr = [Forcast new];
            NSLog(@"hello");
            [fr setUnixDate:[[dict valueForKey:@"dt"] intValue]];
            
            //NSDictionary* att = [dict objectForKey:@"temp"];
            
            //[fr setMin:[[att valueForKey:@"min"] floatValue]];
            //[fr setMax:[[att valueForKey:@"max"] floatValue]];
            
            [forcastList addObject:fr];
            
        }
        NSLog(@"%@", root);
    });
    //}] resume];
    //[session finishTasksAndInvalidate];
    NSLog(@"%lu", (unsigned long)forcastList.count);
    return forcastList;
}

@end
