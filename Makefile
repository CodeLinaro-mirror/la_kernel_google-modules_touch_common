# SPDX-License-Identifier: GPL-2.0

KERNEL_SRC ?= /lib/modules/$(shell uname -r)/build
M ?= $(shell pwd)

KBUILD_OPTIONS	+= CONFIG_TOUCHSCREEN_TBN=m
KBUILD_OPTIONS	+= CONFIG_TOUCHSCREEN_HEATMAP=m
KBUILD_OPTIONS	+= CONFIG_TOUCHSCREEN_OFFLOAD=m
KBUILD_OPTIONS	+= CONFIG_GOOG_TOUCH_INTERFACE=m
EXTRA_CFLAGS	+= -DDYNAMIC_DEBUG_MODULE

include $(KERNEL_SRC)/../private/google-modules/soc/gs/Makefile.include

modules modules_install headers_install clean:
	$(MAKE) -C $(KERNEL_SRC) M=$(M) $(KBUILD_OPTIONS) EXTRA_CFLAGS="$(EXTRA_CFLAGS)" $(@)
