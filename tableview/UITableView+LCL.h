    //
    //  UITableView+LCL.h
    //  tableview
    //
    //  Created by bloodspasm on 2016/08/11.
    //  Copyright © 2016年 bloodspasm. All rights reserved.
    //

    #import <UIKit/UIKit.h>

    @interface UITableView (LCL)
    - (UIView *)sectionIndexView;
    - (void)setSectionIndexBackgroundColor:(UIColor *)BackgroundColor;
    - (void)setSectionIndexTextColor:(UIColor *)textColor;
    - (void)setSectionIndexFont:(UIFont *)font;
    - (void)setSectionIndexFont:(UIFont *)font textColor:(UIColor *)textColor;
    @end
