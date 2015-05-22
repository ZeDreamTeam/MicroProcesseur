sp 		:= $(sp).x
dirstack_$(sp)	:= $(d)
d		:= $(dir)

dir	:= $(d)/cores
include	$(dir)/rules.mk

dir := $(d)/ram
include $(dir)/rules.mk

dir := $(d)/rom
include $(dir)/rules.mk

dir := $(d)/reg
include $(dir)/rules.mk

dir := $(d)/pipeline
include $(dir)/rules.mk

dir	:= $(d)/alu
include	$(dir)/rules.mk

d		:= $(dirstack_$(sp))
sp		:= $(basename $(sp))
