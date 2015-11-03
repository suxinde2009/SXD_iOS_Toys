/*
 The MIT License (MIT)
 
 Copyright (c) 2014 SuXinDe (Email: suxinde2009@126.com)
 
 Permission is hereby granted, free of charge, to any person obtaining a copy
 of this software and associated documentation files (the "Software"), to deal
 in the Software without restriction, including without limitation the rights
 to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 copies of the Software, and to permit persons to whom the Software is
 furnished to do so, subject to the following conditions:
 
 The above copyright notice and this permission notice shall be included in
 all copies or substantial portions of the Software.
 
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 THE SOFTWARE.
 */

#import "LeftViewController.h"
#import "AppDelegate.h"
#import "ThirdGradeViewController.h"

@interface LeftViewController ()

@end

@implementation LeftViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    CGSize viewSize = self.view.bounds.size;
    
    float statusBarHeight = 20.0f;
    float navBarHeight = 44.0f;
    CGRect tableFrame = CGRectMake(0, 0, viewSize.width, viewSize.height-statusBarHeight-navBarHeight);
    mTableView = [[UITableView alloc] initWithFrame:tableFrame style:UITableViewStyleGrouped];
    mTableView.dataSource = self;
    mTableView.delegate = self;
    [self.view addSubview:mTableView];
    
}


#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 11;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *const cellIdentifier = @"kCellIdentifier";
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    cell.textLabel.text = [NSString stringWithFormat:@"Row %d", indexPath.row];
    
    return cell;
}

#pragma mark - UITableviewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    AppDelegate *app = (AppDelegate *)[UIApplication sharedApplication].delegate;
    
    [app->mDrawerViewController closeDrawerAnimated:YES completion:^(BOOL finished) {
        
        ThirdGradeViewController *thirdGradeViewController = [[ThirdGradeViewController alloc] init];
        thirdGradeViewController.title = [NSString stringWithFormat:@"Row %d", indexPath.row];
        [app->mMainViewController.navigationController pushViewController:thirdGradeViewController animated:NO];
      
    }];

}


@end
