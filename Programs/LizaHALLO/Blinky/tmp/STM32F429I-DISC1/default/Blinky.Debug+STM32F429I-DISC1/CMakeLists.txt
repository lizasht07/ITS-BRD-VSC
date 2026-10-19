cmake_minimum_required(VERSION 3.27)

# Roots
include("../roots.cmake")

set(CONTEXT Blinky.Debug+STM32F429I-DISC1)
set(TARGET ${CONTEXT})
set(DNAME STM32F429ZITx)
set(DPACK Keil::STM32F4xx_DFP@3.1.1)
set(DPACK_DIR "${CMSIS_PACK_ROOT}/Keil/STM32F4xx_DFP/3.1.1")
set(OUT_DIR "${SOLUTION_ROOT}/out/Blinky/STM32F429I-DISC1/Debug")
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)
set(CMAKE_COMPILE_COMMANDS ${CMAKE_CURRENT_BINARY_DIR}/compile_commands.json)
set(COMPILE_COMMANDS ${OUT_DIR}/compile_commands.json)
set(COMPILE_MACROS_C ${OUT_DIR}/compile_macros_c.h)
set(HEX_FILE "Blinky.hex")
set(LD_MAP_FILE "Blinky.axf.map")
set(LD_SCRIPT "${SOLUTION_ROOT}/RTE/Device/STM32F429ZITx/ac6_linker_script.sct.src")
set(LD_REGIONS "${SOLUTION_ROOT}/RTE/Device/STM32F429ZITx/regions_STM32F429I-DISC1.h")
set(LD_SCRIPT_PP "${CMAKE_CURRENT_BINARY_DIR}/ac6_linker_script.sct")

# Processor Options
set(CPU Cortex-M4)
set(FPU SP_FPU)
set(DSP DSP)
set(BYTE_ORDER Little-endian)

# Preprocessor options
set(CPP_OPTIONS_C "-xc" "-gdwarf-5" "-std=gnu11" "-Wno-macro-redefined" "-Wno-pragma-pack" "-Wno-parentheses-equality" "-Wno-license-management")

# Toolchain config map
set(COMPILER AC6)
include("toolchain.cmake")

# Setup project
project(${CONTEXT} LANGUAGES C ASM)

# Enable color diagnostics
set(CMAKE_COLOR_DIAGNOSTICS ON)

# Compilation database
add_custom_target(database DEPENDS ${COMPILE_COMMANDS} ${COMPILE_MACROS_C})
add_custom_command(OUTPUT ${COMPILE_COMMANDS}
  COMMAND ${CMAKE_COMMAND} -E copy_if_different "${CMAKE_COMPILE_COMMANDS}" "${COMPILE_COMMANDS}"
  DEPENDS "${CMAKE_COMPILE_COMMANDS}"
)
add_custom_command(OUTPUT ${COMPILE_MACROS_C}
  COMMAND ${CPP} ${CPP_OPTIONS_C} ${CPP_DUMP_MACROS} "${COMPILE_MACROS_C}"
)
set(CMAKE_C_STANDARD_INCLUDE_DIRECTORIES ${CMAKE_C_IMPLICIT_INCLUDE_DIRECTORIES})

# Setup context
add_executable(${CONTEXT})
set_target_properties(${CONTEXT} PROPERTIES PREFIX "" SUFFIX ".axf" OUTPUT_NAME "Blinky")
set_target_properties(${CONTEXT} PROPERTIES RUNTIME_OUTPUT_DIRECTORY ${OUT_DIR})
add_library(${CONTEXT}_GLOBAL INTERFACE)

# Includes
target_include_directories(${CONTEXT} PUBLIC
  $<$<COMPILE_LANGUAGE:C,CXX>:
    "${SOLUTION_ROOT}/STM32CubeMX/STM32F429I-DISC1/STM32CubeMX/Drivers/STM32F4xx_HAL_Driver/Inc"
    "${SOLUTION_ROOT}/STM32CubeMX/STM32F429I-DISC1/STM32CubeMX/Drivers/STM32F4xx_HAL_Driver/Inc/Legacy"
    "${SOLUTION_ROOT}/STM32CubeMX/STM32F429I-DISC1/STM32CubeMX/Drivers/CMSIS/Device/ST/STM32F4xx/Include"
    "${SOLUTION_ROOT}/STM32CubeMX/STM32F429I-DISC1/STM32CubeMX/Inc"
    "${SOLUTION_ROOT}/STM32CubeMX/STM32F429I-DISC1/MX_Device"
  >
  "${SOLUTION_ROOT}/RTE/_Debug_STM32F429I-DISC1"
  "${SOLUTION_ROOT}/RTE/CMSIS"
  "${CMSIS_PACK_ROOT}/ARM/CMSIS-Compiler/2.3.0/include"
  "${CMSIS_PACK_ROOT}/ARM/CMSIS-Driver_STM32/1.4.0/Drivers"
  "${CMSIS_PACK_ROOT}/ARM/CMSIS-RTX/5.9.1/Include"
  "${CMSIS_PACK_ROOT}/ARM/CMSIS/6.4.0/CMSIS/Core/Include"
  "${CMSIS_PACK_ROOT}/ARM/CMSIS/6.4.0/CMSIS/Driver/Include"
  "${CMSIS_PACK_ROOT}/ARM/CMSIS/6.4.0/CMSIS/Driver/VIO/Include"
  "${CMSIS_PACK_ROOT}/ARM/CMSIS/6.4.0/CMSIS/RTOS2/Include"
)

# Defines
target_compile_definitions(${CONTEXT} PUBLIC
  $<$<COMPILE_LANGUAGE:C,CXX>:
    OS_IDLE_THREAD_NAME=\"Idle\"
    OS_TIMER_THREAD_NAME=\"Timer\"
    USE_HAL_DRIVER
    STM32F429xx
    STM32F429xx
    _RTE_
  >
)

# Compile options
target_compile_options(${CONTEXT} PUBLIC
  $<$<COMPILE_LANGUAGE:ASM>:
    "SHELL:${ASM_CPU}"
    "SHELL:${ASM_FLAGS}"
    "SHELL:${ASM_BYTE_ORDER}"
    "SHELL:-gdwarf-5"
    "SHELL:-masm=auto"
  >
  $<$<COMPILE_LANGUAGE:C>:
    "SHELL:${CC_CPU}"
    "SHELL:${CC_FLAGS}"
    "SHELL:${CC_BYTE_ORDER}"
    "SHELL:-gdwarf-5"
    "SHELL:-std=gnu11"
    "SHELL:-Wno-macro-redefined"
    "SHELL:-Wno-pragma-pack"
    "SHELL:-Wno-parentheses-equality"
    "SHELL:-Wno-license-management"
  >
)

# Compile Options Abstractions
add_library(${CONTEXT}_ABSTRACTIONS INTERFACE)
cbuild_set_options_flags(CC "debug" "on" "" "" CC_OPTIONS_FLAGS_${CONTEXT})
cbuild_set_options_flags(ASM "debug" "on" "" "" ASM_OPTIONS_FLAGS_${CONTEXT})
target_compile_options(${CONTEXT}_ABSTRACTIONS INTERFACE
  $<$<COMPILE_LANGUAGE:C>:
    "SHELL:${CC_OPTIONS_FLAGS_${CONTEXT}}"
  >
  $<$<COMPILE_LANGUAGE:ASM>:
    "SHELL:${ASM_OPTIONS_FLAGS_${CONTEXT}}"
  >
)

# Add groups and components
include("groups.cmake")
include("components.cmake")

target_link_libraries(${CONTEXT} PUBLIC
  Group_Source_Files_____________retarget_stdio_c
  Group_Source_Files
  Group_CubeMX
  Group_STM32_HAL_Driver
  ARM_CMSIS-Compiler_CORE_1_2_1
  ARM_CMSIS-Compiler_STDERR_Custom_1_1_0
  ARM_CMSIS-Compiler_STDIN_Custom_1_1_0
  ARM_CMSIS-Compiler_STDOUT_Custom_1_1_0
  ARM_CMSIS_CORE_6_4_0
  ARM_CMSIS_OS_Tick_SysTick_1_0_5
  ARM_CMSIS_RTOS2_Keil_RTX5_Source_5_9_1
  Keil_CMSIS_Driver_GPIO_1_2_0
  Keil_CMSIS_Driver_USART_3_0_0
  Keil_CMSIS_Driver_VIO_Board_1_0_0
  Keil_Device_CubeMX_1_0_0
)

# Linker options
target_link_options(${CONTEXT} PUBLIC
  "SHELL:${LD_CPU}"
  "SHELL:${_LS}\"${LD_SCRIPT_PP}\""
  "SHELL:${LD_MAP}"
  "SHELL:--entry=Reset_Handler"
  "SHELL:--info=summarysizes"
  "SHELL:--summary_stderr"
  "SHELL:--diag_suppress=L6314W"
)
set(LD_DEPS ${LD_SCRIPT} ${LD_REGIONS})
set_target_properties(${CONTEXT} PROPERTIES LINK_DEPENDS "${LD_DEPS}")

# Linker script pre-processing
add_custom_command(TARGET ${CONTEXT} PRE_LINK COMMAND ${CPP} ARGS ${CPP_ARGS_LD_SCRIPT} BYPRODUCTS ${LD_SCRIPT_PP})

# Hex Conversion
add_custom_command(TARGET ${CONTEXT} POST_BUILD COMMAND ${CMAKE_OBJCOPY} ${ELF2HEX})
