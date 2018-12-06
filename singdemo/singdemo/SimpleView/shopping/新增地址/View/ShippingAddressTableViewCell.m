//
//  ShippingAddressTableViewCell.m
//  ChaseFishProject
//
//  Created by 朱佳男 on 2017/3/19.
//  Copyright © 2017年 ShangYuKeJi. All rights reserved.
//

#import "ShippingAddressTableViewCell.h"

@implementation ShippingAddressTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
//    [self.moRenButton setImage:[UIImage imageNamed:@"默认地址选中状态"] forState:UIControlStateSelected];
//    self.moRenButton.selected = NO;
    // Initialization code
}
-(void)setModel:(ShippingAddressModel *)model{
    _model = model;
    self.nameLabel.text = [NSString stringWithFormat:@"%@",model.name];
    self.phoneLabel.text = [NSString stringWithFormat:@"%@",model.phone];
    self.addressLabel.text = [NSString stringWithFormat:@"%@%@",model.location,model.address];
    
    if (model.isSelected) {
        self.moRenButton.selected = YES;
    }else{
        self.moRenButton.selected = NO;
    }
}
- (IBAction)moRenButtonClick:(id)sender {
    if (_moRenButton.selected == YES) {
        return;
    }
    self.moRenButton.selected = !self.moRenButton.isSelected;
    if (self.delegate && [self.delegate respondsToSelector:@selector(shippingAddressTableViewCellMoRenButtonClick:)]) {
        [self.delegate shippingAddressTableViewCellMoRenButtonClick:self.moRenButton];
    }
}
- (IBAction)editButtonClick:(id)sender {
    if (self.delegate && [self.delegate respondsToSelector:@selector(shippingAddressTableViewCelleditButtonClick:)]) {
        [self.delegate shippingAddressTableViewCelleditButtonClick:self.editButton];
    }
}
- (IBAction)deleteButtonClick:(id)sender {
    if (self.delegate && [self.delegate respondsToSelector:@selector(shippingAddressTableViewCelldeleteButtonClick:)]) {
        [self.delegate shippingAddressTableViewCelldeleteButtonClick:self.deleteButton];
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
