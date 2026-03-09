{ ... }:

{
  zramSwap = {
    enable = true;
    memoryPercent = 25;
    algorithm = "zstd";
  };
}
