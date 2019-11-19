//
//  MLNAutoresizingTableViewCell.m
//  MLN
//
//  Created by tamer on 2019/11/19.
//

#import "MLNAutoresizingTableViewCell.h"

@implementation MLNAutoresizingTableViewCell

- (CGSize)sizeThatFits:(CGSize)size
{
    CGFloat width = self.frame.size.width;
    CGFloat height = [self calculHeightWithWidth:width maxHeight:CGFLOAT_MAX];
    return CGSizeMake(width, height);
}

@end
