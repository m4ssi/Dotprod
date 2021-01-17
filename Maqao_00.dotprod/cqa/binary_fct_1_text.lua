_cqa_text_report = {
  paths = {
    {
      hint = {
        {
          title = "Type of elements and instruction set",
          txt = "No instructions are processing arithmetic or math operations on FP elements. This function is probably writing/copying data or processing integer elements.",
        },
        {
          title = "Matching between your function (in the source code) and the binary function",
          txt = "The binary function does not contain any FP arithmetical operations.\nThe binary function is loading 8 bytes.\nThe binary function is storing 40 bytes.",
        },
      },
      expert = {
        {
          title = "ASM code",
          txt = "In the binary file, the address of the function is: 71a\n\nInstruction             | Nb FU | P0 | P1 | P2   | P3   | P4 | P5 | P6 | P7   | Latency | Recip. throughput\n-----------------------------------------------------------------------------------------------------------\nPUSH %RBP               | 1     | 0  | 0  | 0.33 | 0.33 | 1  | 0  | 0  | 0.33 | 3       | 1\nMOV %RSP,%RBP           | 1     | 0  | 0  | 0    | 0    | 0  | 0  | 0  | 0    | 0       | 0.25\nMOV %RDI,-0x18(%RBP)    | 1     | 0  | 0  | 0.33 | 0.33 | 1  | 0  | 0  | 0.33 | 3       | 1\nMOV %RSI,-0x20(%RBP)    | 1     | 0  | 0  | 0.33 | 0.33 | 1  | 0  | 0  | 0.33 | 3       | 1\nMOV %RDX,-0x28(%RBP)    | 1     | 0  | 0  | 0.33 | 0.33 | 1  | 0  | 0  | 0.33 | 3       | 1\nPXOR %XMM0,%XMM0        | 1     | 0  | 0  | 0    | 0    | 0  | 0  | 0  | 0    | 0       | 0.25\nMOVSD %XMM0,-0x10(%RBP) | 1     | 0  | 0  | 0.33 | 0.33 | 1  | 0  | 0  | 0.33 | 3       | 1\nMOVQ $0,-0x8(%RBP)      | 1     | 0  | 0  | 0.33 | 0.33 | 1  | 0  | 0  | 0.33 | 3       | 1\nJMP 782 <dotprod+0x68>  | 1     | 0  | 0  | 0    | 0    | 0  | 0  | 1  | 0    | 0       | 1-2\nMOVSD -0x10(%RBP),%XMM0 | 1     | 0  | 0  | 0.50 | 0.50 | 0  | 0  | 0  | 0    | 0       | 0.50\nPOP %RBP                | 1     | 0  | 0  | 0.50 | 0.50 | 0  | 0  | 0  | 0    | 2       | 0.50\nRET                     | 1     | 0  | 0  | 0.33 | 0.33 | 0  | 0  | 1  | 0.33 | 0       | 1\n",
        },
        {
          title = "General properties",
          txt = "nb instructions    : 12\nnb uops            : 12\nloop length        : 42\nused x86 registers : 5\nused mmx registers : 0\nused xmm registers : 1\nused ymm registers : 0\nused zmm registers : 0\nnb stack references: 5\n",
        },
        {
          title = "Front-end",
          txt = "MACRO FUSION NOT POSSIBLE\nFIT IN UOP CACHE\nmicro-operation queue: 3.00 cycles\nfront end            : 3.00 cycles\n",
        },
        {
          title = "Back-end",
          txt = "       | P0   | P1   | P2   | P3   | P4   | P5   | P6   | P7\n--------------------------------------------------------------\nuops   | 0.00 | 0.00 | 3.00 | 3.00 | 6.00 | 0.00 | 2.00 | 3.00\ncycles | 0.00 | 0.00 | 3.00 | 3.00 | 6.00 | 0.00 | 2.00 | 3.00\n\nCycles executing div or sqrt instructions: NA\n",
        },
        {
          title = "Cycles summary",
          txt = "Front-end : 3.00\nDispatch  : 6.00\nOverall L1: 6.00\n",
        },
        {
          title = "Vectorization ratios",
          txt = "INT\nall    : 16%\nload   : NA (no load vectorizable/vectorized instructions)\nstore  : 0%\nmul    : NA (no mul vectorizable/vectorized instructions)\nadd-sub: NA (no add-sub vectorizable/vectorized instructions)\nother  : 50%\nFP\nall    : 0%\nload   : 0%\nstore  : 0%\nmul    : NA (no mul vectorizable/vectorized instructions)\nadd-sub: NA (no add-sub vectorizable/vectorized instructions)\nother  : NA (no other vectorizable/vectorized instructions)\nINT+FP\nall    : 12%\nload   : 0%\nstore  : 0%\nmul    : NA (no mul vectorizable/vectorized instructions)\nadd-sub: NA (no add-sub vectorizable/vectorized instructions)\nother  : 50%\n",
        },
        {
          title = "Vector efficiency ratios",
          txt = "INT\nall    : 27%\nload   : NA (no load vectorizable/vectorized instructions)\nstore  : 21%\nmul    : NA (no mul vectorizable/vectorized instructions)\nadd-sub: NA (no add-sub vectorizable/vectorized instructions)\nother  : 37%\nFP\nall    : 25%\nload   : 25%\nstore  : 25%\nmul    : NA (no mul vectorizable/vectorized instructions)\nadd-sub: NA (no add-sub vectorizable/vectorized instructions)\nother  : NA (no other vectorizable/vectorized instructions)\nINT+FP\nall    : 26%\nload   : 25%\nstore  : 22%\nmul    : NA (no mul vectorizable/vectorized instructions)\nadd-sub: NA (no add-sub vectorizable/vectorized instructions)\nother  : 37%\n",
        },
        {
          title = "Cycles and memory resources usage",
          txt = "Assuming all data fit into the L1 cache, each call to the function takes 6.00 cycles. At this rate:\n - 2% of peak load performance is reached (1.33 out of 64.00 bytes loaded per cycle (GB/s @ 1GHz))\n - 20% of peak store performance is reached (6.67 out of 32.00 bytes stored per cycle (GB/s @ 1GHz))\n",
        },
        {
          title = "Front-end bottlenecks",
          txt = "Found no such bottlenecks.",
        },
      },
      header = {
        "0% of peak computational performance is used (0.00 out of 4.00 FLOP per cycle (GFLOPS @ 1GHz))",
      },
      brief = {
      },
      gain = {
        {
          workaround = " - Try to reorganize arrays of structures to structures of arrays\n - Consider to permute loops (see vectorization gain report)\n",
          title = "Code clean check",
          txt = "Detected a slowdown caused by scalar integer instructions (typically used for address computation).\nBy removing them, you can lower the cost of an iteration from 6.00 to 1.00 cycles (6.00x speedup).",
        },
        {
          workaround = " - Try another compiler or update/tune your current one\n - Make array accesses unit-stride:\n  * If your function streams arrays of structures (AoS), try to use structures of arrays instead (SoA):\nfor(i) a[i].x = b[i].x; (slow, non stride 1) => for(i) a.x[i] = b.x[i]; (fast, stride 1)\n",
          details = "Store and arithmetical SSE/AVX instructions are used in scalar version (process only one data element in vector registers).\nSince your execution units are vector units, only a vectorized function can use their full power.\n",
          title = "Vectorization",
          txt = "Your function is probably not vectorized.\nOnly 26% of vector register length is used (average across all SSE/AVX instructions).\nBy vectorizing your function, you can lower the cost of an iteration from 6.00 to 1.25 cycles (4.80x speedup).",
        },
        {
          workaround = " - Write less array elements\n - Provide more information to your compiler:\n  * use the 'restrict' C99 keyword\n",
          title = "Execution units bottlenecks",
          txt = "Performance is limited by writing data to caches/RAM (the store unit is a bottleneck).\n\nBy removing all these bottlenecks, you can lower the cost of an iteration from 6.00 to 3.00 cycles (2.00x speedup).\n",
        },
      },
      potential = {
      },
    },
  },
  AVG = {
      hint = {
        {
          title = "Type of elements and instruction set",
          txt = "No instructions are processing arithmetic or math operations on FP elements. This function is probably writing/copying data or processing integer elements.",
        },
        {
          title = "Matching between your function (in the source code) and the binary function",
          txt = "The binary function does not contain any FP arithmetical operations.\nThe binary function is loading 8 bytes.\nThe binary function is storing 40 bytes.",
        },
      },
      expert = {
        {
          title = "ASM code",
          txt = "In the binary file, the address of the function is: 71a\n\nInstruction             | Nb FU | P0 | P1 | P2   | P3   | P4 | P5 | P6 | P7   | Latency | Recip. throughput\n-----------------------------------------------------------------------------------------------------------\nPUSH %RBP               | 1     | 0  | 0  | 0.33 | 0.33 | 1  | 0  | 0  | 0.33 | 3       | 1\nMOV %RSP,%RBP           | 1     | 0  | 0  | 0    | 0    | 0  | 0  | 0  | 0    | 0       | 0.25\nMOV %RDI,-0x18(%RBP)    | 1     | 0  | 0  | 0.33 | 0.33 | 1  | 0  | 0  | 0.33 | 3       | 1\nMOV %RSI,-0x20(%RBP)    | 1     | 0  | 0  | 0.33 | 0.33 | 1  | 0  | 0  | 0.33 | 3       | 1\nMOV %RDX,-0x28(%RBP)    | 1     | 0  | 0  | 0.33 | 0.33 | 1  | 0  | 0  | 0.33 | 3       | 1\nPXOR %XMM0,%XMM0        | 1     | 0  | 0  | 0    | 0    | 0  | 0  | 0  | 0    | 0       | 0.25\nMOVSD %XMM0,-0x10(%RBP) | 1     | 0  | 0  | 0.33 | 0.33 | 1  | 0  | 0  | 0.33 | 3       | 1\nMOVQ $0,-0x8(%RBP)      | 1     | 0  | 0  | 0.33 | 0.33 | 1  | 0  | 0  | 0.33 | 3       | 1\nJMP 782 <dotprod+0x68>  | 1     | 0  | 0  | 0    | 0    | 0  | 0  | 1  | 0    | 0       | 1-2\nMOVSD -0x10(%RBP),%XMM0 | 1     | 0  | 0  | 0.50 | 0.50 | 0  | 0  | 0  | 0    | 0       | 0.50\nPOP %RBP                | 1     | 0  | 0  | 0.50 | 0.50 | 0  | 0  | 0  | 0    | 2       | 0.50\nRET                     | 1     | 0  | 0  | 0.33 | 0.33 | 0  | 0  | 1  | 0.33 | 0       | 1\n",
        },
        {
          title = "General properties",
          txt = "nb instructions    : 12\nnb uops            : 12\nloop length        : 42\nused x86 registers : 5\nused mmx registers : 0\nused xmm registers : 1\nused ymm registers : 0\nused zmm registers : 0\nnb stack references: 5\n",
        },
        {
          title = "Front-end",
          txt = "MACRO FUSION NOT POSSIBLE\nFIT IN UOP CACHE\nmicro-operation queue: 3.00 cycles\nfront end            : 3.00 cycles\n",
        },
        {
          title = "Back-end",
          txt = "       | P0   | P1   | P2   | P3   | P4   | P5   | P6   | P7\n--------------------------------------------------------------\nuops   | 0.00 | 0.00 | 3.00 | 3.00 | 6.00 | 0.00 | 2.00 | 3.00\ncycles | 0.00 | 0.00 | 3.00 | 3.00 | 6.00 | 0.00 | 2.00 | 3.00\n\nCycles executing div or sqrt instructions: NA\n",
        },
        {
          title = "Cycles summary",
          txt = "Front-end : 3.00\nDispatch  : 6.00\nOverall L1: 6.00\n",
        },
        {
          title = "Vectorization ratios",
          txt = "INT\nall    : 16%\nload   : NA (no load vectorizable/vectorized instructions)\nstore  : 0%\nmul    : NA (no mul vectorizable/vectorized instructions)\nadd-sub: NA (no add-sub vectorizable/vectorized instructions)\nother  : 50%\nFP\nall    : 0%\nload   : 0%\nstore  : 0%\nmul    : NA (no mul vectorizable/vectorized instructions)\nadd-sub: NA (no add-sub vectorizable/vectorized instructions)\nother  : NA (no other vectorizable/vectorized instructions)\nINT+FP\nall    : 12%\nload   : 0%\nstore  : 0%\nmul    : NA (no mul vectorizable/vectorized instructions)\nadd-sub: NA (no add-sub vectorizable/vectorized instructions)\nother  : 50%\n",
        },
        {
          title = "Vector efficiency ratios",
          txt = "INT\nall    : 27%\nload   : NA (no load vectorizable/vectorized instructions)\nstore  : 21%\nmul    : NA (no mul vectorizable/vectorized instructions)\nadd-sub: NA (no add-sub vectorizable/vectorized instructions)\nother  : 37%\nFP\nall    : 25%\nload   : 25%\nstore  : 25%\nmul    : NA (no mul vectorizable/vectorized instructions)\nadd-sub: NA (no add-sub vectorizable/vectorized instructions)\nother  : NA (no other vectorizable/vectorized instructions)\nINT+FP\nall    : 26%\nload   : 25%\nstore  : 22%\nmul    : NA (no mul vectorizable/vectorized instructions)\nadd-sub: NA (no add-sub vectorizable/vectorized instructions)\nother  : 37%\n",
        },
        {
          title = "Cycles and memory resources usage",
          txt = "Assuming all data fit into the L1 cache, each call to the function takes 6.00 cycles. At this rate:\n - 2% of peak load performance is reached (1.33 out of 64.00 bytes loaded per cycle (GB/s @ 1GHz))\n - 20% of peak store performance is reached (6.67 out of 32.00 bytes stored per cycle (GB/s @ 1GHz))\n",
        },
        {
          title = "Front-end bottlenecks",
          txt = "Found no such bottlenecks.",
        },
      },
      header = {
        "0% of peak computational performance is used (0.00 out of 4.00 FLOP per cycle (GFLOPS @ 1GHz))",
      },
      brief = {
      },
      gain = {
        {
          workaround = " - Try to reorganize arrays of structures to structures of arrays\n - Consider to permute loops (see vectorization gain report)\n",
          title = "Code clean check",
          txt = "Detected a slowdown caused by scalar integer instructions (typically used for address computation).\nBy removing them, you can lower the cost of an iteration from 6.00 to 1.00 cycles (6.00x speedup).",
        },
        {
          workaround = " - Try another compiler or update/tune your current one\n - Make array accesses unit-stride:\n  * If your function streams arrays of structures (AoS), try to use structures of arrays instead (SoA):\nfor(i) a[i].x = b[i].x; (slow, non stride 1) => for(i) a.x[i] = b.x[i]; (fast, stride 1)\n",
          details = "Store and arithmetical SSE/AVX instructions are used in scalar version (process only one data element in vector registers).\nSince your execution units are vector units, only a vectorized function can use their full power.\n",
          title = "Vectorization",
          txt = "Your function is probably not vectorized.\nOnly 26% of vector register length is used (average across all SSE/AVX instructions).\nBy vectorizing your function, you can lower the cost of an iteration from 6.00 to 1.25 cycles (4.80x speedup).",
        },
        {
          workaround = " - Write less array elements\n - Provide more information to your compiler:\n  * use the 'restrict' C99 keyword\n",
          title = "Execution units bottlenecks",
          txt = "Performance is limited by writing data to caches/RAM (the store unit is a bottleneck).\n\nBy removing all these bottlenecks, you can lower the cost of an iteration from 6.00 to 3.00 cycles (2.00x speedup).\n",
        },
      },
      potential = {
      },
    },
  common = {
    header = {
      "The function is defined in /home/m4ssi/Documents/Test/Dotprod/00.dotprod.c:4-9.\n",
      "Warnings:\nIgnoring paths for analysis",
    },
  },
}
