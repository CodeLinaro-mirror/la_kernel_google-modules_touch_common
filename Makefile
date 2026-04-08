# SPDX-License-Identifier: GPL-2.0

KERNEL_SRC ?= /lib/modules/$(shell uname -r)/build
M ?= $(shell pwd)

CFLAGS_MODULE	+= -DDYNAMIC_DEBUG_MODULE

include $(KERNEL_SRC)/../private/google-modules/soc/gs/Makefile.include

modules modules_install headers_install clean:
	$(MAKE) -C $(KERNEL_SRC) M=$(M) \
	CFLAGS_MODULE="$(CFLAGS_MODULE)" KBUILD_EXTRA_SYMBOLS="$(EXTRA_SYMBOLS)" $(@)

modules_install: headers_install
