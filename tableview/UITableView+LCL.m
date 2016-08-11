    //
    //  UITableView+LCL.m
    //  tableview
    //
    //  Created by bloodspasm on 2016/08/11.
    //  Copyright © 2016年 bloodspasm. All rights reserved.
    //

    #import "UITableView+LCL.h"

    @implementation UITableView (LCL)

    - (UIView *)sectionIndexView {
        for (UIView *view in self.subviews) {
            if ([view respondsToSelector:@selector(setIndexColor:)]) {
                return view;
            }
        }
        return nil;
    }

    - (void)setSectionIndexBackgroundColor:(UIColor *)BackgroundColor{
        UIView *sectionIndexView = [self sectionIndexView];
        if (sectionIndexView) {
            if ([sectionIndexView respondsToSelector:@selector(setBackgroundColor:)]) {
                [sectionIndexView performSelector:@selector(setBackgroundColor:) withObject:BackgroundColor];
            }
        }
    }

    - (void)setSectionIndexTextColor:(UIColor *)textColor {
        UIView *sectionIndexView = [self sectionIndexView];
        if (sectionIndexView) {
            if ([sectionIndexView respondsToSelector:@selector(setIndexColor:)]) {
                [sectionIndexView performSelector:@selector(setIndexColor:) withObject:textColor];
            }
        }
    }

    - (void)setSectionIndexFont:(UIFont *)font {
        UIView *sectionIndexView = [self sectionIndexView];
        if (sectionIndexView) {
            if ([sectionIndexView respondsToSelector:@selector(setFont:)]) {
                [sectionIndexView performSelector:@selector(setFont:) withObject:font];
            }
        }
    }

    - (void)setSectionIndexFont:(UIFont *)font textColor:(UIColor *)textColor {
        UIView *sectionIndexView = [self sectionIndexView];
        if (sectionIndexView) {
            if ([sectionIndexView respondsToSelector:@selector(setIndexColor:)]) {
                [sectionIndexView performSelector:@selector(setIndexColor:) withObject:textColor];
            }
            if ([sectionIndexView respondsToSelector:@selector(setFont:)]) {
                [sectionIndexView performSelector:@selector(setFont:) withObject:font];
            }
        }
    }
    @end
