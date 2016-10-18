//
//  WebApiHandler.h
//  MyTableView
//
//  Created by admin on 5/3/16.
//  Copyright © 2016 admin. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol WebApiHandlerDelegate <NSObject>

-() getForcastData(NS)

@end


@interface WebApiHandler : NSObject

@property (weak, nonatomic) id<WebApiHandlerDelegate> delegate;

-(instancetype) initWith:(id)delegate;

-(NSMutableArray*) getWeatherInfo;

@end
