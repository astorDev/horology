---
type: article
status: draft
---

# Customizing CupertinoDatePicker in Flutter

`CupertinoDatePicker` is, perharps, the most minimalistic date picker in Flutter, it not only plays nicely with other iOS-styled widgets, but also looks pretty organic with material widgets. Notably, unlike material picker, it can be embeded directly in a form, without a modal window. In this artilcle, we'll investigate different ways of using the `CupertinoDatePicker` ~~and create a better one~~.

![](custom-cupertino-thumb.png)

## The result 

In this article, we've investigated `CupertinoDatePicker` and found out it's limitation. To overcome those, we went with of creating our custom `CupertinoDateTimePicker`. And, creating `CupertinoPickerSelectionOverlay` `CupertinoPickerLine` along the way. Here's how the result look like in an app:

![](custom-cupertino-result.gif)

You can find the playground app code in [this repo](). You can also get `CupertinoDateTimePicker` adding [this package]() as a dependency.

And one more thing... claps are appreciated 👉👈
