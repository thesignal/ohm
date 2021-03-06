# The name of your app.
# NOTICE: name defined in TARGET has a corresponding QML filename.
#         If name defined in TARGET is changed, following needs to be
#         done to match new name:
#         - corresponding QML filename must be changed
#         - desktop icon filename must be changed
#         - desktop filename must be changed
#         - icon definition filename in desktop file must be changed
TARGET = harbour-ohm

#CONFIG += sailfishapp
# Start of temporary fix for the icon for the Nov 2013 harbour requirements
# QML files and folders
QT += quick qml
CONFIG += link_pkgconfig
PKGCONFIG += sailfishapp
INCLUDEPATH += /usr/include/sailfishapp

TARGETPATH = /usr/bin
target.path = $$TARGETPATH

DEPLOYMENT_PATH = /usr/share/$$TARGET
qml.files = qml
qml.path = $$DEPLOYMENT_PATH

desktop.files = harbour-ohm.desktop
desktop.path = /usr/share/applications

icon.files = harbour-ohm.png
icon.path = /usr/share/icons/hicolor/86x86/apps

INSTALLS += target icon desktop qml
# End of nov 2013 fix

SOURCES += src/Ohm.cpp

OTHER_FILES += \
    qml/pages/MainPage.qml \
    qml/pages/resistorcolor.qml \
    qml/pages/About.qml \
    ../ress/resistor.png \
    ../resistor.png \
    qml/pages/smdresistorcalc.qml \
    qml/pages/capacitorcodes.qml \
    qml/img/capacitor.png \
    qml/img/logo_ohm.png \
    qml/img/induct.png \
    qml/img/resistor.png \
    qml/img/smdresistor.png \
    qml/img/spiral.png \
    qml/img/resistor_6rings.png \
    qml/pages/induction.qml \
    qml/img/resistor_big_6rings.png \
    qml/img/resistor_big_5rings.png \
    qml/img/resistor_big_4rings.png \
    qml/img/resistor_big_3rings.png \
    qml/img/bigsmd_empty.png \
    qml/img/vga_male.png \
    qml/img/vga_icon.png \
    qml/img/vga_female.png \
    qml/pages/vga_pins.qml \
    qml/img/usb_norm.png \
    qml/img/usb_mini.png \
    qml/pages/usb_pins.qml \
    qml/pages/serial_pins.qml \
    qml/img/usb_icon.png \
    qml/img/seriell_male.png \
    qml/img/seriell_icon.png \
    qml/img/serial_female.png \
    qml/harbour-ohm.qml \
    harbour-ohm.png \
    harbour-ohm.desktop \
    rpm/harbour-ohm.spec \
    rpm/harbour-ohm.yaml

