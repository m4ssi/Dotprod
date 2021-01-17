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
          txt = "The binary function does not contain any FP arithmetical operations.\nThe binary function is storing 24 bytes.",
        },
      },
      expert = {
        {
          title = "ASM code",
          txt = "In the binary file, the address of the function is: 793\n\nInstruction                | Nb FU | P0 | P1 | P2   | P3   | P4 | P5 | P6 | P7   | Latency | Recip. throughput\n--------------------------------------------------------------------------------------------------------------\nPUSH %RBP                  | 1     | 0  | 0  | 0.33 | 0.33 | 1  | 0  | 0  | 0.33 | 3       | 1\nMOV %RSP,%RBP              | 1     | 0  | 0  | 0    | 0    | 0  | 0  | 0  | 0    | 0       | 0.25\nMOV %RDI,-0x18(%RBP)       | 1     | 0  | 0  | 0.33 | 0.33 | 1  | 0  | 0  | 0.33 | 3       | 1\nMOV %RSI,-0x20(%RBP)       | 1     | 0  | 0  | 0.33 | 0.33 | 1  | 0  | 0  | 0.33 | 3       | 1\nMOVQ $0,-0x8(%RBP)         | 1     | 0  | 0  | 0.33 | 0.33 | 1  | 0  | 0  | 0.33 | 3       | 1\nJMP 7cd <fill_vector+0x3a> | 1     | 0  | 0  | 0    | 0    | 0  | 0  | 1  | 0    | 0       | 1-2\nNOP                        | 1     | 0  | 0  | 0    | 0    | 0  | 0  | 0  | 0    | 0       | 0.25\nPOP %RBP                   | 1     | 0  | 0  | 0.50 | 0.50 | 0  | 0  | 0  | 0    | 2       | 0.50\nRET                        | 1     | 0  | 0  | 0.33 | 0.33 | 0  | 0  | 1  | 0.33 | 0       | 1\n",
        },
        {
          title = "General properties",
          txt = "nb instructions    : 9\nnb uops            : 9\nloop length        : 25\nused x86 registers : 4\nused mmx registers : 0\nused xmm registers : 0\nused ymm registers : 0\nused zmm registers : 0\nnb stack references: 3\n",
        },
        {
          title = "Front-end",
          txt = "MACRO FUSION NOT POSSIBLE\nFIT IN UOP CACHE\nmicro-operation queue: 2.25 cycles\nfront end            : 2.25 cycles\n",
        },
        {
          title = "Back-end",
          txt = "       | P0   | P1   | P2   | P3   | P4   | P5   | P6   | P7\n--------------------------------------------------------------\nuops   | 0.00 | 0.00 | 2.17 | 1.83 | 4.00 | 0.00 | 2.00 | 2.00\ncycles | 0.00 | 0.00 | 2.17 | 1.83 | 4.00 | 0.00 | 2.00 | 2.00\n\nCycles executing div or sqrt instructions: NA\n",
        },
        {
          title = "Cycles summary",
          txt = "Front-end : 2.25\nDispatch  : 4.00\nOverall L1: 4.00\n",
        },
        {
          title = "Vectorization ratios",
          txt = "all    : 0%\nload   : NA (no load vectorizable/vectorized instructions)\nstore  : 0%\nmul    : NA (no mul vectorizable/vectorized instructions)\nadd-sub: NA (no add-sub vectorizable/vectorized instructions)\nother  : 0%\n",
        },
        {
          title = "Vector efficiency ratios",
          txt = "all    : 21%\nload   : NA (no load vectorizable/vectorized instructions)\nstore  : 20%\nmul    : NA (no mul vectorizable/vectorized instructions)\nadd-sub: NA (no add-sub vectorizable/vectorized instructions)\nother  : 25%\n",
        },
        {
          title = "Cycles and memory resources usage",
          txt = "Assuming all data fit into the L1 cache, each call to the function takes 4.00 cycles. At this rate:\n - 18% of peak store performance is reached (6.00 out of 32.00 bytes stored per cycle (GB/s @ 1GHz))\n",
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
          workaround = " - Try another compiler or update/tune your current one\n - Make array accesses unit-stride:\n  * If your function streams arrays of structures (AoS), try to use structures of arrays instead (SoA):\nfor(i) a[i].x = b[i].x; (slow, non stride 1) => for(i) a.x[i] = b.x[i]; (fast, stride 1)\n",
          details = "All SSE/AVX instructions are used in scalar version (process only one data element in vector registers).\nSince your execution units are vector units, only a vectorized function can use their full power.\n",
          title = "Vectorization",
          txt = "Your function is not vectorized.\nOnly 21% of vector register length is used (average across all SSE/AVX instructions).\nBy vectorizing your function, you can lower the cost of an iteration from 4.00 to 0.75 cycles (5.33x speedup).",
        },
        {
          workaround = " - Write less array elements\n - Provide more information to your compiler:\n  * use the 'restrict' C99 keyword\n",
          title = "Execution units bottlenecks",
          txt = "Performance is limited by writing data to caches/RAM (the store unit is a bottleneck).\n\nBy removing all these bottlenecks, you can lower the cost of an iteration from 4.00 to 2.25 cycles (1.78x speedup).\n",
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
          txt = "The binary function does not contain any FP arithmetical operations.\nThe binary function is storing 24 bytes.",
        },
      },
      expert = {
        {
          title = "ASM code",
          txt = "In the binary file, the address of the function is: 793\n\nInstruction                | Nb FU | P0 | P1 | P2   | P3   | P4 | P5 | P6 | P7   | Latency | Recip. throughput\n--------------------------------------------------------------------------------------------------------------\nPUSH %RBP                  | 1     | 0  | 0  | 0.33 | 0.33 | 1  | 0  | 0  | 0.33 | 3       | 1\nMOV %RSP,%RBP              | 1     | 0  | 0  | 0    | 0    | 0  | 0  | 0  | 0    | 0       | 0.25\nMOV %RDI,-0x18(%RBP)       | 1     | 0  | 0  | 0.33 | 0.33 | 1  | 0  | 0  | 0.33 | 3       | 1\nMOV %RSI,-0x20(%RBP)       | 1     | 0  | 0  | 0.33 | 0.33 | 1  | 0  | 0  | 0.33 | 3       | 1\nMOVQ $0,-0x8(%RBP)         | 1     | 0  | 0  | 0.33 | 0.33 | 1  | 0  | 0  | 0.33 | 3       | 1\nJMP 7cd <fill_vector+0x3a> | 1     | 0  | 0  | 0    | 0    | 0  | 0  | 1  | 0    | 0       | 1-2\nNOP                        | 1     | 0  | 0  | 0    | 0    | 0  | 0  | 0  | 0    | 0       | 0.25\nPOP %RBP                   | 1     | 0  | 0  | 0.50 | 0.50 | 0  | 0  | 0  | 0    | 2       | 0.50\nRET                        | 1     | 0  | 0  | 0.33 | 0.33 | 0  | 0  | 1  | 0.33 | 0       | 1\n",
        },
        {
          title = "General properties",
          txt = "nb instructions    : 9\nnb uops            : 9\nloop length        : 25\nused x86 registers : 4\nused mmx registers : 0\nused xmm registers : 0\nused ymm registers : 0\nused zmm registers : 0\nnb stack references: 3\n",
        },
        {
          title = "Front-end",
          txt = "MACRO FUSION NOT POSSIBLE\nFIT IN UOP CACHE\nmicro-operation queue: 2.25 cycles\nfront end            : 2.25 cycles\n",
        },
        {
          title = "Back-end",
          txt = "       | P0   | P1   | P2   | P3   | P4   | P5   | P6   | P7\n--------------------------------------------------------------\nuops   | 0.00 | 0.00 | 2.17 | 1.83 | 4.00 | 0.00 | 2.00 | 2.00\ncycles | 0.00 | 0.00 | 2.17 | 1.83 | 4.00 | 0.00 | 2.00 | 2.00\n\nCycles executing div or sqrt instructions: NA\n",
        },
        {
          title = "Cycles summary",
          txt = "Front-end : 2.25\nDispatch  : 4.00\nOverall L1: 4.00\n",
        },
        {
          title = "Vectorization ratios",
          txt = "all    : 0%\nload   : NA (no load vectorizable/vectorized instructions)\nstore  : 0%\nmul    : NA (no mul vectorizable/vectorized instructions)\nadd-sub: NA (no add-sub vectorizable/vectorized instructions)\nother  : 0%\n",
        },
        {
          title = "Vector efficiency ratios",
          txt = "all    : 21%\nload   : NA (no load vectorizable/vectorized instructions)\nstore  : 20%\nmul    : NA (no mul vectorizable/vectorized instructions)\nadd-sub: NA (no add-sub vectorizable/vectorized instructions)\nother  : 25%\n",
        },
        {
          title = "Cycles and memory resources usage",
          txt = "Assuming all data fit into the L1 cache, each call to the function takes 4.00 cycles. At this rate:\n - 18% of peak store performance is reached (6.00 out of 32.00 bytes stored per cycle (GB/s @ 1GHz))\n",
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
          workaround = " - Try another compiler or update/tune your current one\n - Make array accesses unit-stride:\n  * If your function streams arrays of structures (AoS), try to use structures of arrays instead (SoA):\nfor(i) a[i].x = b[i].x; (slow, non stride 1) => for(i) a.x[i] = b.x[i]; (fast, stride 1)\n",
          details = "All SSE/AVX instructions are used in scalar version (process only one data element in vector registers).\nSince your execution units are vector units, only a vectorized function can use their full power.\n",
          title = "Vectorization",
          txt = "Your function is not vectorized.\nOnly 21% of vector register length is used (average across all SSE/AVX instructions).\nBy vectorizing your function, you can lower the cost of an iteration from 4.00 to 0.75 cycles (5.33x speedup).",
        },
        {
          workaround = " - Write less array elements\n - Provide more information to your compiler:\n  * use the 'restrict' C99 keyword\n",
          title = "Execution units bottlenecks",
          txt = "Performance is limited by writing data to caches/RAM (the store unit is a bottleneck).\n\nBy removing all these bottlenecks, you can lower the cost of an iteration from 4.00 to 2.25 cycles (1.78x speedup).\n",
        },
      },
      potential = {
      },
    },
  common = {
    header = {
      "The function is defined in /home/m4ssi/Documents/Test/Dotprod/00.dotprod.c:11-14.\n",
      "Warnings:\nIgnoring paths for analysis",
    },
  },
}
