TEMPLATE = subdirs

# Libraries

src_gestures_lib.subdir = LomiriGestures
src_gestures_lib.target = sub-gestures-lib
SUBDIRS += src_gestures_lib

src_metrics_lib.subdir = LomiriMetrics
src_metrics_lib.target = sub-metrics-lib
SUBDIRS += src_metrics_lib

src_toolkit_lib.subdir = LomiriToolkit
src_toolkit_lib.target = sub-toolkit-lib
src_toolkit_lib.depends = sub-gestures-lib sub-metrics-lib
SUBDIRS += src_toolkit_lib

# Plugins

linux {
    src_metrics_lttng_plugin.subdir = LomiriMetrics/lttng
    src_metrics_lttng_plugin.target = sub-metrics-lttng-plugin
    SUBDIRS += src_metrics_lttng_plugin
}

# QML modules

src_metrics_module.subdir = imports/Metrics
src_metrics_module.target = sub-metrics-module
src_metrics_module.depends = sub-metrics-lib
SUBDIRS += src_metrics_module

src_components_module.subdir = imports/Components
src_components_module.target = sub-components-module
src_components_module.depends = sub-toolkit-lib
SUBDIRS += src_components_module

src_layouts_module.subdir = imports/Layouts
src_layouts_module.target = sub-layouts-module
SUBDIRS += src_layouts_module

src_performance_metrics_module.subdir = imports/PerformanceMetrics
src_performance_metrics_module.target = sub-performance-metrics-module
SUBDIRS += src_performance_metrics_module

src_test_module.subdir = imports/Test
src_test_module.target = sub-test-module
src_test_module.depends = sub-toolkit-lib
SUBDIRS += src_test_module

ubuntu-uitk-compat {
    src_compat_components_module.subdir = imports-compat/Components
    src_compat_components_module.target = sub-compat-components-module
    src_compat_components_module.depends = sub-components-module
    SUBDIRS += src_compat_components_module

    src_compat_layouts_module.subdir = imports-compat/Layouts
    src_compat_layouts_module.target = sub-compat-layouts-module
    src_compat_layouts_module.depends = sub-layouts-module
    SUBDIRS += src_compat_layouts_module
}
