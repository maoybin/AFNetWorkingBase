//
//  ViewController.m
//  AFNetWorkingBase
//
//  Created by 国投资本 on 2018/8/9.
//  Copyright © 2018年 大麦理财. All rights reserved.
//

#import "ViewController.h"
#import "AFNetworking.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    AFNetworkReachabilityManager *manager = [AFNetworkReachabilityManager sharedManager];
    
    [manager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        
        NSLog(@"status=%zd",status);
        /**
         AFNetworkReachabilityStatusUnknown          = -1,  未知网络
         AFNetworkReachabilityStatusNotReachable     = 0,   没有链接网络
         AFNetworkReachabilityStatusReachableViaWWAN = 1,   手机网络
         AFNetworkReachabilityStatusReachableViaWiFi = 2,   WiFi网络
         */
        
    }];
    
    //开启网络监测
    [manager startMonitoring];
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    [self get_connection];
    
    NSLog(@"点击我啊啊啊啊啊");
    
}


- (void)get_connection{
    
    //1.定义一个管理器
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    NSDictionary *dict = @{@"grade_id":@"2"};
    
    /**修改响应序列化 默认值是joson
     AFHTTPResponseSerializer      响应接收到的数据是二进制
     AFJSONRequestSerializer       响应接收到的数据是JSON
     AFXMLParserResponseSerializer 响应接收到的数据是XML
     */
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];

    
    [manager GET:@"http://new.api.bandu.cn/book/listofgrade" parameters:dict success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
        
        //operation响应头信息
        //responseObject 响应体
        id objc = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        
        NSLog(@"success===%@  operation==%@",objc,operation);
        
    } failure:^(AFHTTPRequestOperation * _Nullable operation, NSError * _Nonnull error) {
         NSLog(@"error===%@",error);
    }];
    
}

//- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
//
//
//
//}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
