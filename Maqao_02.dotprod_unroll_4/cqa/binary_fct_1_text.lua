_cqa_text_report = {
  paths = {
    {
      hint = {
        {
          details = "Calling (and then returning from) a function prevents many compiler optimizations (like vectorization), breaks control flow (which reduces pipeline performance) and executes extra instructions to save/restore the registers used inside it, which is very expensive (dozens of cycles). Consider to inline small functions.\n - @plt_start@: 9 occurrences\n - fill_vector: 2 occurrences\n",
          title = "CALL instructions",
          txt = "Detected function call instructions.\n",
        },
        {
          details = "These instructions generate more than one micro-operation and only one of them can be decoded during a cycle and the extra micro-operations increase pressure on execution units.\n - PUSH: 1 occurrences\n - VZEROUPPER: 1 occurrences\n",
          title = "Complex instructions",
          txt = "Detected COMPLEX INSTRUCTIONS.\n",
        },
        {
          title = "Type of elements and instruction set",
          txt = "No instructions are processing arithmetic or math operations on FP elements. This function is probably writing/copying data or processing integer elements.",
        },
        {
          title = "Matching between your function (in the source code) and the binary function",
          txt = "The binary function does not contain any FP arithmetical operations.\nThe binary function is loading 64 bytes.\nThe binary function is storing 16 bytes.",
        },
      },
      expert = {
        {
          title = "ASM code",
          txt = "In the binary file, the address of the function is: 6c0\n\nInstruction                 | Nb FU | P0   | P1   | P2   | P3   | P4 | P5   | P6   | P7   | Latency | Recip. throughput\n-----------------------------------------------------------------------------------------------------------------------\nLEA 0x8(%RSP),%R10          | 1     | 0    | 0.50 | 0    | 0    | 0  | 0.50 | 0    | 0    | 1       | 0.50\nAND $-0x20,%RSP             | 1     | 0.25 | 0.25 | 0    | 0    | 0  | 0.25 | 0.25 | 0    | 1       | 0.25\nPUSHQ -0x8(%R10)            | 2     | 0    | 0    | 0.83 | 0.83 | 1  | 0    | 0    | 0.33 | 3       | 1\nPUSH %RBP                   | 1     | 0    | 0    | 0.33 | 0.33 | 1  | 0    | 0    | 0.33 | 3       | 1\nMOV %RSP,%RBP               | 1     | 0    | 0    | 0    | 0    | 0  | 0    | 0    | 0    | 0       | 0.25\nPUSH %R14                   | 1     | 0    | 0    | 0.33 | 0.33 | 1  | 0    | 0    | 0.33 | 3       | 1\nPUSH %R13                   | 1     | 0    | 0    | 0.33 | 0.33 | 1  | 0    | 0    | 0.33 | 3       | 1\nMOV $0x1,%R13D              | 1     | 0.25 | 0.25 | 0    | 0    | 0  | 0.25 | 0.25 | 0    | 1       | 0.25\nPUSH %R12                   | 1     | 0    | 0    | 0.33 | 0.33 | 1  | 0    | 0    | 0.33 | 3       | 1\nPUSH %R10                   | 1     | 0    | 0    | 0.33 | 0.33 | 1  | 0    | 0    | 0.33 | 3       | 1\nPUSH %RBX                   | 1     | 0    | 0    | 0.33 | 0.33 | 1  | 0    | 0    | 0.33 | 3       | 1\nSUB $0x48,%RSP              | 1     | 0.25 | 0.25 | 0    | 0    | 0  | 0.25 | 0.25 | 0    | 1       | 0.25\nMOV %FS:0x28,%RAX           | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0    | 0    | 0    | 2       | 0.50\nMOV %RAX,-0x38(%RBP)        | 1     | 0    | 0    | 0.33 | 0.33 | 1  | 0    | 0    | 0.33 | 3       | 1\nXOR %EAX,%EAX               | 1     | 0    | 0    | 0    | 0    | 0  | 0    | 0    | 0    | 0       | 0.25\nCMP $0x1,%EDI               | 1     | 0.25 | 0.25 | 0    | 0    | 0  | 0.25 | 0.25 | 0    | 1       | 0.25\nJE a0d <main+0x34d>         | 1     | 0.50 | 0    | 0    | 0    | 0  | 0    | 0.50 | 0    | 0       | 0.50-1\nMOV 0x8(%RSI),%RDI          | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0    | 0    | 0    | 2       | 0.50\nMOV $0xa,%EDX               | 1     | 0.25 | 0.25 | 0    | 0    | 0  | 0.25 | 0.25 | 0    | 1       | 0.25\nXOR %ESI,%ESI               | 1     | 0    | 0    | 0    | 0    | 0  | 0    | 0    | 0    | 0       | 0.25\nCALL 680 <@plt_start@+0x30> | 2     | 0    | 0    | 0.33 | 0.33 | 1  | 0    | 1    | 0.33 | 0       | 2\nLEA 0x8b1(%RIP),%RSI        | 1     | 0    | 1    | 0    | 0    | 0  | 0    | 0    | 0    | 3       | 1\nMOV $0x1,%EDI               | 1     | 0.25 | 0.25 | 0    | 0    | 0  | 0.25 | 0.25 | 0    | 1       | 0.25\nMOV %RAX,%RDX               | 1     | 0    | 0    | 0    | 0    | 0  | 0    | 0    | 0    | 0       | 0.25\nMOV %RAX,%R14               | 1     | 0    | 0    | 0    | 0    | 0  | 0    | 0    | 0    | 0       | 0.25\nXOR %EAX,%EAX               | 1     | 0    | 0    | 0    | 0    | 0  | 0    | 0    | 0    | 0       | 0.25\nCALL 690 <@plt_start@+0x40> | 2     | 0    | 0    | 0.33 | 0.33 | 1  | 0    | 1    | 0.33 | 0       | 2\nLEA -0x48(%RBP),%RDI        | 1     | 0    | 0.50 | 0    | 0    | 0  | 0.50 | 0    | 0    | 1       | 0.50\nMOV %R14,%RDX               | 1     | 0    | 0    | 0    | 0    | 0  | 0    | 0    | 0    | 0       | 0.25\nMOV $0x20,%ESI              | 1     | 0.25 | 0.25 | 0    | 0    | 0  | 0.25 | 0.25 | 0    | 1       | 0.25\nCALL 6a0 <@plt_start@+0x50> | 2     | 0    | 0    | 0.33 | 0.33 | 1  | 0    | 1    | 0.33 | 0       | 2\nMOV %EAX,%R13D              | 1     | 0    | 0    | 0    | 0    | 0  | 0    | 0    | 0    | 0       | 0.25\nTEST %EAX,%EAX              | 1     | 0.25 | 0.25 | 0    | 0    | 0  | 0.25 | 0.25 | 0    | 1       | 0.25\nJNE a31 <main+0x371>        | 1     | 0.50 | 0    | 0    | 0    | 0  | 0    | 0.50 | 0    | 0       | 0.50-1\nLEA -0x40(%RBP),%RDI        | 1     | 0    | 0.50 | 0    | 0    | 0  | 0.50 | 0    | 0    | 1       | 0.50\nMOV %R14,%RDX               | 1     | 0    | 0    | 0    | 0    | 0  | 0    | 0    | 0    | 0       | 0.25\nMOV $0x20,%ESI              | 1     | 0.25 | 0.25 | 0    | 0    | 0  | 0.25 | 0.25 | 0    | 1       | 0.25\nMOV -0x48(%RBP),%RBX        | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0    | 0    | 0    | 2       | 0.50\nCALL 6a0 <@plt_start@+0x50> | 2     | 0    | 0    | 0.33 | 0.33 | 1  | 0    | 1    | 0.33 | 0       | 2\nTEST %EAX,%EAX              | 1     | 0.25 | 0.25 | 0    | 0    | 0  | 0.25 | 0.25 | 0    | 1       | 0.25\nJNE a54 <main+0x394>        | 1     | 0.50 | 0    | 0    | 0    | 0  | 0    | 0.50 | 0    | 0       | 0.50-1\nMOV -0x40(%RBP),%R12        | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0    | 0    | 0    | 2       | 0.50\nXOR %EAX,%EAX               | 1     | 0    | 0    | 0    | 0    | 0  | 0    | 0    | 0    | 0       | 0.25\nADD %EAX,%R13D              | 1     | 0.25 | 0.25 | 0    | 0    | 0  | 0.25 | 0.25 | 0    | 1       | 0.25\nJNE a54 <main+0x394>        | 1     | 0.50 | 0    | 0    | 0    | 0  | 0    | 0.50 | 0    | 0       | 0.50-1\nSHR $0x3,%R14               | 1     | 0.50 | 0    | 0    | 0    | 0  | 0    | 0.50 | 0    | 1       | 0.50\nMOV %RBX,%RDI               | 1     | 0    | 0    | 0    | 0    | 0  | 0    | 0    | 0    | 0       | 0.25\nMOV %R14,%RSI               | 1     | 0    | 0    | 0    | 0    | 0  | 0    | 0    | 0    | 0       | 0.25\nMOV %R14,%R9                | 1     | 0    | 0    | 0    | 0    | 0  | 0    | 0    | 0    | 0       | 0.25\nCALL e30 <fill_vector>      | 2     | 0    | 0    | 0.33 | 0.33 | 1  | 0    | 1    | 0.33 | 0       | 2\nMOV %R14,%RSI               | 1     | 0    | 0    | 0    | 0    | 0  | 0    | 0    | 0    | 0       | 0.25\nMOV %R12,%RDI               | 1     | 0    | 0    | 0    | 0    | 0  | 0    | 0    | 0    | 0       | 0.25\nCALL e30 <fill_vector>      | 2     | 0    | 0    | 0.33 | 0.33 | 1  | 0    | 1    | 0.33 | 0       | 2\nLEA -0x1(%R14),%RAX         | 1     | 0    | 0.50 | 0    | 0    | 0  | 0.50 | 0    | 0    | 1       | 0.50\nMOV $0x2710,%EDI            | 1     | 0.25 | 0.25 | 0    | 0    | 0  | 0.25 | 0.25 | 0    | 1       | 0.25\nVXORPD %XMM9,%XMM9,%XMM9    | 1     | 0    | 0    | 0    | 0    | 0  | 0    | 0    | 0    | 0       | 0.25\nMOV %RAX,%R10               | 1     | 0    | 0    | 0    | 0    | 0  | 0    | 0    | 0    | 0       | 0.25\nVXORPD %XMM14,%XMM14,%XMM14 | 1     | 0    | 0    | 0    | 0    | 0  | 0    | 0    | 0    | 0       | 0.25\nSHR $0x2,%R10               | 1     | 0.50 | 0    | 0    | 0    | 0  | 0    | 0.50 | 0    | 1       | 0.50\nADD $0x1,%R10               | 1     | 0.25 | 0.25 | 0    | 0    | 0  | 0.25 | 0.25 | 0    | 1       | 0.25\nMOV %R10,%R11               | 1     | 0    | 0    | 0    | 0    | 0  | 0    | 0    | 0    | 0       | 0.25\nMOV %R10,%RCX               | 1     | 0    | 0    | 0    | 0    | 0  | 0    | 0    | 0    | 0       | 0.25\nAND $-0x4,%R11              | 1     | 0.25 | 0.25 | 0    | 0    | 0  | 0.25 | 0.25 | 0    | 1       | 0.25\nSHR $0x2,%RCX               | 1     | 0.50 | 0    | 0    | 0    | 0  | 0    | 0.50 | 0    | 1       | 0.50\nLEA (,%R11,4),%R14          | 1     | 0    | 0.50 | 0    | 0    | 0  | 0.50 | 0    | 0    | 1       | 0.50\nXCHG %AX,%AX                | 1     | 0    | 0    | 0    | 0    | 0  | 0    | 0    | 0    | 0       | 0.25\nMOV %RBX,%RDI               | 1     | 0    | 0    | 0    | 0    | 0  | 0    | 0    | 0    | 0       | 0.25\nVMOVSD %XMM0,-0x58(%RBP)    | 1     | 0    | 0    | 0.33 | 0.33 | 1  | 0    | 0    | 0.33 | 3       | 1\nVZEROUPPER                  | 4     | 0    | 0    | 0    | 0    | 0  | 0    | 0    | 0    | 0       | 1\nCALL 660 <@plt_start@+0x10> | 2     | 0    | 0    | 0.33 | 0.33 | 1  | 0    | 1    | 0.33 | 0       | 2\nMOV %R12,%RDI               | 1     | 0    | 0    | 0    | 0    | 0  | 0    | 0    | 0    | 0       | 0.25\nCALL 660 <@plt_start@+0x10> | 2     | 0    | 0    | 0.33 | 0.33 | 1  | 0    | 1    | 0.33 | 0       | 2\nVMOVSD -0x58(%RBP),%XMM0    | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0    | 0    | 0    | 0       | 0.50\nMOV $0x1,%EDI               | 1     | 0.25 | 0.25 | 0    | 0    | 0  | 0.25 | 0.25 | 0    | 1       | 0.25\nLEA 0x5c7(%RIP),%RSI        | 1     | 0    | 1    | 0    | 0    | 0  | 0    | 0    | 0    | 3       | 1\nMOV $0x1,%EAX               | 1     | 0.25 | 0.25 | 0    | 0    | 0  | 0.25 | 0.25 | 0    | 1       | 0.25\nCALL 690 <@plt_start@+0x40> | 2     | 0    | 0    | 0.33 | 0.33 | 1  | 0    | 1    | 0.33 | 0       | 2\nMOV -0x38(%RBP),%RDI        | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0    | 0    | 0    | 2       | 0.50\nXOR %FS:0x28,%RDI           | 1     | 0.25 | 0.25 | 0.50 | 0.50 | 0  | 0.25 | 0.25 | 0    | 1       | 0.50\nMOV %R13D,%EAX              | 1     | 0    | 0    | 0    | 0    | 0  | 0    | 0    | 0    | 0       | 0.25\nJNE a6b <main+0x3ab>        | 1     | 0.50 | 0    | 0    | 0    | 0  | 0    | 0.50 | 0    | 0       | 0.50-1\nADD $0x48,%RSP              | 1     | 0.25 | 0.25 | 0    | 0    | 0  | 0.25 | 0.25 | 0    | 1       | 0.25\nPOP %RBX                    | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0    | 0    | 0    | 2       | 0.50\nPOP %RCX                    | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0    | 0    | 0    | 2       | 0.50\nPOP %R12                    | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0    | 0    | 0    | 2       | 0.50\nPOP %R13                    | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0    | 0    | 0    | 2       | 0.50\nPOP %R14                    | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0    | 0    | 0    | 2       | 0.50\nPOP %RBP                    | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0    | 0    | 0    | 2       | 0.50\nLEA -0x8(%RCX),%RSP         | 1     | 0    | 0.50 | 0    | 0    | 0  | 0.50 | 0    | 0    | 1       | 0.50\nRET                         | 1     | 0    | 0    | 0.33 | 0.33 | 0  | 0    | 1    | 0.33 | 0       | 1\nLEA -0x40(%RBP),%RDI        | 1     | 0    | 0.50 | 0    | 0    | 0  | 0.50 | 0    | 0    | 1       | 0.50\nMOV %R14,%RDX               | 1     | 0    | 0    | 0    | 0    | 0  | 0    | 0    | 0    | 0       | 0.25\nMOV $0x20,%ESI              | 1     | 0.25 | 0.25 | 0    | 0    | 0  | 0.25 | 0.25 | 0    | 1       | 0.25\nXOR %EBX,%EBX               | 1     | 0    | 0    | 0    | 0    | 0  | 0    | 0    | 0    | 0       | 0.25\nCALL 6a0 <@plt_start@+0x50> | 2     | 0    | 0    | 0.33 | 0.33 | 1  | 0    | 1    | 0.33 | 0       | 2\nXOR %R12D,%R12D             | 1     | 0    | 0    | 0    | 0    | 0  | 0    | 0    | 0    | 0       | 0.25\nTEST %EAX,%EAX              | 1     | 0.25 | 0.25 | 0    | 0    | 0  | 0.25 | 0.25 | 0    | 1       | 0.25\nJNE 764 <main+0xa4>         | 1     | 0.50 | 0    | 0    | 0    | 0  | 0    | 0.50 | 0    | 0       | 0.50-1\nJMP 75e <main+0x9e>         | 1     | 0    | 0    | 0    | 0    | 0  | 0    | 1    | 0    | 0       | 1-2\nMOV $0x2,%R13D              | 1     | 0.25 | 0.25 | 0    | 0    | 0  | 0.25 | 0.25 | 0    | 1       | 0.25\nJMP a0d <main+0x34d>        | 1     | 0    | 0    | 0    | 0    | 0  | 0    | 1    | 0    | 0       | 1-2\nNOPL (%RAX)                 | 1     | 0    | 0    | 0    | 0    | 0  | 0    | 0    | 0    | 0       | 0.25\nCALL 670 <@plt_start@+0x20> | 2     | 0    | 0    | 0.33 | 0.33 | 1  | 0    | 1    | 0.33 | 0       | 2\n",
        },
        {
          title = "General properties",
          txt = "nb instructions    : 103\nnb uops            : 118\nloop length        : 395\nused x86 registers : 14\nused mmx registers : 0\nused xmm registers : 3\nused ymm registers : 0\nused zmm registers : 0\nnb stack references: 5\n",
        },
        {
          title = "Front-end",
          txt = "MACRO FUSION NOT POSSIBLE\nFIT IN UOP CACHE\nmicro-operation queue: 29.50 cycles\nfront end            : 29.50 cycles\n",
        },
        {
          title = "Back-end",
          txt = "       | P0    | P1    | P2    | P3    | P4    | P5    | P6    | P7\n----------------------------------------------------------------------\nuops   | 13.00 | 13.00 | 11.67 | 11.67 | 20.00 | 13.00 | 14.00 | 11.67\ncycles | 13.00 | 13.00 | 11.67 | 11.67 | 20.00 | 13.00 | 14.00 | 11.67\n\nCycles executing div or sqrt instructions: NA\n",
        },
        {
          title = "Cycles summary",
          txt = "Front-end : 29.50\nDispatch  : 20.00\nOverall L1: 29.50\n",
        },
        {
          title = "Vectorization ratios",
          txt = "INT\nall    : 3%\nload   : 0%\nstore  : 0%\nmul    : NA (no mul vectorizable/vectorized instructions)\nadd-sub: 0%\nother  : 4%\nFP\nall    : 50%\nload   : 0%\nstore  : 0%\nmul    : NA (no mul vectorizable/vectorized instructions)\nadd-sub: NA (no add-sub vectorizable/vectorized instructions)\nother  : 100%\nINT+FP\nall    : 9%\nload   : 0%\nstore  : 0%\nmul    : NA (no mul vectorizable/vectorized instructions)\nadd-sub: 0%\nother  : 12%\n",
        },
        {
          title = "Vector efficiency ratios",
          txt = "INT\nall    : 20%\nload   : 25%\nstore  : 25%\nmul    : NA (no mul vectorizable/vectorized instructions)\nadd-sub: 12%\nother  : 19%\nFP\nall    : 37%\nload   : 25%\nstore  : 25%\nmul    : NA (no mul vectorizable/vectorized instructions)\nadd-sub: NA (no add-sub vectorizable/vectorized instructions)\nother  : 50%\nINT+FP\nall    : 22%\nload   : 25%\nstore  : 25%\nmul    : NA (no mul vectorizable/vectorized instructions)\nadd-sub: 12%\nother  : 22%\n",
        },
        {
          title = "Cycles and memory resources usage",
          txt = "Assuming all data fit into the L1 cache, each call to the function takes 29.50 cycles. At this rate:\n - 3% of peak load performance is reached (2.17 out of 64.00 bytes loaded per cycle (GB/s @ 1GHz))\n - 1% of peak store performance is reached (0.54 out of 32.00 bytes stored per cycle (GB/s @ 1GHz))\n",
        },
        {
          title = "Front-end bottlenecks",
          txt = "Performance is limited by instruction throughput (loading/decoding program instructions to execution core) (front-end is a bottleneck).\n\nBy removing all these bottlenecks, you can lower the cost of an iteration from 29.50 to 20.00 cycles (1.48x speedup).\n",
        },
      },
      header = {
        "Warnings:\nDetected a function call instruction: ignoring called function instructions.\nRerun with --follow-calls=append to include them to analysis  or with --follow-calls=inline to simulate inlining.",
        "0% of peak computational performance is used (0.00 out of 4.00 FLOP per cycle (GFLOPS @ 1GHz))",
      },
      brief = {
      },
      gain = {
        {
          workaround = " - Try to reorganize arrays of structures to structures of arrays\n - Consider to permute loops (see vectorization gain report)\n",
          title = "Code clean check",
          txt = "Detected a slowdown caused by scalar integer instructions (typically used for address computation).\nBy removing them, you can lower the cost of an iteration from 29.50 to 4.50 cycles (6.56x speedup).",
        },
        {
          workaround = " - Try another compiler or update/tune your current one\n - Make array accesses unit-stride:\n  * If your function streams arrays of structures (AoS), try to use structures of arrays instead (SoA):\nfor(i) a[i].x = b[i].x; (slow, non stride 1) => for(i) a.x[i] = b.x[i]; (fast, stride 1)\n",
          details = "Store and arithmetical SSE/AVX instructions are used in scalar version (process only one data element in vector registers).\nSince your execution units are vector units, only a vectorized function can use their full power.\n",
          title = "Vectorization",
          txt = "Your function is probably not vectorized.\nOnly 22% of vector register length is used (average across all SSE/AVX instructions).\nBy vectorizing your function, you can lower the cost of an iteration from 29.50 to 4.08 cycles (7.23x speedup).",
        },
        {
          title = "Execution units bottlenecks",
          txt = "Found no such bottlenecks but see expert reports for more complex bottlenecks.",
        },
      },
      potential = {
      },
    },
  },
  AVG = {
      hint = {
        {
          details = "Calling (and then returning from) a function prevents many compiler optimizations (like vectorization), breaks control flow (which reduces pipeline performance) and executes extra instructions to save/restore the registers used inside it, which is very expensive (dozens of cycles). Consider to inline small functions.\n - @plt_start@: 9 occurrences\n - fill_vector: 2 occurrences\n",
          title = "CALL instructions",
          txt = "Detected function call instructions.\n",
        },
        {
          details = "These instructions generate more than one micro-operation and only one of them can be decoded during a cycle and the extra micro-operations increase pressure on execution units.\n - PUSH: 1 occurrences\n - VZEROUPPER: 1 occurrences\n",
          title = "Complex instructions",
          txt = "Detected COMPLEX INSTRUCTIONS.\n",
        },
        {
          title = "Type of elements and instruction set",
          txt = "No instructions are processing arithmetic or math operations on FP elements. This function is probably writing/copying data or processing integer elements.",
        },
        {
          title = "Matching between your function (in the source code) and the binary function",
          txt = "The binary function does not contain any FP arithmetical operations.\nThe binary function is loading 64 bytes.\nThe binary function is storing 16 bytes.",
        },
      },
      expert = {
        {
          title = "ASM code",
          txt = "In the binary file, the address of the function is: 6c0\n\nInstruction                 | Nb FU | P0   | P1   | P2   | P3   | P4 | P5   | P6   | P7   | Latency | Recip. throughput\n-----------------------------------------------------------------------------------------------------------------------\nLEA 0x8(%RSP),%R10          | 1     | 0    | 0.50 | 0    | 0    | 0  | 0.50 | 0    | 0    | 1       | 0.50\nAND $-0x20,%RSP             | 1     | 0.25 | 0.25 | 0    | 0    | 0  | 0.25 | 0.25 | 0    | 1       | 0.25\nPUSHQ -0x8(%R10)            | 2     | 0    | 0    | 0.83 | 0.83 | 1  | 0    | 0    | 0.33 | 3       | 1\nPUSH %RBP                   | 1     | 0    | 0    | 0.33 | 0.33 | 1  | 0    | 0    | 0.33 | 3       | 1\nMOV %RSP,%RBP               | 1     | 0    | 0    | 0    | 0    | 0  | 0    | 0    | 0    | 0       | 0.25\nPUSH %R14                   | 1     | 0    | 0    | 0.33 | 0.33 | 1  | 0    | 0    | 0.33 | 3       | 1\nPUSH %R13                   | 1     | 0    | 0    | 0.33 | 0.33 | 1  | 0    | 0    | 0.33 | 3       | 1\nMOV $0x1,%R13D              | 1     | 0.25 | 0.25 | 0    | 0    | 0  | 0.25 | 0.25 | 0    | 1       | 0.25\nPUSH %R12                   | 1     | 0    | 0    | 0.33 | 0.33 | 1  | 0    | 0    | 0.33 | 3       | 1\nPUSH %R10                   | 1     | 0    | 0    | 0.33 | 0.33 | 1  | 0    | 0    | 0.33 | 3       | 1\nPUSH %RBX                   | 1     | 0    | 0    | 0.33 | 0.33 | 1  | 0    | 0    | 0.33 | 3       | 1\nSUB $0x48,%RSP              | 1     | 0.25 | 0.25 | 0    | 0    | 0  | 0.25 | 0.25 | 0    | 1       | 0.25\nMOV %FS:0x28,%RAX           | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0    | 0    | 0    | 2       | 0.50\nMOV %RAX,-0x38(%RBP)        | 1     | 0    | 0    | 0.33 | 0.33 | 1  | 0    | 0    | 0.33 | 3       | 1\nXOR %EAX,%EAX               | 1     | 0    | 0    | 0    | 0    | 0  | 0    | 0    | 0    | 0       | 0.25\nCMP $0x1,%EDI               | 1     | 0.25 | 0.25 | 0    | 0    | 0  | 0.25 | 0.25 | 0    | 1       | 0.25\nJE a0d <main+0x34d>         | 1     | 0.50 | 0    | 0    | 0    | 0  | 0    | 0.50 | 0    | 0       | 0.50-1\nMOV 0x8(%RSI),%RDI          | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0    | 0    | 0    | 2       | 0.50\nMOV $0xa,%EDX               | 1     | 0.25 | 0.25 | 0    | 0    | 0  | 0.25 | 0.25 | 0    | 1       | 0.25\nXOR %ESI,%ESI               | 1     | 0    | 0    | 0    | 0    | 0  | 0    | 0    | 0    | 0       | 0.25\nCALL 680 <@plt_start@+0x30> | 2     | 0    | 0    | 0.33 | 0.33 | 1  | 0    | 1    | 0.33 | 0       | 2\nLEA 0x8b1(%RIP),%RSI        | 1     | 0    | 1    | 0    | 0    | 0  | 0    | 0    | 0    | 3       | 1\nMOV $0x1,%EDI               | 1     | 0.25 | 0.25 | 0    | 0    | 0  | 0.25 | 0.25 | 0    | 1       | 0.25\nMOV %RAX,%RDX               | 1     | 0    | 0    | 0    | 0    | 0  | 0    | 0    | 0    | 0       | 0.25\nMOV %RAX,%R14               | 1     | 0    | 0    | 0    | 0    | 0  | 0    | 0    | 0    | 0       | 0.25\nXOR %EAX,%EAX               | 1     | 0    | 0    | 0    | 0    | 0  | 0    | 0    | 0    | 0       | 0.25\nCALL 690 <@plt_start@+0x40> | 2     | 0    | 0    | 0.33 | 0.33 | 1  | 0    | 1    | 0.33 | 0       | 2\nLEA -0x48(%RBP),%RDI        | 1     | 0    | 0.50 | 0    | 0    | 0  | 0.50 | 0    | 0    | 1       | 0.50\nMOV %R14,%RDX               | 1     | 0    | 0    | 0    | 0    | 0  | 0    | 0    | 0    | 0       | 0.25\nMOV $0x20,%ESI              | 1     | 0.25 | 0.25 | 0    | 0    | 0  | 0.25 | 0.25 | 0    | 1       | 0.25\nCALL 6a0 <@plt_start@+0x50> | 2     | 0    | 0    | 0.33 | 0.33 | 1  | 0    | 1    | 0.33 | 0       | 2\nMOV %EAX,%R13D              | 1     | 0    | 0    | 0    | 0    | 0  | 0    | 0    | 0    | 0       | 0.25\nTEST %EAX,%EAX              | 1     | 0.25 | 0.25 | 0    | 0    | 0  | 0.25 | 0.25 | 0    | 1       | 0.25\nJNE a31 <main+0x371>        | 1     | 0.50 | 0    | 0    | 0    | 0  | 0    | 0.50 | 0    | 0       | 0.50-1\nLEA -0x40(%RBP),%RDI        | 1     | 0    | 0.50 | 0    | 0    | 0  | 0.50 | 0    | 0    | 1       | 0.50\nMOV %R14,%RDX               | 1     | 0    | 0    | 0    | 0    | 0  | 0    | 0    | 0    | 0       | 0.25\nMOV $0x20,%ESI              | 1     | 0.25 | 0.25 | 0    | 0    | 0  | 0.25 | 0.25 | 0    | 1       | 0.25\nMOV -0x48(%RBP),%RBX        | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0    | 0    | 0    | 2       | 0.50\nCALL 6a0 <@plt_start@+0x50> | 2     | 0    | 0    | 0.33 | 0.33 | 1  | 0    | 1    | 0.33 | 0       | 2\nTEST %EAX,%EAX              | 1     | 0.25 | 0.25 | 0    | 0    | 0  | 0.25 | 0.25 | 0    | 1       | 0.25\nJNE a54 <main+0x394>        | 1     | 0.50 | 0    | 0    | 0    | 0  | 0    | 0.50 | 0    | 0       | 0.50-1\nMOV -0x40(%RBP),%R12        | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0    | 0    | 0    | 2       | 0.50\nXOR %EAX,%EAX               | 1     | 0    | 0    | 0    | 0    | 0  | 0    | 0    | 0    | 0       | 0.25\nADD %EAX,%R13D              | 1     | 0.25 | 0.25 | 0    | 0    | 0  | 0.25 | 0.25 | 0    | 1       | 0.25\nJNE a54 <main+0x394>        | 1     | 0.50 | 0    | 0    | 0    | 0  | 0    | 0.50 | 0    | 0       | 0.50-1\nSHR $0x3,%R14               | 1     | 0.50 | 0    | 0    | 0    | 0  | 0    | 0.50 | 0    | 1       | 0.50\nMOV %RBX,%RDI               | 1     | 0    | 0    | 0    | 0    | 0  | 0    | 0    | 0    | 0       | 0.25\nMOV %R14,%RSI               | 1     | 0    | 0    | 0    | 0    | 0  | 0    | 0    | 0    | 0       | 0.25\nMOV %R14,%R9                | 1     | 0    | 0    | 0    | 0    | 0  | 0    | 0    | 0    | 0       | 0.25\nCALL e30 <fill_vector>      | 2     | 0    | 0    | 0.33 | 0.33 | 1  | 0    | 1    | 0.33 | 0       | 2\nMOV %R14,%RSI               | 1     | 0    | 0    | 0    | 0    | 0  | 0    | 0    | 0    | 0       | 0.25\nMOV %R12,%RDI               | 1     | 0    | 0    | 0    | 0    | 0  | 0    | 0    | 0    | 0       | 0.25\nCALL e30 <fill_vector>      | 2     | 0    | 0    | 0.33 | 0.33 | 1  | 0    | 1    | 0.33 | 0       | 2\nLEA -0x1(%R14),%RAX         | 1     | 0    | 0.50 | 0    | 0    | 0  | 0.50 | 0    | 0    | 1       | 0.50\nMOV $0x2710,%EDI            | 1     | 0.25 | 0.25 | 0    | 0    | 0  | 0.25 | 0.25 | 0    | 1       | 0.25\nVXORPD %XMM9,%XMM9,%XMM9    | 1     | 0    | 0    | 0    | 0    | 0  | 0    | 0    | 0    | 0       | 0.25\nMOV %RAX,%R10               | 1     | 0    | 0    | 0    | 0    | 0  | 0    | 0    | 0    | 0       | 0.25\nVXORPD %XMM14,%XMM14,%XMM14 | 1     | 0    | 0    | 0    | 0    | 0  | 0    | 0    | 0    | 0       | 0.25\nSHR $0x2,%R10               | 1     | 0.50 | 0    | 0    | 0    | 0  | 0    | 0.50 | 0    | 1       | 0.50\nADD $0x1,%R10               | 1     | 0.25 | 0.25 | 0    | 0    | 0  | 0.25 | 0.25 | 0    | 1       | 0.25\nMOV %R10,%R11               | 1     | 0    | 0    | 0    | 0    | 0  | 0    | 0    | 0    | 0       | 0.25\nMOV %R10,%RCX               | 1     | 0    | 0    | 0    | 0    | 0  | 0    | 0    | 0    | 0       | 0.25\nAND $-0x4,%R11              | 1     | 0.25 | 0.25 | 0    | 0    | 0  | 0.25 | 0.25 | 0    | 1       | 0.25\nSHR $0x2,%RCX               | 1     | 0.50 | 0    | 0    | 0    | 0  | 0    | 0.50 | 0    | 1       | 0.50\nLEA (,%R11,4),%R14          | 1     | 0    | 0.50 | 0    | 0    | 0  | 0.50 | 0    | 0    | 1       | 0.50\nXCHG %AX,%AX                | 1     | 0    | 0    | 0    | 0    | 0  | 0    | 0    | 0    | 0       | 0.25\nMOV %RBX,%RDI               | 1     | 0    | 0    | 0    | 0    | 0  | 0    | 0    | 0    | 0       | 0.25\nVMOVSD %XMM0,-0x58(%RBP)    | 1     | 0    | 0    | 0.33 | 0.33 | 1  | 0    | 0    | 0.33 | 3       | 1\nVZEROUPPER                  | 4     | 0    | 0    | 0    | 0    | 0  | 0    | 0    | 0    | 0       | 1\nCALL 660 <@plt_start@+0x10> | 2     | 0    | 0    | 0.33 | 0.33 | 1  | 0    | 1    | 0.33 | 0       | 2\nMOV %R12,%RDI               | 1     | 0    | 0    | 0    | 0    | 0  | 0    | 0    | 0    | 0       | 0.25\nCALL 660 <@plt_start@+0x10> | 2     | 0    | 0    | 0.33 | 0.33 | 1  | 0    | 1    | 0.33 | 0       | 2\nVMOVSD -0x58(%RBP),%XMM0    | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0    | 0    | 0    | 0       | 0.50\nMOV $0x1,%EDI               | 1     | 0.25 | 0.25 | 0    | 0    | 0  | 0.25 | 0.25 | 0    | 1       | 0.25\nLEA 0x5c7(%RIP),%RSI        | 1     | 0    | 1    | 0    | 0    | 0  | 0    | 0    | 0    | 3       | 1\nMOV $0x1,%EAX               | 1     | 0.25 | 0.25 | 0    | 0    | 0  | 0.25 | 0.25 | 0    | 1       | 0.25\nCALL 690 <@plt_start@+0x40> | 2     | 0    | 0    | 0.33 | 0.33 | 1  | 0    | 1    | 0.33 | 0       | 2\nMOV -0x38(%RBP),%RDI        | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0    | 0    | 0    | 2       | 0.50\nXOR %FS:0x28,%RDI           | 1     | 0.25 | 0.25 | 0.50 | 0.50 | 0  | 0.25 | 0.25 | 0    | 1       | 0.50\nMOV %R13D,%EAX              | 1     | 0    | 0    | 0    | 0    | 0  | 0    | 0    | 0    | 0       | 0.25\nJNE a6b <main+0x3ab>        | 1     | 0.50 | 0    | 0    | 0    | 0  | 0    | 0.50 | 0    | 0       | 0.50-1\nADD $0x48,%RSP              | 1     | 0.25 | 0.25 | 0    | 0    | 0  | 0.25 | 0.25 | 0    | 1       | 0.25\nPOP %RBX                    | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0    | 0    | 0    | 2       | 0.50\nPOP %RCX                    | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0    | 0    | 0    | 2       | 0.50\nPOP %R12                    | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0    | 0    | 0    | 2       | 0.50\nPOP %R13                    | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0    | 0    | 0    | 2       | 0.50\nPOP %R14                    | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0    | 0    | 0    | 2       | 0.50\nPOP %RBP                    | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0    | 0    | 0    | 2       | 0.50\nLEA -0x8(%RCX),%RSP         | 1     | 0    | 0.50 | 0    | 0    | 0  | 0.50 | 0    | 0    | 1       | 0.50\nRET                         | 1     | 0    | 0    | 0.33 | 0.33 | 0  | 0    | 1    | 0.33 | 0       | 1\nLEA -0x40(%RBP),%RDI        | 1     | 0    | 0.50 | 0    | 0    | 0  | 0.50 | 0    | 0    | 1       | 0.50\nMOV %R14,%RDX               | 1     | 0    | 0    | 0    | 0    | 0  | 0    | 0    | 0    | 0       | 0.25\nMOV $0x20,%ESI              | 1     | 0.25 | 0.25 | 0    | 0    | 0  | 0.25 | 0.25 | 0    | 1       | 0.25\nXOR %EBX,%EBX               | 1     | 0    | 0    | 0    | 0    | 0  | 0    | 0    | 0    | 0       | 0.25\nCALL 6a0 <@plt_start@+0x50> | 2     | 0    | 0    | 0.33 | 0.33 | 1  | 0    | 1    | 0.33 | 0       | 2\nXOR %R12D,%R12D             | 1     | 0    | 0    | 0    | 0    | 0  | 0    | 0    | 0    | 0       | 0.25\nTEST %EAX,%EAX              | 1     | 0.25 | 0.25 | 0    | 0    | 0  | 0.25 | 0.25 | 0    | 1       | 0.25\nJNE 764 <main+0xa4>         | 1     | 0.50 | 0    | 0    | 0    | 0  | 0    | 0.50 | 0    | 0       | 0.50-1\nJMP 75e <main+0x9e>         | 1     | 0    | 0    | 0    | 0    | 0  | 0    | 1    | 0    | 0       | 1-2\nMOV $0x2,%R13D              | 1     | 0.25 | 0.25 | 0    | 0    | 0  | 0.25 | 0.25 | 0    | 1       | 0.25\nJMP a0d <main+0x34d>        | 1     | 0    | 0    | 0    | 0    | 0  | 0    | 1    | 0    | 0       | 1-2\nNOPL (%RAX)                 | 1     | 0    | 0    | 0    | 0    | 0  | 0    | 0    | 0    | 0       | 0.25\nCALL 670 <@plt_start@+0x20> | 2     | 0    | 0    | 0.33 | 0.33 | 1  | 0    | 1    | 0.33 | 0       | 2\n",
        },
        {
          title = "General properties",
          txt = "nb instructions    : 103\nnb uops            : 118\nloop length        : 395\nused x86 registers : 14\nused mmx registers : 0\nused xmm registers : 3\nused ymm registers : 0\nused zmm registers : 0\nnb stack references: 5\n",
        },
        {
          title = "Front-end",
          txt = "MACRO FUSION NOT POSSIBLE\nFIT IN UOP CACHE\nmicro-operation queue: 29.50 cycles\nfront end            : 29.50 cycles\n",
        },
        {
          title = "Back-end",
          txt = "       | P0    | P1    | P2    | P3    | P4    | P5    | P6    | P7\n----------------------------------------------------------------------\nuops   | 13.00 | 13.00 | 11.67 | 11.67 | 20.00 | 13.00 | 14.00 | 11.67\ncycles | 13.00 | 13.00 | 11.67 | 11.67 | 20.00 | 13.00 | 14.00 | 11.67\n\nCycles executing div or sqrt instructions: NA\n",
        },
        {
          title = "Cycles summary",
          txt = "Front-end : 29.50\nDispatch  : 20.00\nOverall L1: 29.50\n",
        },
        {
          title = "Vectorization ratios",
          txt = "INT\nall    : 3%\nload   : 0%\nstore  : 0%\nmul    : NA (no mul vectorizable/vectorized instructions)\nadd-sub: 0%\nother  : 4%\nFP\nall    : 50%\nload   : 0%\nstore  : 0%\nmul    : NA (no mul vectorizable/vectorized instructions)\nadd-sub: NA (no add-sub vectorizable/vectorized instructions)\nother  : 100%\nINT+FP\nall    : 9%\nload   : 0%\nstore  : 0%\nmul    : NA (no mul vectorizable/vectorized instructions)\nadd-sub: 0%\nother  : 12%\n",
        },
        {
          title = "Vector efficiency ratios",
          txt = "INT\nall    : 20%\nload   : 25%\nstore  : 25%\nmul    : NA (no mul vectorizable/vectorized instructions)\nadd-sub: 12%\nother  : 19%\nFP\nall    : 37%\nload   : 25%\nstore  : 25%\nmul    : NA (no mul vectorizable/vectorized instructions)\nadd-sub: NA (no add-sub vectorizable/vectorized instructions)\nother  : 50%\nINT+FP\nall    : 22%\nload   : 25%\nstore  : 25%\nmul    : NA (no mul vectorizable/vectorized instructions)\nadd-sub: 12%\nother  : 22%\n",
        },
        {
          title = "Cycles and memory resources usage",
          txt = "Assuming all data fit into the L1 cache, each call to the function takes 29.50 cycles. At this rate:\n - 3% of peak load performance is reached (2.17 out of 64.00 bytes loaded per cycle (GB/s @ 1GHz))\n - 1% of peak store performance is reached (0.54 out of 32.00 bytes stored per cycle (GB/s @ 1GHz))\n",
        },
        {
          title = "Front-end bottlenecks",
          txt = "Performance is limited by instruction throughput (loading/decoding program instructions to execution core) (front-end is a bottleneck).\n\nBy removing all these bottlenecks, you can lower the cost of an iteration from 29.50 to 20.00 cycles (1.48x speedup).\n",
        },
      },
      header = {
        "Warnings:\nDetected a function call instruction: ignoring called function instructions.\nRerun with --follow-calls=append to include them to analysis  or with --follow-calls=inline to simulate inlining.",
        "0% of peak computational performance is used (0.00 out of 4.00 FLOP per cycle (GFLOPS @ 1GHz))",
      },
      brief = {
      },
      gain = {
        {
          workaround = " - Try to reorganize arrays of structures to structures of arrays\n - Consider to permute loops (see vectorization gain report)\n",
          title = "Code clean check",
          txt = "Detected a slowdown caused by scalar integer instructions (typically used for address computation).\nBy removing them, you can lower the cost of an iteration from 29.50 to 4.50 cycles (6.56x speedup).",
        },
        {
          workaround = " - Try another compiler or update/tune your current one\n - Make array accesses unit-stride:\n  * If your function streams arrays of structures (AoS), try to use structures of arrays instead (SoA):\nfor(i) a[i].x = b[i].x; (slow, non stride 1) => for(i) a.x[i] = b.x[i]; (fast, stride 1)\n",
          details = "Store and arithmetical SSE/AVX instructions are used in scalar version (process only one data element in vector registers).\nSince your execution units are vector units, only a vectorized function can use their full power.\n",
          title = "Vectorization",
          txt = "Your function is probably not vectorized.\nOnly 22% of vector register length is used (average across all SSE/AVX instructions).\nBy vectorizing your function, you can lower the cost of an iteration from 29.50 to 4.08 cycles (7.23x speedup).",
        },
        {
          title = "Execution units bottlenecks",
          txt = "Found no such bottlenecks but see expert reports for more complex bottlenecks.",
        },
      },
      potential = {
      },
    },
  common = {
    header = {
      "The function is defined in:\n - /usr/include/stdlib.h:375\n - /usr/include/x86_64-linux-gnu/bits/stdio2.h:104\n - /home/m4ssi/Documents/Test/Dotprod/02.dotprod.c:5-10,24-39,45-56,62\n\n",
      "Warnings:\nIgnoring paths for analysis",
    },
  },
}
