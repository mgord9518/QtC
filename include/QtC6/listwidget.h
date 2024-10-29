#pragma once

#ifdef __cplusplus
extern "C" {
#endif

typedef struct QtC_ListWidget QtC_ListWidget;

QtC_ListWidget* QtC_ListWidget_create(
    QtC_Widget* parent
);

#ifdef __cplusplus
}
#endif
