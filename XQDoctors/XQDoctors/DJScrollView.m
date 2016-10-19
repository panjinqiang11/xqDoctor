
#import "DJScrollView.h"

@implementation DJScrollView

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    if ( !self.dragging )
    {
        [[self nextResponder] touchesBegan:touches withEvent:event];
    }
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    if ( !self.dragging )
    {
        [[self nextResponder] touchesBegan:touches withEvent:event];
    }
}


@end
