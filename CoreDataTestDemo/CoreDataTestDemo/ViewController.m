//
//  ViewController.m
//  CoreDataTestDemo
//
//  Created by suxinde on 15/6/15.
//  Copyright (c) 2015年 com.skypraryer. All rights reserved.
//

#import "ViewController.h"

#import <CoreData/CoreData.h>

#import "Student.h"
#import "Card.h"

// http://blog.csdn.net/q199109106q/article/details/8563438/

/*
 开发步骤总结：
 1.初始化NSManagedObjectModel对象，加载模型文件，读取app中的所有实体信息
 2.初始化NSPersistentStoreCoordinator对象，添加持久化库(这里采取SQLite数据库)
 3.初始化NSManagedObjectContext对象，拿到这个上下文对象操作实体，进行CRUD操作
 */

/*
 打开CoreData的SQL语句输出开关
 1.打开Product，点击EditScheme...
 2.点击Arguments，在ArgumentsPassed On Launch中添加2项
 1> -com.apple.CoreData.SQLDebug
 2> 1
 */
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self testDemo];
    
}

- (void)testDemo
{
    // 1. 从应用程序包中加载模型文件
    NSManagedObjectModel *model = [NSManagedObjectModel mergedModelFromBundles:nil];
    
    // 2. 传入模型对象，初始化NSPersistentStoreCoordinator
    NSPersistentStoreCoordinator *psc = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:model];
    
    // 3. 构建SQLite数据库文件的路径
    NSString *docs = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSURL *url = [NSURL fileURLWithPath:[docs stringByAppendingFormat:@"test.data"]];
    
    // 添加持久化存储库，使用SQLite作为存储库
    NSError *error = nil;
    NSPersistentStore *ps = [psc addPersistentStoreWithType:NSSQLiteStoreType
                                              configuration:nil
                                                        URL:url
                                                    options:nil error:&error];
    if (ps == nil) {
        [NSException raise:@"添加数据库错误" format:@"%@", [error localizedDescription]];
    }
    
    
    // 初始化上下文， 设置NSPersistentStoreCoordinator属性
    NSManagedObjectContext *context = [[NSManagedObjectContext alloc] init];
    context.persistentStoreCoordinator = psc;
    
    
    //======================================================================================
    // 添加操作
    //======================================================================================
    
    // 传入上下文，创建一个Sutduent实体对象
    NSManagedObject *stu = [NSEntityDescription insertNewObjectForEntityForName:@"Student"
                                                         inManagedObjectContext:context];
    [stu setValue:@(12) forKey:@"age"];
    [stu setValue:@"Itcast-1" forKey:@"name"];
    
    
    Student *stu2 = [NSEntityDescription insertNewObjectForEntityForName:@"Student"
                                                  inManagedObjectContext:context];
    stu2.age = @(20);
    stu2.name = @"Itcast-2";
    
    // 传入上下文，创建一个Card实体对象
    NSManagedObject *card = [NSEntityDescription insertNewObjectForEntityForName:@"Card"
                                                          inManagedObjectContext:context];
    [card setValue:@(12323) forKey:@"id"];

    [stu setValue:card forKey:@"card"];
    
    stu2.card = card;
    
    
    // 利用上下文对象，将数据同步到持久化数据存储库中
    //* 如果是想做更新操作：只要在更改了实体对象的属性后调用[context save:&error]，就能将更改的数据同步到数据库
    error = nil;
    BOOL success = [context save:&error];
    if (!success) {
        [NSException raise:@"访问数据库错误" format:@"%@", [error localizedDescription]];
    }
    
    //======================================================================================
    // 查询操作
    //======================================================================================
    
    // 初始化一个查询请求
    NSFetchRequest *fr = [[NSFetchRequest alloc] init];
    // 设置要查询的实体
    fr.entity = [NSEntityDescription entityForName:@"Student" inManagedObjectContext:context];
    
    // 设置排序（按照age降序）
    NSSortDescriptor *sort = [NSSortDescriptor sortDescriptorWithKey:@"age" ascending:NO];
    fr.sortDescriptors = [NSArray arrayWithObject:sort];
    // 设置条件过滤(搜索name中包含字符串"Itcast-1"的记录，注意：设置条件过滤时，数据库SQL语句中的%要用*来代替，所以%Itcast-1%应该写成*Itcast-1*)
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"name like %@", @"*Itcast-1*"];
    fr.predicate = predicate;
    
    // 执行请求
    error = nil;
    NSArray *objs = [context executeFetchRequest:fr error:&error];
    if (error) {
        [NSException raise:@"查询错误" format:@"%@", [error localizedDescription]];
    }
    
    // 遍历数据
    for (Student *obj in objs) {
        NSLog(@"name=%@ age=%@ card=%@", obj.name, obj.age, ((Card *)obj.card).id);
    }
    
    
    //======================================================================================
    // 修改操作
    //======================================================================================
    
    
    
    
    //======================================================================================
    // 删除操作
    //======================================================================================
    
    // 传入需要删除的实体对象
    [context deleteObject:stu2];
    
    // 将结果同步到数据库
    error = nil;
    [context save:&error];
    if (error) {
        [NSException raise:@"删除错误" format:@"%@", [error localizedDescription]];
    }
    
    NSLog(@"\n--------------\n");
    // 执行请求
    error = nil;
    objs = [context executeFetchRequest:fr error:&error];
    if (error) {
        [NSException raise:@"查询错误" format:@"%@", [error localizedDescription]];
    }
    
    // 遍历数据
    for (Student *obj in objs) {
        NSLog(@"name=%@ age=%@ card=%@", obj.name, obj.age, ((Card *)obj.card).id);
    }
    

}


@end
