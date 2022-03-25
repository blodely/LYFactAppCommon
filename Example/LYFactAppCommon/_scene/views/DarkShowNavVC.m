//
//  DarkShowNavVC.m
//	LYFactAppCommon
//
//	CREATED BY LUO YU ON 2021-12-24.
//	Copyright (c) 2019-2021 骆昱 (Luo Yu, blodely) <indie.luo@gmail.com>
//
//	Permission is hereby granted, free of charge, to any person obtaining a copy
//	of this software and associated documentation files (the "Software"), to deal
//	in the Software without restriction, including without limitation the rights
//	to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//	copies of the Software, and to permit persons to whom the Software is
//	furnished to do so, subject to the following conditions:
//
//	The above copyright notice and this permission notice shall be included in
//	all copies or substantial portions of the Software.
//
//	THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//	IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//	FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//	AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//	LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//	OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//	THE SOFTWARE.
//

#import "DarkShowNavVC.h"


@interface DarkShowNavVC () <UITableViewDelegate, UITableViewDataSource> {}
@end

@implementation DarkShowNavVC

- (void)initial {
	[super initial];
	
	lightStatusbar = NO;
}

- (void)loadView {
	[super loadView];
	
	self.view.backgroundColor = [UIColor darkGrayColor];
	
	{
		FACBaseTableView *view = [[FACBaseTableView alloc] init];
		view.translatesAutoresizingMaskIntoConstraints = NO;
		[self.view addSubview:view];
		
		[view registerClass:[FACBaseTableCell class] forCellReuseIdentifier:FACBaseTableCellIdentifier];
		[view registerClass:[FACChatBaseLeftCell class] forCellReuseIdentifier:@"FACChatBaseLeftCellIdentifier"];
		[view registerClass:[FACChatBaseRightCell class] forCellReuseIdentifier:@"FACChatBaseRightCellIdentifier"];
		
		view.delegate = self;
		view.dataSource = self;
		
		[view.leftAnchor constraintEqualToAnchor:self.view.leftAnchor].active = YES;
		[view.rightAnchor constraintEqualToAnchor:self.view.rightAnchor].active = YES;
		[view.topAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.topAnchor].active = YES;
		[view.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor].active = YES;
	}
}

// MARK: - DELEGATE

// MARK: UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)idp {
	[tableView deselectRowAtIndexPath:idp animated:YES];
}

// MARK: UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	NSInteger rows = 20;
	return rows;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)idp {
	
	if (idp.row % 2 == 0) {
		FACChatBaseLeftCell *cell = [tableView dequeueReusableCellWithIdentifier:@"FACChatBaseLeftCellIdentifier" forIndexPath:idp];
		cell.lblContent.text = [NSString stringWithFormat:@"Left %@ %@", @(idp.row), @(cell.side)];
		return cell;
	} else {
		FACChatBaseRightCell *cell = [tableView dequeueReusableCellWithIdentifier:@"FACChatBaseRightCellIdentifier" forIndexPath:idp];
		cell.lblContent.text = [NSString stringWithFormat:@"Right %@ %@", @(idp.row), @(cell.side)];
		return cell;
	}
	
	return [tableView dequeueReusableCellWithIdentifier:FACBaseTableCellIdentifier forIndexPath:idp];
}

@end
