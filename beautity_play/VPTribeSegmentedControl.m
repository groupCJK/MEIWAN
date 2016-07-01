//
//  VPTribeSegmentedControl.m
//  beautity_play
//
//  Created by 钟伟迪 on 15/6/17.
//  Copyright (c) 2015年 zjh. All rights reserved.
//

//宏定义
#define SuppressPerformSelectorLeakWarning(Stuff) \
do { \
_Pragma("clang diagnostic push") \
_Pragma("clang diagnostic ignored \"-Warc-performSelector-leaks\"") \
Stuff; \
_Pragma("clang diagnostic pop") \
} while (0)


#import "VPTribeSegmentedControl.h"

@implementation VPTribeSegmentedControl{
    CALayer * _btmLayer;
    SEL _sel;
    id  _target;
}

- (id)initWithFrame:(CGRect)frame withItems:(NSArray *)items{
    self = [super initWithFrame:frame];
    
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        _numberOfSegments = items.count;
        
        _btmLayer = [CALayer layer];
        _btmLayer.bounds = CGRectMake(0, 0, frame.size.width/items.count, 2.0f);
        _btmLayer.anchorPoint = CGPointMake(0, 0.5);//锚点
        _btmLayer.backgroundColor = self.tintColor.CGColor;
        _btmLayer.position = CGPointMake(0, frame.size.height-2.0f);
        [self.layer addSublayer:_btmLayer];
        
        CGFloat width = frame.size.width/items.count;
        CGFloat x = 0.0f;
        for (int i = 0; i < items.count; i++) {
            UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
            button.frame = CGRectMake(x, 0, width, frame.size.height - 2.0f);
            button.titleLabel.font = [UIFont systemFontOfSize:15.0f];
            if ([items[i] isKindOfClass:[NSString class]]) {
                [button setTitle:items[i] forState:UIControlStateNormal];
            }else if ([items[i] isKindOfClass:[UIImage class]]){
                [button setImage:items[i] forState:UIControlStateNormal];
            }
            button.tag = i;
            [button addTarget:self action:@selector(selectedIndex:) forControlEvents:UIControlEventTouchUpInside];
            x += width;
            [self addSubview:button];
        }
        
    }
    
    self.selectedIndex = 0;
    
    return self;
}

- (UIColor *)tintColor{
    if (!_tintColor) {
        _tintColor = vpMainColor;
    }
   return  _tintColor;
}

- (void)setFrame:(CGRect)frame{
    [super setFrame:frame];
    _btmLayer.bounds = CGRectMake(0, 0, _btmLayer.frame.size.width, 2.0f);
    _btmLayer.position = CGPointMake(0, frame.size.height);
}

- (void)selectedIndex:(UIButton *)sender{
    self.selectedIndex = sender.tag;
    if (_target&&_sel) {
        SuppressPerformSelectorLeakWarning(
                                           
                                           [_target performSelector:_sel withObject:self];
                                           );

    }
}

- (void)addTarget:(id)target action:(SEL)action{
    _sel =action;
    _target = target;
}

- (void)setSelectedIndex:(NSInteger)selectedIndex{
    _selectedIndex = selectedIndex;
    _btmLayer.position = CGPointMake(self.frame.size.width/_numberOfSegments*selectedIndex, _btmLayer.position.y);
    
    for (UIButton * btn in self.subviews) {
        if (btn.tag == selectedIndex) {
            [btn setTitleColor:self.tintColor forState:UIControlStateNormal];
        }else{
            [btn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
        }
    }
    
}

- (void)drawRect:(CGRect)rect {
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetStrokeColorWithColor(context, [UIColor lightGrayColor].CGColor);
    CGContextSetLineWidth(context, 1.0f);
    CGContextMoveToPoint(context, 0, rect.size.height - 1.0f);
    CGContextAddLineToPoint(context, rect.size.width, rect.size.height - 1.0f);
    CGContextStrokePath(context);
}


@end
