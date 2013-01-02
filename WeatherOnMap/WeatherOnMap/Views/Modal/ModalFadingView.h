//
//  ModalSelectionView.h
//  Loterity
//
//  Created by Jacek Grygiel on 11/28/12.
//
//

#import <UIKit/UIKit.h>
@class ModalFadingView;
@protocol ModalFadingViewDelegate <NSObject>

@optional
- (void) didFilledDataChanged:(ModalFadingView*) modalSelectionView withData:(id) data;
- (void) didFilledDataCancelled:(ModalFadingView*) modalSelectionView;
@end


@interface ModalFadingView : UIView<ModalFadingViewDelegate, UIGestureRecognizerDelegate>
{
	id<ModalFadingViewDelegate> _delegate;
	UITableView *_tableView;
	
}


@property(nonatomic, assign) id<ModalFadingViewDelegate> delegate;
@property(nonatomic, retain) UITableView *tableView;

- (void) showInView:(UIView*) parent;
- (void) hideInParentView;
- (void) loadData:(id) data;

@end
