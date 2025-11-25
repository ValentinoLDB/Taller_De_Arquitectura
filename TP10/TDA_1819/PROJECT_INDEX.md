Project index for TDA_1819

Summary:
- VHDL files: 38
- ASM files: 41

VHDL files (38):
- src/Usuario/usuario.vhd
- src/Usuario/PC/pc.vhd
- src/Usuario/PC/4. Memoria/memoria.vhd
- src/Usuario/PC/3. Buses_Admin/buses_admin.vhd
- src/Usuario/PC/2. CPU/cpu.vhd
- src/Usuario/PC/2. CPU/7. Registros/registros.vhd
- src/Usuario/PC/2. CPU/6. Reloj/reloj.vhd
- src/Usuario/PC/2. CPU/5. CPU_Admin/cpu_admin.vhd
- src/Usuario/PC/2. CPU/4. Atascos/atascos.vhd
- src/Usuario/PC/2. CPU/4. Atascos/2. Datos/raw_waw_detector.vhd
- src/Packages/const_ensamblador.vhd
- src/Usuario/PC/2. CPU/4. Atascos/1. Estructurales/str_detector.vhd
- src/Packages/const_cpu.vhd
- src/Usuario/PC/2. CPU/2. Etapas/etapas.vhd
- src/Packages/const_buses.vhd
- src/Packages/const_flags.vhd
- src/Packages/const_memoria.vhd
- src/Packages/const_ascii.vhd
- src/Packages/repert_cpu.vhd
- src/Packages/tipos_ascii.vhd
- src/Packages/func_ensamblador.vhd
- src/Packages/const_reloj.vhd
- src/Usuario/PC/2. CPU/1. UI/ui.vhd
- src/Packages/const_registros.vhd
- src/Usuario/PC/1. Ensamblador/ensamblador.vhd
- src/Packages/tipos_cpu.vhd
- src/Usuario/PC/2. CPU/3. Pipeline_Registros/pipeline_registros.vhd
- src/Packages/tipos_memoria.vhd
- src/Packages/tipos_ensamblador.vhd
- src/Usuario/PC/2. CPU/2. Etapas/3. Execute/execute.vhd
- src/Usuario/PC/2. CPU/1. UI/1. Máquina de Estados/states_machine.vhd
- src/Usuario/PC/2. CPU/2. Etapas/4. Memory Access/memory_access.vhd
- src/Usuario/PC/2. CPU/2. Etapas/1. Fetch/fetch.vhd
- src/Usuario/PC/2. CPU/2. Etapas/5. Writeback/writeback.vhd
- src/Usuario/PC/2. CPU/1. UI/2. Registros FP/registros_fp.vhd
- src/Usuario/PC/2. CPU/2. Etapas/2. Decode/decode.vhd
- src/Usuario/PC/2. CPU/2. Etapas/3. Execute/2. FPU/execute_fpu.vhd
- src/Usuario/PC/2. CPU/2. Etapas/3. Execute/1. ALU/execute_alu.vhd

ASM files (41):
- src/Assembler/ascii.asm
- src/Assembler/mem_str2.asm
- src/Assembler/mem_str1.asm
- src/Assembler/producto.asm
- src/Assembler/productos_fp.asm
- src/Assembler/productos.asm
- src/Assembler/waw4.asm
- src/Assembler/waw3.asm
- src/Assembler/waw5.asm
- src/Assembler/waw2.asm
- src/Assembler/waw10.asm
- src/Assembler/waw1.asm
- src/Assembler/salto.asm
- src/Assembler/waw6.asm
- src/Assembler/producto_fp.asm
- src/Assembler/productos_sisnum.asm
- src/Assembler/mem_wb_str_waw2.asm
- src/Assembler/waw7.asm
- src/Assembler/mem_wb_str_waw1.asm
- src/Assembler/mem_wb_str1.asm
- src/Assembler/mem_str8.asm
- src/Assembler/mem_str7.asm
- src/Assembler/waw8.asm
- src/Assembler/mem_str6.asm
- src/Assembler/mem_str5.asm
- src/Assembler/mem_str4.asm
- src/Assembler/mem_str3.asm
- src/Assembler/waw9.asm
- src/Assembler/logicas.asm
- src/Assembler/wb_str_waw10.asm
- src/Assembler/wb_str_waw1.asm
- src/Assembler/wb_str_waw9.asm
- src/Assembler/wb_str_waw8.asm
- src/Assembler/wb_str_waw7.asm
- src/Assembler/wb_str_waw6.asm
- src/Assembler/wb_str_waw5.asm
- src/Assembler/wb_str_waw4.asm
- src/Assembler/wb_str_waw3.asm
- src/Assembler/wb_str_waw2.asm
- src/Assembler/desp_bits.asm
- src/Assembler/asciis.asm

Notes:
- Compile order is in `compilation.order` and `compile/vcom.cmd` contains the vcom command used for ModelSim/Questa compilation.
- Main modules: `pc.vhd` (top), `ensamblador.vhd` (assembler), `cpu.vhd` (CPU top/structural), pipeline stages under `2. CPU/2. Etapas`.

Next steps I can take now:
- Generate a dependency map (VHDL entity/component relations).
- Produce a concise PDF/Markdown technical summary with compilation/run steps.
- Attempt a local compile (if you want, I can prepare a PowerShell command to run ModelSim/Questa using `compile\vcom.cmd`).

Tell me which of the next steps to run now (I can start with the dependency map).