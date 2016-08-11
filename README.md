# IndexTitlesForTableView
IndexTitlesForTableView

![自定义索引](http://upload-images.jianshu.io/upload_images/9294-f314d028c3aad342.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

# Usage

```obj
#import "UITableView+LCL.h"
```

```obj
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
    {
        static NSString *CellIdentifier = @"cell";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        if (cell == nil) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        }
        cell.textLabel.text = @"xxx";
        [tableView setSectionIndexFont:[UIFont systemFontOfSize:25] textColor:[UIColor blueColor]];
        [tableView setSectionIndexBackgroundColor:[UIColor colorWithWhite:.5 alpha:1]];
        return cell;
    }
```
