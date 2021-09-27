//
//    LYTableViewController.m
//    LYFactAppCommon
//
//    CREATED BY LUO YU ON 2021-09-27.
//    Copyright © 2019~2021 骆昱 (Luo Yu, blodely) <indie.luo@gmail.com>
//
//    Permission is hereby granted, free of charge, to any person obtaining a copy
//    of this software and associated documentation files (the "Software"), to deal
//    in the Software without restriction, including without limitation the rights
//    to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//    copies of the Software, and to permit persons to whom the Software is
//    furnished to do so, subject to the following conditions:
//
//    The above copyright notice and this permission notice shall be included in
//    all copies or substantial portions of the Software.
//
//    THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//    IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//    FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//    AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//    LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//    OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//    THE SOFTWARE.
//

#import "LYTableViewController.h"


@interface LYTableViewController () <UITableViewDataSource, UITableViewDelegate> {
    __weak UITableView *tbDemo;
}
@end

@implementation LYTableViewController

- (void)loadView {
    [super loadView];
    
    {
        UITableView *view = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        [self.view addSubview:view];
        tbDemo = view;
        
        tbDemo.delegate = self;
        tbDemo.dataSource = self;
        
        [tbDemo registerClass:[FACBaseTableCell class] forCellReuseIdentifier:FACBaseTableCellIdentifier];
        [tbDemo registerClass:[FACMenuItemCell class] forCellReuseIdentifier:FACMenuItemCellIdentifier];
        
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.title = @"table vc";
}

// MARK: - DELEGATE

// MARK: UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)idp {
    
}

// MARK: UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)idp {
    
    if (idp.row % 2 > 0) {
        FACMenuItemCell *cell = [tableView dequeueReusableCellWithIdentifier:FACMenuItemCellIdentifier forIndexPath:idp];
        return cell;
    }
    
    FACBaseTableCell *cell = [tableView dequeueReusableCellWithIdentifier:FACBaseTableCellIdentifier forIndexPath:idp];
    
    cell.backgroundColor = [UIColor lightGrayColor];
    
    return cell;
}

@end
