#pragma once

#define DEF(Class) \
    typedef struct QtC_##Class QtC_##Class;

#define DEF_STATIC_SIZE(Class, Size, Alignment) \
    typedef struct QtC_##Class{ char a[Size] __attribute__((aligned(Alignment))); } QtC_##Class;

// We must know size and alignment to use objects on the stack
// These MUST be asserted in the C++ implementation file (eg: `lib/icon.cpp`)
//DEF_STATIC_SIZE(Icon, 8, 8)
DEF(Icon)
DEF_STATIC_SIZE(String, 24, 8)

DEF(Layout)
DEF(BoxLayout)

DEF(Widget)
DEF(Label)
DEF(AbstractButton)
DEF(AbstractItemView)
DEF(AbstractScrollArea)
DEF(Frame)
DEF(Label)
DEF(LineEdit)
DEF(ListView)
DEF(ListWidget)
DEF(MainWindow)
DEF(MenuBar)
DEF(AbstractButton)
DEF(PushButton)
DEF(ProgressBar)
DEF(ColumnView)
DEF(TreeView)
DEF(TreeWidget)
DEF(TreeWidgetItem)
DEF(TabWidget)
