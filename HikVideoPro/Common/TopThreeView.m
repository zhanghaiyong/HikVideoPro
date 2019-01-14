//
//  TopView.m
//  NURSE
//
//  Created by JSG on 2019/1/8.
//  Copyright © 2019 JSG. All rights reserved.
//

#import "TopThreeView.h"

@interface TopThreeView()
{
    UIButton *currentBtn;
}
@end

@implementation TopThreeView

- (IBAction)tapAction:(UIButton *)sender {
    
    if (currentBtn == sender) {
        UIImageView *img = (UIImageView *)[self viewWithTag:sender.tag+100];
        if (sender.selected) {
            sender.selected = NO;
            img.image = [UIImage imageNamed:@"展开"];
        }else {
            sender.selected = YES;
            img.image = [UIImage imageNamed:@"收起"];
        }
    }else {
        currentBtn = sender;
        self.arrow1.image = [UIImage imageNamed:@"展开"];
        self.arrow2.image = [UIImage imageNamed:@"展开"];
        self.arrow3.image = [UIImage imageNamed:@"展开"];
        
        UIImageView *img = (UIImageView *)[self viewWithTag:sender.tag+100];
        img.image = [UIImage imageNamed:@"收起"];
        sender.selected = YES;
    }
    

    
}



@end
