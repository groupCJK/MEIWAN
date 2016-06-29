//
//  firstPage_scrollViewCell.m
//  beautity_play
//
//  Created by user_kevin on 16/6/26.
//  Copyright © 2016年 user_kevin. All rights reserved.
//

#import "firstPage_scrollViewCell.h"
#import "headerName.pch"

@implementation firstPage_scrollViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.backgroundColor = baseColor;
        //滑动视图 按钮
        UIScrollView * scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 90)];
        scrollView.contentSize = CGSizeMake([UIScreen mainScreen].bounds.size.width*2, 0);
        scrollView.pagingEnabled = YES;
        scrollView.showsHorizontalScrollIndicator = NO;
        scrollView.delegate = self;
        [self addSubview:scrollView];
        //
        for (int i = 0; i<2; i++) {
            
            UIImageView * imageView = [[UIImageView alloc]initWithFrame:CGRectMake(i* width_screen, 0, width_screen, 90)];
            imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"banner%d",i]];
            
            imageView.userInteractionEnabled = YES;
            
            UIGestureRecognizer *singleTap = [[UIGestureRecognizer alloc]initWithTarget:self action:@selector(scrollImageViewClick:)];
            [imageView addGestureRecognizer:singleTap];
            [scrollView addSubview:imageView];
        }
        self.scrollview = scrollView;
        
        
        UIPageControl * pageControl = [[UIPageControl alloc]init];
        if (width_screen>320) {
            pageControl.center = CGPointMake(scrollView.center.x-30, scrollView.frame.size.height+5);
        }else{
            pageControl.center = CGPointMake(scrollView.center.x, scrollView.frame.size.height+5);
        }
        pageControl.bounds = CGRectMake(0, 0, 60, 20);
        pageControl.currentPage = 0;
        pageControl.numberOfPages = 2;
        pageControl.currentPageIndicatorTintColor = RGB(64, 144, 164);
        pageControl.pageIndicatorTintColor = RGB(153, 151, 151);
        [pageControl addTarget:self action:@selector(pageControlChange:) forControlEvents:UIControlEventValueChanged];
        [self addSubview:pageControl];
        self.pageControl = pageControl;
        
        NSTimer * mytimer = [NSTimer scheduledTimerWithTimeInterval:3.0 target:self selector:@selector(runrun)  userInfo:nil repeats:YES];
        [[NSRunLoop currentRunLoop] addTimer:mytimer forMode:NSRunLoopCommonModes];
    

    }
    return self;
}
- (void)pageControlChange:(UIPageControl *)pageControl
{
    CGSize viewSize = _scrollview.frame.size;
    [self.scrollview setContentOffset:CGPointMake(pageControl.currentPage* viewSize.width, 0) animated:YES];
}
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    self.pageControl.currentPage = self.scrollview.contentOffset.x/width_screen;
}
- (void)runrun
{
    static int speed = 1;
    self.pageControl.currentPage += speed;
    if (self.pageControl.currentPage == 0 || self.pageControl.currentPage == 1) {
        speed = -speed;
    }
    [self.scrollview setContentOffset:CGPointMake(self.pageControl.currentPage*width_screen, 0) animated:YES];
}
- (void)scrollImageViewClick:(UIGestureRecognizer *)gesture
{
    NSLog(@"1-0%@",gesture.view);
    [self.delegate scrollImageViewClick:gesture];
}
@end
