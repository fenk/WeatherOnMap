//
//  ModalSelectionView.m
//  Loterity
//
//  Created by Jacek Grygiel on 11/28/12.
//
//

#import "ModalFadingView.h"
#import <QuartzCore/QuartzCore.h>



@interface ModalFadingView ()
{
	UIView *parentView;

}

@end

@implementation ModalFadingView
@synthesize delegate = _delegate;

- (id)init
{
	self = [super init];
	if (self) {
		
		CGRect bounds = [UIScreen mainScreen].bounds;
		self.backgroundColor = [UIColor clearColor];
		self.frame = CGRectMake(0, 0, bounds.size.width, bounds.size.height);
		
		self.layer.masksToBounds = NO;

		UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(cancelAndHideView)];
		tapGesture.delegate = self;
		[self addGestureRecognizer:tapGesture];
		self.userInteractionEnabled = YES;
	}
	return self;
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch{
	//UIView *view = touch.view;

	if ([touch.view isKindOfClass:NSClassFromString(@"UITableViewCellContentView")]) {
		return NO;
	}
	return YES;
}

#pragma View handling ( fading appearing )


- (void) showInView:(UIView*) parent{
	for (id subview in [parent subviews]) {
    if ([subview isKindOfClass:[ModalFadingView class]]) return;
	}
	
	parentView = parent;	
	
	[self.tableView setTransform:CGAffineTransformMakeScale(0.01, 0.01)];
	
	self.alpha = 0.0;

	[parentView addSubview:self];
	
	[UIView animateWithDuration:0.5 animations:^{
		self.alpha = 1.0;
		[self.tableView setTransform:CGAffineTransformMakeScale(1.0, 1.0)];
	} completion:^(BOOL finished) {
		[self setNeedsDisplay];
	}];
	
	
	
}
- (void) hideInParentView{
	
	parentView = nil;
	

		[UIView animateWithDuration:0.5 animations:^{
			self.alpha = 0.0;
			[self.tableView setTransform:CGAffineTransformMakeScale(0.01, 0.01)];
		} completion:^(BOOL finished) {
			[self removeFromSuperview];
		}];
}


- (void) cancelAndHideView{
	if ([self.delegate respondsToSelector:@selector(didFilledDataCancelled:)]) {
		[self.delegate didFilledDataCancelled:self];
	}
	
	[self hideInParentView];
}
- (void) loadData:(id) data{
	

}

- (void)drawRect:(CGRect)rect{
	CGContextRef context = UIGraphicsGetCurrentContext();
	size_t locationsCount = 2;
	CGFloat locations[2] = {0.0f, 1.0f};
	CGFloat colors[8] = {0.0f,0.0f,0.0f,0.0f,0.0f,0.0f,0.0f,0.0f};
	CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
	CGGradientRef gradient = CGGradientCreateWithColorComponents(colorSpace, colors, locations, locationsCount);
	CGColorSpaceRelease(colorSpace);
	
	CGPoint center = CGPointMake(self.bounds.size.width/2, self.bounds.size.height/2);
	float radius = MIN(self.bounds.size.width , self.bounds.size.height) ;
	CGContextDrawRadialGradient (context, gradient, center, 0, center, radius, kCGGradientDrawsAfterEndLocation);
	CGGradientRelease(gradient);
}

@end
