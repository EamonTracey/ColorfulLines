ARCHS = arm64 arm64e

TARGET := iphone:clang:13.7:13.0
PREFIX = $(THEOS)/toolchain/Xcode.xctoolchain/usr/bin/

INSTALL_TARGET_PROCESSES = SpringBoard

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = ColorfulLines

ColorfulLines_FILES = $(shell find Sources/ColorfulLines -name "*.swift") $(shell find Sources/ColorfulLinesC -name "*.m")
ColorfulLines_SWIFTFLAGS = -ISources/ColorfulLinesC/include
ColorfulLines_CFLAGS = -fobjc-arc
ColorfulLines_FRAMEWORKS = NomaePreferences

include $(THEOS_MAKE_PATH)/tweak.mk
SUBPROJECTS += ColorfulLinesPreferences
include $(THEOS_MAKE_PATH)/aggregate.mk
