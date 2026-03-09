{ pkgs, ... }:

# AMD GPU Compute Support (ROCm)
# This module provides the ROCm stack for GPU compute workloads (AI/ML, OpenCL, HIP)
# Used by: tank, beelink, deepspace
#
# For gaming/graphics support, see software/gaming/amd-support.nix (deepspace only)

{
  hardware.graphics = {
    enable = true;
    enable32Bit = true;

    extraPackages = with pkgs; [
      lact

      mesa 
      
      ### Vulkan ###
      vulkan-loader
      vulkan-validation-layers
      vulkan-tools 

      rocmPackages.clr 
      rocmPackages.rocm-runtime

      ### Video Acceleration ###
      libva 
      libva-utils
      libva-vdpau-driver
      libvdpau-va-gl 
    ];

    extraPackages32 = with pkgs.pkgsi686Linux; [
      mesa 
      vulkan-loader
      libva
      libva-vdpau-driver
      libvdpau-va-gl
    ];

  };

  boot.kernelModules = [ "amdgpu" ];
  
  boot.kernelParams = [
    "amdgpu.ppfeaturemask=0xffffffff"
    "amdgpu.dc=1"
  ];

  environment.variables = {
    AMD_VULKAN_ICD = "RADV";
    RADV_PERFTEST = "gpl,nggc,rt";
  };

}
