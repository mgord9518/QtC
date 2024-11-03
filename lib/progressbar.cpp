#include <QtWidgets/QProgressBar>

#include <QtC6/private/common.h>
#include <QtC6/progressbar.h>

extern "C" {

QtC_COMMON_FUNCTIONS(ProgressBar);

QtC_ProgressBar* QtC_ProgressBar_new(QtC_Widget* parent) {
    return QtC_FROM_CLASS(ProgressBar, new QProgressBar(
        QtC_TO_CLASS(Widget, parent)
    ));
}

}
