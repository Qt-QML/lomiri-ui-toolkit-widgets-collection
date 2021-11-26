import Lomiri.PerformanceMetrics 1.0

// DeprecationPrinter
import QtQml 2.9
import Lomiri.Components.Private 1.3

RenderingTimes {
    Component.onCompleted: {
        DeprecationPrinter.printDeprecation(
            DeprecationPrinter.PERFORMANCEMETRICS);
    }
}
