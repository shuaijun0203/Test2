//
//  ViewController.m
//  Test2
//
//  Created by 帥軍 on 2015/06/02.
//  Copyright (c) 2015年 jp.ac.jec.15cm. All rights reserved.
//

#import "ViewController.h"
#import <AFHTTPRequestOperationManager.h>

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *lable;

@end

@implementation ViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSString *keyID = @"T1348647853363/0-20.html";
    NSString *urlForHttpGet = [NSString stringWithFormat:@"http://c.m.163.com/nc/article/headline/%@", keyID];

    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer.acceptableContentTypes = [manager.responseSerializer.acceptableContentTypes setByAddingObject:@"text/html"];
    
    [manager GET:urlForHttpGet parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        //NSLog(@"JSON: %@",[[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding]);
        //NSLog(@"Success: %@", responseObject );
        
        NSArray *newsArray = responseObject[[[responseObject keyEnumerator] nextObject]];
        
        
        
        NSLog(@"Array's count: %@",newsArray[0]);
        self.lable.text = [newsArray[0] objectForKey:@"title"];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        NSLog(@"Error: %@",error);
    }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
