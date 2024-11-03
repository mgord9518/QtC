#define DEF(Class) \
    typedef struct QtC_##Class QtC_##Class;

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
DEF(PushButton)
DEF(ProgressBar)
DEF(ColumnView)
DEF(TreeView)
DEF(TreeWidget)
DEF(TreeWidgetItem)
