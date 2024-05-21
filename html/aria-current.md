# aria-current 是什么

aria-current 是一种 ARIA（Accessible Rich Internet Applications）属性，它用于标识在一组导航链接中当前活动的项。这个属性对于辅助技术（如屏幕阅读器）非常有用，因为它可以明确告诉用户当前所在的页面或活动项，从而提高用户的导航体验。

aria-current 属性可以接受以下值：

- page: 表示当前活动的页面。
- step: 表示当前活动的步骤。
- location: 表示当前活动的位置。
- date: 表示当前活动的日期。
- time: 表示当前活动的时间。
- true: 表示当前活动的项，但不指定具体类型（类似于一个通用的活动状态）。
- false 或省略: 表示该项不是当前活动项。
