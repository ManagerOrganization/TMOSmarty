//
//  DemoRemoteImageViewController.m
//  TMOSmarty
//
//  Created by 崔 明辉 on 14-8-19.
//  Copyright (c) 2014年 崔 明辉. All rights reserved.
//

#import "DemoRemoteImageViewController.h"
#import "TMOSmarty.h"

@interface DemoRemoteImageViewController ()

@end

@implementation DemoRemoteImageViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSDictionary *data = @{@"image": @"http://www.huanju.cn/s/v1206/DuoWan-LOGO-PNG.png"};
    [self.view smartyRendWithObject:data isRecursive:YES];
    
    
    //You can use UIImage data instead of URLString
    //你可以使用UIImage对象直接执行Smarty替换
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.huanju.cn/s/v1206/YY-LOGO-PNG.png"]];
        [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
            if (connectionError == nil) {
                UIImage *theImage = [UIImage imageWithData:data];
                
                NSDictionary *data = @{@"image": theImage};
                [self.view smartyRendWithObject:data isRecursive:YES];
                
            }
        }];
    });
    
    
    
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
