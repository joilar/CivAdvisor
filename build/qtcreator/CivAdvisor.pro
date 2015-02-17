TEMPLATE = app

QT += qml quick widgets sql

HEADERS += \
    ../../src/civ/object.h \
    ../../src/civ/advance.h \
    ../../src/application.h

SOURCES += \
    ../../src/main.cpp \
    ../../src/civ/object.cpp \
    ../../src/civ/advance.cpp \
    ../../src/application.cpp

RESOURCES += \
    ../../ui/qml.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Default rules for deployment.
include(deployment.pri)

OTHER_FILES += \
    ../../db/basic.sql

# Custom targets for application databases.
basicdb.target = basic.sqlite
basicdb.depends = $$absolute_path( $$find(OTHER_FILES, basic.sql), $$_PRO_FILE_PWD_ )
basicdb.commands = sqlite3 $$basicdb.target < $$basicdb.depends

QMAKE_EXTRA_TARGETS += basicdb
POST_TARGETDEPS += $$basicdb.target
QMAKE_CLEAN += $$basicdb.target
