//
//  CityListVC.h
//  AtourLife
//
//  Created by Anasue on 16/2/25.
//  Copyright © 2016年 Anasue. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CityListVC : UIViewController

@property (nonatomic, copy) void(^cityClickBlock)(NSNumber *cityID, NSString *str);

@end
