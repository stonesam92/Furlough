include theos/makefiles/common.mk

LIBRARY_NAME = Furlough
Furlough_FILES = Furlough.mm fishhook.c Substrate.m

include $(THEOS_MAKE_PATH)/library.mk
