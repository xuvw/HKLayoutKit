# HKLayoutKit
基于Swift的一个自动布局库

```Swift
func demo0() {
        let v = UIView()
        v.backgroundColor = UIColor.randomColor()
        view.addSubview(v)
        
        v.Top == view.Top + 20
        v.Left == view.Left + 20
        v.Bottom == view.Bottom - 20
        v.Right == view.Right - 20
        
        let v1 = UIView()
        v1.backgroundColor = UIColor.randomColor()
        view.addSubview(v1)
        
        v1.Origin === CGPointMake(30, 30)
        v1.Size === CGSizeMake(40, 40)
        
        let v2 = UIView()
        v2.backgroundColor = UIColor.randomColor()
        v.addSubview(v2)
        v2.Inset === UIEdgeInsetsMake(50, 50, 50, 50)
        
        let v3 = UIView()
        v3.backgroundColor = UIColor.randomColor()
        v2.addSubview(v3)
        v3.Width == v2.Width * 0.2
        v3.Width == v3.Height
        v3.Center === CGPointMake(0, 0)
    }
```
