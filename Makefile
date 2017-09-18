
export TARGET = simulator:clang
export ARCHS = x86_64 i386

include theos/makefiles/common.mk

TWEAK_NAME = Harbor

Harbor_FILES += Tweak.xm SBIconView.xm CAKeyframeAnimation+dockBounce.m HBPreferences.m
Harbor_FILES += extensions/UIView+Origin.m

Harbor_CFLAGS += -Iinclude -Iextensions

Harbor_FRAMEWORKS += CoreGraphics UIKit QuartzCore

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 SpringBoard"
SUBPROJECTS += harborprefs
include $(THEOS_MAKE_PATH)/aggregate.mk
