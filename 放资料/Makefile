ifdef DEFINE_VRE
	VRE = "hello, world"
else
endif

ifeq ($(OPT), define)
	VRE ?= "hello, world, first"
endif

ifeq ($(OPT), add)
	VRE += "wentao"
endif

ifeq ($(OPT), recover)
	VRE := "hello, world, again"
endif

all:
	@echo $(VRE)