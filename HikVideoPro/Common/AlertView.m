//
//  AlertView.m
//  DOC_APP
//
//  Created by 张海勇 on 2018/7/4.
//  Copyright © 2018年 张海勇. All rights reserved.
//

#import "AlertView.h"

@implementation AlertView

- (IBAction)refuseAction:(id)sender {
    if (_alertViewRefuseBlock) {
        _alertViewRefuseBlock();
    }
}
- (IBAction)throughAction:(id)sender {
    if (_alertViewThroughBlock) {
        _alertViewThroughBlock();
    }
}

@end
