ARCHS = arm64 arm64e

TARGET := iphone:clang:13.7:13.0
PREFIX = $(THEOS)/toolchain/Xcode.xctoolchain/usr/bin/

include $(THEOS)/makefiles/common.mk

BUNDLE_NAME = ColorfulLinesPreferences

ColorfulLinesPreferences_FILES = $(shell find Sources/ColorfulLinesPreferences -name "*.swift")
ColorfulLinesPreferences_INSTALL_PATH = /Library/PreferenceBundles
ColorfulLinesPreferences_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/bundle.mk
