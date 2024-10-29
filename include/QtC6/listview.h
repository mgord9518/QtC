#pragma once

#ifdef __cplusplus
extern "C" {
#endif

typedef struct QtC_ListView QtC_ListView;

QtC_ListView* QtC_ListView_create(
    QtC_Widget* parent
);

#ifdef __cplusplus
}
#endif
