//  ViewController.m
//  MyTableView
//
//  Created by admin on 5/2/16.
//  Copyright © 2016 admin. All rights reserved.

#import "ViewController.h"
#import "WebApiHandler.h"
#import "Forcast.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) UIButton* tester;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor magentaColor];
    self.tableView.rowHeight = 50;
    self.weatherForcasts = [NSMutableArray new];
    WebApiHandler* call = [[WebApiHandler alloc] initWith:self];
    self.weatherForcasts = [call getWeatherInfo];
    NSLog(@"%lu", (unsigned long)self.weatherForcasts.count);
    
    self.tester = [[UIButton alloc] initWithFrame:CGRectMake((self.view.frame.size.width/2) - 50,(self.view.frame.size.height/2) - 50 , 100, 100)];
    self.tester.backgroundColor = [UIColor orangeColor];
    [self.tester addTarget:self action:@selector(tt:) forControlEvents:UIControlEventTouchUpInside];
    self.tester.layer.zPosition = 1000;
    [self.view addSubview:self.tester];
}

-(void) tt:(UIButton*)button{
    NSLog(@"%lu", (unsigned long)self.weatherForcasts.count);
    [self.tableView reloadData];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.weatherForcasts.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    if ( indexPath.row % 2 == 0 ){
        cell.backgroundColor = [UIColor colorWithRed:0.9 green:0.1 blue:0.1 alpha:1.0];
    }else{
        cell.backgroundColor = [UIColor colorWithRed:0.1 green:0.9 blue:0.1 alpha:1.0];
    }
    
    return cell;
}

@end
