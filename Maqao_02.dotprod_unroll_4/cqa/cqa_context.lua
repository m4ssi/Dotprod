_cqa_uarch_const = {
  ["nb simple decoders"] = 3,
  ["FP DIV/SQRT unit native width"] = 16,
  ["vector-unaligned optimal pattern"] = "1x256",
  ["unlamination threshold"] = 4,
  ["NOP 0f 1f decode"] = "fast",
  ["ports"] = {
    ["FP ADD"] = {
      [1] = 1,
    },
    ["load"] = {
      [1] = 2,
      [2] = 3,
    },
    ["store address"] = {
      [1] = 2,
      [2] = 3,
      [3] = 7,
    },
    ["misc"] = {
      [1] = 0,
      [2] = 1,
      [3] = 5,
      [4] = 6,
    },
    ["store data"] = {
      [1] = 4,
    },
    ["DIV/SQRT"] = {
      [1] = 0,
    },
    ["FP MUL"] = {
      [1] = 0,
      [2] = 1,
    },
  },
  ["uop cache capacity"] = 1000,
  ["IQ throughput"] = 4,
  ["vector size in bytes"] = 32,
  ["store unit native width"] = 32,
  ["load unit native width"] = 32,
  ["predec insns per cycle"] = 6,
  ["Max Loop Buffer bytes"] = 512,
  ["nb FP MUL units"] = 2,
  ["nb complex decoders"] = 1,
  ["UQ throughput"] = 4,
  ["INT vector size in bytes"] = 32,
  ["bytes fetched per cycle"] = 16,
  ["retire throughput"] = 4,
  ["nb execution ports"] = 8,
  ["Max Loop Buffer uops"] = 56,
}
