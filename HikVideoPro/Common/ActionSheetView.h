//
//  ActionSheetView.h
//  DOC_APP
//
//  Created by 张海勇 on 2018/6/23.
//  Copyright © 2018年 张海勇. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ActionSheetView : UIView

@property (nonatomic,copy)void (^actionSheetSelectBlock)(NSString *str);
@property (nonatomic,copy)void (^actionSheetCancelBlock)(void);

- (instancetype)initWithFrame:(CGRect)frame rowData:(NSArray *)array;
@end
