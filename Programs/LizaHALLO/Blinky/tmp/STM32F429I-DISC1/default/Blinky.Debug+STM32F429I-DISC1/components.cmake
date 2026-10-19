# components.cmake

# component ARM::CMSIS-Compiler:CORE@1.2.1
add_library(ARM_CMSIS-Compiler_CORE_1_2_1 OBJECT
  "${CMSIS_PACK_ROOT}/ARM/CMSIS-Compiler/2.3.0/source/core/armcc/retarget_io.c"
)
target_include_directories(ARM_CMSIS-Compiler_CORE_1_2_1 PUBLIC
  $<TARGET_PROPERTY:${CONTEXT},INTERFACE_INCLUDE_DIRECTORIES>
)
target_compile_definitions(ARM_CMSIS-Compiler_CORE_1_2_1 PUBLIC
  $<TARGET_PROPERTY:${CONTEXT},INTERFACE_COMPILE_DEFINITIONS>
)
target_compile_options(ARM_CMSIS-Compiler_CORE_1_2_1 PUBLIC
  $<TARGET_PROPERTY:${CONTEXT},INTERFACE_COMPILE_OPTIONS>
)
target_link_libraries(ARM_CMSIS-Compiler_CORE_1_2_1 PUBLIC
  ${CONTEXT}_ABSTRACTIONS
)

# component ARM::CMSIS-Compiler:STDERR:Custom@1.1.0
add_library(ARM_CMSIS-Compiler_STDERR_Custom_1_1_0 INTERFACE)
target_include_directories(ARM_CMSIS-Compiler_STDERR_Custom_1_1_0 INTERFACE
  $<TARGET_PROPERTY:${CONTEXT},INTERFACE_INCLUDE_DIRECTORIES>
  "${CMSIS_PACK_ROOT}/ARM/CMSIS-Compiler/2.3.0/include"
)
target_compile_definitions(ARM_CMSIS-Compiler_STDERR_Custom_1_1_0 INTERFACE
  $<TARGET_PROPERTY:${CONTEXT},INTERFACE_COMPILE_DEFINITIONS>
)
target_link_libraries(ARM_CMSIS-Compiler_STDERR_Custom_1_1_0 INTERFACE
  ${CONTEXT}_ABSTRACTIONS
)

# component ARM::CMSIS-Compiler:STDIN:Custom@1.1.0
add_library(ARM_CMSIS-Compiler_STDIN_Custom_1_1_0 INTERFACE)
target_include_directories(ARM_CMSIS-Compiler_STDIN_Custom_1_1_0 INTERFACE
  $<TARGET_PROPERTY:${CONTEXT},INTERFACE_INCLUDE_DIRECTORIES>
  "${CMSIS_PACK_ROOT}/ARM/CMSIS-Compiler/2.3.0/include"
)
target_compile_definitions(ARM_CMSIS-Compiler_STDIN_Custom_1_1_0 INTERFACE
  $<TARGET_PROPERTY:${CONTEXT},INTERFACE_COMPILE_DEFINITIONS>
)
target_link_libraries(ARM_CMSIS-Compiler_STDIN_Custom_1_1_0 INTERFACE
  ${CONTEXT}_ABSTRACTIONS
)

# component ARM::CMSIS-Compiler:STDOUT:Custom@1.1.0
add_library(ARM_CMSIS-Compiler_STDOUT_Custom_1_1_0 INTERFACE)
target_include_directories(ARM_CMSIS-Compiler_STDOUT_Custom_1_1_0 INTERFACE
  $<TARGET_PROPERTY:${CONTEXT},INTERFACE_INCLUDE_DIRECTORIES>
  "${CMSIS_PACK_ROOT}/ARM/CMSIS-Compiler/2.3.0/include"
)
target_compile_definitions(ARM_CMSIS-Compiler_STDOUT_Custom_1_1_0 INTERFACE
  $<TARGET_PROPERTY:${CONTEXT},INTERFACE_COMPILE_DEFINITIONS>
)
target_link_libraries(ARM_CMSIS-Compiler_STDOUT_Custom_1_1_0 INTERFACE
  ${CONTEXT}_ABSTRACTIONS
)

# component ARM::CMSIS:CORE@6.4.0
add_library(ARM_CMSIS_CORE_6_4_0 INTERFACE)
target_include_directories(ARM_CMSIS_CORE_6_4_0 INTERFACE
  $<TARGET_PROPERTY:${CONTEXT},INTERFACE_INCLUDE_DIRECTORIES>
  "${CMSIS_PACK_ROOT}/ARM/CMSIS/6.4.0/CMSIS/Core/Include"
)
target_compile_definitions(ARM_CMSIS_CORE_6_4_0 INTERFACE
  $<TARGET_PROPERTY:${CONTEXT},INTERFACE_COMPILE_DEFINITIONS>
)
target_link_libraries(ARM_CMSIS_CORE_6_4_0 INTERFACE
  ${CONTEXT}_ABSTRACTIONS
)

# component ARM::CMSIS:OS Tick:SysTick@1.0.5
add_library(ARM_CMSIS_OS_Tick_SysTick_1_0_5 OBJECT
  "${CMSIS_PACK_ROOT}/ARM/CMSIS/6.4.0/CMSIS/RTOS2/Source/os_systick.c"
)
target_include_directories(ARM_CMSIS_OS_Tick_SysTick_1_0_5 PUBLIC
  $<TARGET_PROPERTY:${CONTEXT},INTERFACE_INCLUDE_DIRECTORIES>
  "${CMSIS_PACK_ROOT}/ARM/CMSIS/6.4.0/CMSIS/RTOS2/Include"
)
target_compile_definitions(ARM_CMSIS_OS_Tick_SysTick_1_0_5 PUBLIC
  $<TARGET_PROPERTY:${CONTEXT},INTERFACE_COMPILE_DEFINITIONS>
)
target_compile_options(ARM_CMSIS_OS_Tick_SysTick_1_0_5 PUBLIC
  $<TARGET_PROPERTY:${CONTEXT},INTERFACE_COMPILE_OPTIONS>
)
target_link_libraries(ARM_CMSIS_OS_Tick_SysTick_1_0_5 PUBLIC
  ${CONTEXT}_ABSTRACTIONS
)

# component ARM::CMSIS:RTOS2:Keil RTX5&Source@5.9.1
add_library(ARM_CMSIS_RTOS2_Keil_RTX5_Source_5_9_1 OBJECT
  "${CMSIS_PACK_ROOT}/ARM/CMSIS-RTX/5.9.1/Source/GCC/irq_armv7m.S"
  "${CMSIS_PACK_ROOT}/ARM/CMSIS-RTX/5.9.1/Source/rtx_delay.c"
  "${CMSIS_PACK_ROOT}/ARM/CMSIS-RTX/5.9.1/Source/rtx_evflags.c"
  "${CMSIS_PACK_ROOT}/ARM/CMSIS-RTX/5.9.1/Source/rtx_evr.c"
  "${CMSIS_PACK_ROOT}/ARM/CMSIS-RTX/5.9.1/Source/rtx_kernel.c"
  "${CMSIS_PACK_ROOT}/ARM/CMSIS-RTX/5.9.1/Source/rtx_lib.c"
  "${CMSIS_PACK_ROOT}/ARM/CMSIS-RTX/5.9.1/Source/rtx_memory.c"
  "${CMSIS_PACK_ROOT}/ARM/CMSIS-RTX/5.9.1/Source/rtx_mempool.c"
  "${CMSIS_PACK_ROOT}/ARM/CMSIS-RTX/5.9.1/Source/rtx_msgqueue.c"
  "${CMSIS_PACK_ROOT}/ARM/CMSIS-RTX/5.9.1/Source/rtx_mutex.c"
  "${CMSIS_PACK_ROOT}/ARM/CMSIS-RTX/5.9.1/Source/rtx_semaphore.c"
  "${CMSIS_PACK_ROOT}/ARM/CMSIS-RTX/5.9.1/Source/rtx_system.c"
  "${CMSIS_PACK_ROOT}/ARM/CMSIS-RTX/5.9.1/Source/rtx_thread.c"
  "${CMSIS_PACK_ROOT}/ARM/CMSIS-RTX/5.9.1/Source/rtx_timer.c"
  "${SOLUTION_ROOT}/RTE/CMSIS/RTX_Config.c"
)
target_include_directories(ARM_CMSIS_RTOS2_Keil_RTX5_Source_5_9_1 PUBLIC
  $<TARGET_PROPERTY:${CONTEXT},INTERFACE_INCLUDE_DIRECTORIES>
  "${SOLUTION_ROOT}/RTE/CMSIS"
  "${CMSIS_PACK_ROOT}/ARM/CMSIS-RTX/5.9.1/Include"
  "${CMSIS_PACK_ROOT}/ARM/CMSIS/6.4.0/CMSIS/RTOS2/Include"
)
target_compile_definitions(ARM_CMSIS_RTOS2_Keil_RTX5_Source_5_9_1 PUBLIC
  $<TARGET_PROPERTY:${CONTEXT},INTERFACE_COMPILE_DEFINITIONS>
)
target_compile_options(ARM_CMSIS_RTOS2_Keil_RTX5_Source_5_9_1 PUBLIC
  $<TARGET_PROPERTY:${CONTEXT},INTERFACE_COMPILE_OPTIONS>
)
target_link_libraries(ARM_CMSIS_RTOS2_Keil_RTX5_Source_5_9_1 PUBLIC
  ${CONTEXT}_ABSTRACTIONS
)
set_source_files_properties("${CMSIS_PACK_ROOT}/ARM/CMSIS-RTX/5.9.1/Source/GCC/irq_armv7m.S" PROPERTIES
  COMPILE_DEFINITIONS "STM32F429xx;_RTE_"
)

# component Keil::CMSIS Driver:GPIO@1.2.0
add_library(Keil_CMSIS_Driver_GPIO_1_2_0 OBJECT
  "${CMSIS_PACK_ROOT}/ARM/CMSIS-Driver_STM32/1.4.0/Drivers/GPIO_STM32.c"
)
target_include_directories(Keil_CMSIS_Driver_GPIO_1_2_0 PUBLIC
  $<TARGET_PROPERTY:${CONTEXT},INTERFACE_INCLUDE_DIRECTORIES>
  "${CMSIS_PACK_ROOT}/ARM/CMSIS-Driver_STM32/1.4.0/Drivers"
  "${CMSIS_PACK_ROOT}/ARM/CMSIS/6.4.0/CMSIS/Driver/Include"
)
target_compile_definitions(Keil_CMSIS_Driver_GPIO_1_2_0 PUBLIC
  $<TARGET_PROPERTY:${CONTEXT},INTERFACE_COMPILE_DEFINITIONS>
)
target_compile_options(Keil_CMSIS_Driver_GPIO_1_2_0 PUBLIC
  $<TARGET_PROPERTY:${CONTEXT},INTERFACE_COMPILE_OPTIONS>
)
target_link_libraries(Keil_CMSIS_Driver_GPIO_1_2_0 PUBLIC
  ${CONTEXT}_ABSTRACTIONS
)

# component Keil::CMSIS Driver:USART@3.0.0
add_library(Keil_CMSIS_Driver_USART_3_0_0 OBJECT
  "${CMSIS_PACK_ROOT}/ARM/CMSIS-Driver_STM32/1.4.0/Drivers/USART_STM32.c"
)
target_include_directories(Keil_CMSIS_Driver_USART_3_0_0 PUBLIC
  $<TARGET_PROPERTY:${CONTEXT},INTERFACE_INCLUDE_DIRECTORIES>
  "${CMSIS_PACK_ROOT}/ARM/CMSIS-Driver_STM32/1.4.0/Drivers"
  "${CMSIS_PACK_ROOT}/ARM/CMSIS/6.4.0/CMSIS/Driver/Include"
)
target_compile_definitions(Keil_CMSIS_Driver_USART_3_0_0 PUBLIC
  $<TARGET_PROPERTY:${CONTEXT},INTERFACE_COMPILE_DEFINITIONS>
)
target_compile_options(Keil_CMSIS_Driver_USART_3_0_0 PUBLIC
  $<TARGET_PROPERTY:${CONTEXT},INTERFACE_COMPILE_OPTIONS>
)
target_link_libraries(Keil_CMSIS_Driver_USART_3_0_0 PUBLIC
  ${CONTEXT}_ABSTRACTIONS
)

# component Keil::CMSIS Driver:VIO:Board@1.0.0
add_library(Keil_CMSIS_Driver_VIO_Board_1_0_0 OBJECT
  "${CMSIS_PACK_ROOT}/Keil/STM32F429I-DISC1_BSP/1.1.0/CMSIS/Driver/vio_STM32F429I-DISC1.c"
)
target_include_directories(Keil_CMSIS_Driver_VIO_Board_1_0_0 PUBLIC
  $<TARGET_PROPERTY:${CONTEXT},INTERFACE_INCLUDE_DIRECTORIES>
  "${CMSIS_PACK_ROOT}/ARM/CMSIS/6.4.0/CMSIS/Driver/VIO/Include"
)
target_compile_definitions(Keil_CMSIS_Driver_VIO_Board_1_0_0 PUBLIC
  $<TARGET_PROPERTY:${CONTEXT},INTERFACE_COMPILE_DEFINITIONS>
)
target_compile_options(Keil_CMSIS_Driver_VIO_Board_1_0_0 PUBLIC
  $<TARGET_PROPERTY:${CONTEXT},INTERFACE_COMPILE_OPTIONS>
)
target_link_libraries(Keil_CMSIS_Driver_VIO_Board_1_0_0 PUBLIC
  ${CONTEXT}_ABSTRACTIONS
)

# component Keil::Device:CubeMX@1.0.0
add_library(Keil_Device_CubeMX_1_0_0 INTERFACE)
target_include_directories(Keil_Device_CubeMX_1_0_0 INTERFACE
  $<TARGET_PROPERTY:${CONTEXT},INTERFACE_INCLUDE_DIRECTORIES>
)
target_compile_definitions(Keil_Device_CubeMX_1_0_0 INTERFACE
  $<TARGET_PROPERTY:${CONTEXT},INTERFACE_COMPILE_DEFINITIONS>
)
target_link_libraries(Keil_Device_CubeMX_1_0_0 INTERFACE
  ${CONTEXT}_ABSTRACTIONS
)
