---
type: article
status: draft
---

# Customizing CupertinoDatePicker in Flutter

`CupertinoDatePicker` is, perhaps, the most minimalistic date picker in Flutter, it not only plays nicely with other iOS-styled widgets but also looks pretty organic with material widgets. Notably, unlike material picker, it can be embedded directly in a form, without a modal window. In this article, we'll investigate different ways of using the `CupertinoDatePicker` ~~and create a better one~~.

![](custom-cupertino-thumb.png)

## The result 

In this article, we've investigated `CupertinoDatePicker` and found out its limitations. To overcome those, we went with creating our custom `CupertinoDateTimePicker`, creating `CupertinoPickerSelectionOverlay` and `CupertinoPickerLine` along the way. Here's what the result looks like in an app:

![](custom-cupertino-result.gif)

You can find the playground app code in [this repo](https://github.com/astorDev/horology). You can also get `CupertinoDateTimePicker` by adding [this package](https://pub.dev/packages/horology) as a dependency.

And one more thing... claps are appreciated 👉👈
