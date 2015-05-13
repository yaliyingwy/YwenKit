//
//  UITableViewCell+WYExt.m
//  YwenKit
//
//  Created by ywen on 15/5/13.
//  Copyright (c) 2015年 ywen. All rights reserved.
//

#import "UITableViewCell+WYExt.h"

@implementation UITableViewCell (WYExt)

-(void)setIndexPath:(NSIndexPath *)indexPath {
    self.indexPath = indexPath;
}

-(NSIndexPath *)indexPath {
    return self.indexPath;
}

-(void) setSelectCellDelegate:(id<SelectCellProtocol>)selectCellDelegate {
    self.selectCellDelegate = selectCellDelegate;
}

-(id<SelectCellProtocol>)selectCellDelegate {
    return self.selectCellDelegate;
}


@end
