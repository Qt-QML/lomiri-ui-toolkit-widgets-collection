CXX_MODULE = qml
TARGET  = UbuntuComponents
SRCPATH = Lomiri/Components
TARGETPATH = Lomiri/Components

include(plugin/plugin.pri)

OTHER_FILES+= qmldir \
             1.3/CrossFadeImage.qdoc \
             1.3/PageHeadConfiguration.qdoc \
             1.3/MainView.qdoc \
             1.3/Icon.qdoc

for 
