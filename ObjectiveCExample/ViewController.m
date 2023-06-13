//
//  ViewController.m
//  ObjectiveCExample
//
//  Created by brainway on 07.06.2023.
//

#import "ViewController.h"
#import "ObjectiveCExample-Swift.h"

@interface ViewController ()

@property (nonatomic, strong) DataManagerProviderBridge *dmp;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.dmp = [DataManagerProviderBridge alloc];
    [self.dmp initIdxWith:@{@"url": @"URL"}];
}

@end
