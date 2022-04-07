RM := rm -rf
DHCPMON_TARGET := dhcpmon
CP := cp
MKDIR := mkdir
CC := gcc
MV := mv
CPPFLAGS += -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)"
LDLIBS += -levent -lexplain

# All Target
all: $(DHCPMON_TARGET)

# All of the sources participating in the build are defined here
-include src/subdir.mk

ifneq ($(MAKECMDGOALS),clean)
-include $(OBJS:%.o=%.d)
endif

# Add inputs and outputs from these tool invocations to the build variables 

# Tool invocations
$(DHCPMON_TARGET): $(OBJS)
	$(CC) $(LDFLAGS) $^ $(LDLIBS) -o $@

# Other Targets
install:
	$(MKDIR) -p $(DESTDIR)/usr/sbin
	$(MV) $(DHCPMON_TARGET) $(DESTDIR)/usr/sbin

deinstall:
	$(RM) $(DESTDIR)/usr/sbin/$(DHCPMON_TARGET)
	$(RM) -rf $(DESTDIR)/usr/sbin

clean:
	-$(RM) $(EXECUTABLES) $(OBJS:%.o=%.d) $(C_DEPS) $(DHCPMON_TARGET)
	-@echo ' '

.PHONY: all clean dependents
