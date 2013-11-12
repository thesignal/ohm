# The name of your app.
# NOTICE: name defined in TARGET has a corresponding QML filename.
#         If name defined in TARGET is changed, following needs to be
#         done to match new name:
#         - corresponding QML filename must be changed
#         - desktop icon filename must be changed
#         - desktop filename must be changed
#         - icon definition filename in desktop file must be changed
TARGET = Ohm

CONFIG += sailfishapp

SOURCES += src/Ohm.cpp

OTHER_FILES += qml/Ohm.qml \
    qml/cover/CoverPage.qml \
    rpm/Ohm.spec \
    rpm/Ohm.yaml \
    Ohm.desktop \
    qml/pages/MainPage.qml \
    qml/pages/resistorcolor.qml \
    qml/pages/Settings.qml \
    qml/pages/About.qml \
    ../ress/resistor.png \
    ../resistor.png \
    qml/pages/js/resistorcolor.js \
    qml/pages/smdresistorcalc.qml \
    qml/pages/capacitorcodes.qml \
    qml/img/capacitor.png \
    qml/img/logo_ohm.png \
    qml/img/induct.png \
    qml/img/resistor.png \
    qml/img/smdresistor.png

