//
//  ViewController.h
//  MulticastDelegateDemo
//
//  Created by suxinde on 15/6/18.
//  Copyright (c) 2015年 com.su. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

// Downloading 1

@property (nonatomic, strong) IBOutlet UILabel  *progressLbl1;
@property (nonatomic, strong) IBOutlet UIProgressView *progressView1;
@property (nonatomic, strong) IBOutlet UIProgressView *progressView2;


// Downloading 2
@property (nonatomic, strong) IBOutlet UILabel  *progressLbl2;
@property (nonatomic, strong) IBOutlet UIProgressView *progressView3;
@property (nonatomic, strong) IBOutlet UIProgressView *progressView4;

@end

