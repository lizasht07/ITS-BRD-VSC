# groups.cmake

# group Source Files
add_library(Group_Source_Files OBJECT
  "${SOLUTION_ROOT}/Blinky.c"
)
target_include_directories(Group_Source_Files PUBLIC
  $<TARGET_PROPERTY:${CONTEXT},INTERFACE_INCLUDE_DIRECTORIES>
)
target_compile_definitions(Group_Source_Files PUBLIC
  $<TARGET_PROPERTY:${CONTEXT},INTERFACE_COMPILE_DEFINITIONS>
)
add_library(Group_Source_Files_ABSTRACTIONS INTERFACE)
target_link_libraries(Group_Source_Files_ABSTRACTIONS INTERFACE
  ${CONTEXT}_ABSTRACTIONS
)
target_compile_options(Group_Source_Files PUBLIC
  $<TARGET_PROPERTY:${CONTEXT},INTERFACE_COMPILE_OPTIONS>
)
target_link_libraries(Group_Source_Files PUBLIC
  Group_Source_Files_ABSTRACTIONS
)

# file ../../../../retarget_stdio.c
add_library(Group_Source_Files_____________retarget_stdio_c OBJECT
  "${SOLUTION_ROOT}/retarget_stdio.c"
)
target_include_directories(Group_Source_Files_____________retarget_stdio_c PUBLIC
  $<TARGET_PROPERTY:Group_Source_Files,INTERFACE_INCLUDE_DIRECTORIES>
)
target_compile_definitions(Group_Source_Files_____________retarget_stdio_c PUBLIC
  $<$<COMPILE_LANGUAGE:C,CXX>:
    RETARGET_STDIO_UART=1
  >
  $<TARGET_PROPERTY:Group_Source_Files,INTERFACE_COMPILE_DEFINITIONS>
)
target_compile_options(Group_Source_Files_____________retarget_stdio_c PUBLIC
  $<TARGET_PROPERTY:Group_Source_Files,INTERFACE_COMPILE_OPTIONS>
)

# group CubeMX
add_library(Group_CubeMX OBJECT
  "${SOLUTION_ROOT}/STM32CubeMX/STM32F429I-DISC1/STM32CubeMX/MDK-ARM/startup_stm32f429xx.s"
  "${SOLUTION_ROOT}/STM32CubeMX/STM32F429I-DISC1/STM32CubeMX/Src/main.c"
  "${SOLUTION_ROOT}/STM32CubeMX/STM32F429I-DISC1/STM32CubeMX/Src/stm32f4xx_it.c"
  "${SOLUTION_ROOT}/STM32CubeMX/STM32F429I-DISC1/STM32CubeMX/Src/stm32f4xx_hal_msp.c"
  "${SOLUTION_ROOT}/STM32CubeMX/STM32F429I-DISC1/STM32CubeMX/Src/stm32f4xx_hal_timebase_tim.c"
  "${SOLUTION_ROOT}/STM32CubeMX/STM32F429I-DISC1/STM32CubeMX/Src/system_stm32f4xx.c"
)
target_include_directories(Group_CubeMX PUBLIC
  $<TARGET_PROPERTY:${CONTEXT},INTERFACE_INCLUDE_DIRECTORIES>
)
target_compile_definitions(Group_CubeMX PUBLIC
  $<TARGET_PROPERTY:${CONTEXT},INTERFACE_COMPILE_DEFINITIONS>
)
add_library(Group_CubeMX_ABSTRACTIONS INTERFACE)
target_link_libraries(Group_CubeMX_ABSTRACTIONS INTERFACE
  ${CONTEXT}_ABSTRACTIONS
)
target_compile_options(Group_CubeMX PUBLIC
  $<TARGET_PROPERTY:${CONTEXT},INTERFACE_COMPILE_OPTIONS>
)
target_link_libraries(Group_CubeMX PUBLIC
  Group_CubeMX_ABSTRACTIONS
)
set(COMPILE_DEFINITIONS
  STM32F429xx
  _RTE_
)
cbuild_set_defines(AS_ARM COMPILE_DEFINITIONS)
set_source_files_properties("${SOLUTION_ROOT}/STM32CubeMX/STM32F429I-DISC1/STM32CubeMX/MDK-ARM/startup_stm32f429xx.s" PROPERTIES
  COMPILE_FLAGS "${COMPILE_DEFINITIONS}"
)

# group STM32 HAL Driver
add_library(Group_STM32_HAL_Driver OBJECT
  "${SOLUTION_ROOT}/STM32CubeMX/STM32F429I-DISC1/STM32CubeMX/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_crc.c"
  "${SOLUTION_ROOT}/STM32CubeMX/STM32F429I-DISC1/STM32CubeMX/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_rcc.c"
  "${SOLUTION_ROOT}/STM32CubeMX/STM32F429I-DISC1/STM32CubeMX/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_rcc_ex.c"
  "${SOLUTION_ROOT}/STM32CubeMX/STM32F429I-DISC1/STM32CubeMX/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_flash.c"
  "${SOLUTION_ROOT}/STM32CubeMX/STM32F429I-DISC1/STM32CubeMX/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_flash_ex.c"
  "${SOLUTION_ROOT}/STM32CubeMX/STM32F429I-DISC1/STM32CubeMX/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_flash_ramfunc.c"
  "${SOLUTION_ROOT}/STM32CubeMX/STM32F429I-DISC1/STM32CubeMX/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_gpio.c"
  "${SOLUTION_ROOT}/STM32CubeMX/STM32F429I-DISC1/STM32CubeMX/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_dma_ex.c"
  "${SOLUTION_ROOT}/STM32CubeMX/STM32F429I-DISC1/STM32CubeMX/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_dma.c"
  "${SOLUTION_ROOT}/STM32CubeMX/STM32F429I-DISC1/STM32CubeMX/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_pwr.c"
  "${SOLUTION_ROOT}/STM32CubeMX/STM32F429I-DISC1/STM32CubeMX/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_pwr_ex.c"
  "${SOLUTION_ROOT}/STM32CubeMX/STM32F429I-DISC1/STM32CubeMX/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_cortex.c"
  "${SOLUTION_ROOT}/STM32CubeMX/STM32F429I-DISC1/STM32CubeMX/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal.c"
  "${SOLUTION_ROOT}/STM32CubeMX/STM32F429I-DISC1/STM32CubeMX/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_exti.c"
  "${SOLUTION_ROOT}/STM32CubeMX/STM32F429I-DISC1/STM32CubeMX/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_dma2d.c"
  "${SOLUTION_ROOT}/STM32CubeMX/STM32F429I-DISC1/STM32CubeMX/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_ll_fmc.c"
  "${SOLUTION_ROOT}/STM32CubeMX/STM32F429I-DISC1/STM32CubeMX/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_sdram.c"
  "${SOLUTION_ROOT}/STM32CubeMX/STM32F429I-DISC1/STM32CubeMX/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_i2c.c"
  "${SOLUTION_ROOT}/STM32CubeMX/STM32F429I-DISC1/STM32CubeMX/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_i2c_ex.c"
  "${SOLUTION_ROOT}/STM32CubeMX/STM32F429I-DISC1/STM32CubeMX/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_ltdc.c"
  "${SOLUTION_ROOT}/STM32CubeMX/STM32F429I-DISC1/STM32CubeMX/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_ltdc_ex.c"
  "${SOLUTION_ROOT}/STM32CubeMX/STM32F429I-DISC1/STM32CubeMX/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_dsi.c"
  "${SOLUTION_ROOT}/STM32CubeMX/STM32F429I-DISC1/STM32CubeMX/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_spi.c"
  "${SOLUTION_ROOT}/STM32CubeMX/STM32F429I-DISC1/STM32CubeMX/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_tim.c"
  "${SOLUTION_ROOT}/STM32CubeMX/STM32F429I-DISC1/STM32CubeMX/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_tim_ex.c"
  "${SOLUTION_ROOT}/STM32CubeMX/STM32F429I-DISC1/STM32CubeMX/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_uart.c"
)
target_include_directories(Group_STM32_HAL_Driver PUBLIC
  $<TARGET_PROPERTY:${CONTEXT},INTERFACE_INCLUDE_DIRECTORIES>
)
target_compile_definitions(Group_STM32_HAL_Driver PUBLIC
  $<TARGET_PROPERTY:${CONTEXT},INTERFACE_COMPILE_DEFINITIONS>
)
add_library(Group_STM32_HAL_Driver_ABSTRACTIONS INTERFACE)
target_link_libraries(Group_STM32_HAL_Driver_ABSTRACTIONS INTERFACE
  ${CONTEXT}_ABSTRACTIONS
)
target_compile_options(Group_STM32_HAL_Driver PUBLIC
  $<TARGET_PROPERTY:${CONTEXT},INTERFACE_COMPILE_OPTIONS>
)
target_link_libraries(Group_STM32_HAL_Driver PUBLIC
  Group_STM32_HAL_Driver_ABSTRACTIONS
)
