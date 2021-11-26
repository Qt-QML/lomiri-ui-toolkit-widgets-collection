import Lomiri.Layouts 1.0

// DeprecationPrinter
import QtQml 2.9
import Lomiri.Components.Private 1.3

ConditionalLayout {
    Component.onCompleted: {
        DeprecationPrinter.printDeprecation(
            DeprecationPrinter.LAYOUTS);
    }
}
