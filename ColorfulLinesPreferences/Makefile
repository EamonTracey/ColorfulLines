ARCHS = arm64 arm64e

TARGET := iphone:clang::14.0

include $(THEOS)/makefiles/common.mk

BUNDLE_NAME = ColorfulLinesPreferences

ColorfulLinesPreferences_FILES = $(shell find Sources/ColorfulLinesPreferences -name "*.swift")
ColorfulLinesPreferences_INSTALL_PATH = /Library/PreferenceBundles
ColorfulLinesPreferences_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/bundle.mk
