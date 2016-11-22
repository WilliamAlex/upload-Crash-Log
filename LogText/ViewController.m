//
//  ViewController.m
//  LogText
//
//  Created by zhuochunsheng on 16/6/30.
//  Copyright © 2016年 fenda. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()

@end

@implementation ViewController

void uncaughtExceptionHandler(NSException *exception){
    [XZLog logCrash:exception];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    //Set ExceptionHandler
    NSSetUncaughtExceptionHandler(&uncaughtExceptionHandler);
    
    // 初始化
    [XZLog initLog];
    
    // 设置保存多少天的数据，多余就删除。
    [XZLog setNumberOfDaysToDelete:5];
    
    // 测试用例
//    FDLog(@"阿衡", @"iOS大美女一个", @"抢先预定了喂");
//    
//    // 测试用例1
//    FDLog(@"阿浪", @"iOS第一帅", @"你懂的");
//    
//    // 测试用例2
//    FDColorLog(@"阿浪", @"社交", @"是我负责的", FDColor(200,20,20));
//    
//    // 测试用例3
//    FDColorLog(@"丽姐", @"iOS嘴强王者", @"泡妹子厉害", FDColor(20,200,20));
    
    
    
    NSString *path = NSHomeDirectory();//主目录
    NSLog(@"主目录-NSHomeDirectory-->:%@",path);
    NSString *userName = NSUserName();//与上面相同
    NSString *rootPath = NSHomeDirectoryForUser(userName);
    NSLog(@"主目录-NSHomeDirectoryForUser-->:%@",rootPath);
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory=[paths objectAtIndex:0];//Documents目录
    NSLog(@"Documents目录-NSDocumentDirectory-->:%@",documentsDirectory);
    
    

    [self readFile];
    
    [self localFile];
    
    
    UIButton *btn=[UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame=CGRectMake(100, 100, 100, 100);
    btn.backgroundColor=[UIColor greenColor];
    [btn addTarget:self action:@selector(touchone) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    
}


-(NSString *)dirDoc{
    //[NSHomeDirectory() stringByAppendingPathComponent:@"Documents"];
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSLog(@"app_home_doc: %@",documentsDirectory);
    return documentsDirectory;
}


-(void)readFile{
    
    NSString *string = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSArray *tempFileList = [[NSArray alloc] initWithArray:[fileManager contentsOfDirectoryAtPath:string error:nil]];
    NSLog(@"tempFileList----%@",tempFileList);
}
    


-(void)localFile{
    
    NSString *docsDir = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/log"];
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    NSDirectoryEnumerator *dirEnum = [fileManager enumeratorAtPath:docsDir];
    
    NSString *fileName;
    
    NSString *infoStr=[[NSMutableString alloc]init];

    
    while (fileName = [dirEnum nextObject]) {
        
        if ([fileName rangeOfString:@"log"].location !=NSNotFound)
        {
            NSLog(@"----------FielName : %@" , fileName);
            
            NSLog(@"-----------------FileFullPath : %@" , [docsDir stringByAppendingPathComponent:fileName]) ;
            
            NSString *string = [docsDir stringByAppendingPathComponent:fileName];
            NSFileManager *fileManager = [NSFileManager defaultManager];
            NSArray *tempFileList = [[NSArray alloc] initWithArray:[fileManager contentsOfDirectoryAtPath:string error:nil]];
            NSLog(@"该级文件的子一级文件-%d---%@",(int)tempFileList.count,tempFileList);
            
            NSString *str2=[[NSString alloc]initWithContentsOfFile:string encoding:NSUTF8StringEncoding error:nil];
            NSLog(@"读文件=%@====%d",str2,(int)str2.length);
            
            
            if (![str2 isKindOfClass:[NSNull class]])
            {
                if (str2.length>0)
                {
                    infoStr=[infoStr stringByAppendingString:str2];
                }
            }
        }
    }
    
    if (infoStr.length>0)
    {
        NSLog(@"infoStr--->:%@",infoStr);
    }
    
    
}


- (IBAction)clickBtn:(id)sender
{
    NSString *docsDir = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/log"];
    
    NSError *error=nil;
    [[NSFileManager defaultManager] removeItemAtPath:docsDir error:&error];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
