//
//  LYCollectViewController.m
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

#import "LYCollectViewController.h"


@interface LYCollectViewController () <UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout> {
    __weak UICollectionView *cvDemo;
}
@end

@implementation LYCollectViewController

- (void)loadView {
    [super loadView];
    
    {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.minimumLineSpacing = 10;
        layout.minimumInteritemSpacing = 10;
        layout.scrollDirection = UICollectionViewScrollDirectionVertical;
        
        
        UICollectionView *view = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
        view.translatesAutoresizingMaskIntoConstraints = NO;
        view.backgroundColor = [UIColor clearColor];
        [self.view addSubview:view];
        cvDemo = view;
        
        cvDemo.delegate = self;
        cvDemo.dataSource = self;
        
        [cvDemo registerClass:[FACBaseCollectionCell class] forCellWithReuseIdentifier:FACBaseCollectionCellIdentifier];
        [cvDemo registerClass:[FACAlbumCell class] forCellWithReuseIdentifier:FACAlbumCellIdentifier];
        
        [view.topAnchor constraintEqualToAnchor:self.view.topAnchor].active = YES;
        [view.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor].active = YES;
        [view.leftAnchor constraintEqualToAnchor:self.view.leftAnchor].active = YES;
        [view.rightAnchor constraintEqualToAnchor:self.view.rightAnchor].active = YES;
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"collection vc";
}

// MARK: - DELEGATE

// MARK: UICollectionViewDelegate

// MARK: UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 20;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)idp {
    
    __weak UICollectionViewCell *cell;
    
    if (idp.item > 0) {
        cell = [collectionView dequeueReusableCellWithReuseIdentifier:FACAlbumCellIdentifier forIndexPath:idp];
        return cell;
    }
    
    if (cell == nil) {
        cell = [collectionView dequeueReusableCellWithReuseIdentifier:FACBaseCollectionCellIdentifier forIndexPath:idp];
    }
    
    return cell;
}

@end
