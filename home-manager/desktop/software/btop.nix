{ pkgs, ... }:

{
  programs.btop = {
    enable = true;
    package = pkgs.btop-rocm;

    settings = {
      color_theme = "btop.theme";
      theme_background = true;
      force_tty = true;
      vim_keys = true;
      rounded_corners = true;
      terminal_sync = true;
      graph_symbol = "tty";
      graph_symbol_cpu = "braille";
      graph_symbol_gpu = "braille";
      graph_symbol_mem = "braille";
      graph_symbol_net = "braille";
      graph_symbol_proc = "braille";
      shown_boxes = "cpu mem net proc";
      update_ms = 1500;
      proc_sorting = "memory";
      proc_reversed = false;
      proc_tree = false;
      proc_colors = true;
      proc_gradient = true;
      proc_per_core = true;
      proc_mem_bytes = true;
      proc_cpu_graphs = true;
      proc_info_smaps = false;
      proc_left = false;
      proc_filter_kernel = false;
      proc_aggregate = false;
      keep_dead_proc_usage = false;
      cpu_graph_upper = "Auto";
      cpu_graph_lower = "Auto";
      show_gpu_info = "Auto";
      cpu_invert_lower = true;
      cpu_single_graph = false;
      cpu_bottom = false;
      show_uptime = true;
      show_cpu_watts = true;
      check_temp = true;
      cpu_sensor = "Auto";
      show_coretemp = true;
      cpu_core_map = "";
      temp_scale = "celsius";
      base_10_sizes = false;
      show_cpu_freq = true;
      freq_mode = "first";
      clock_format = "%X";
      background_update = true;
      custom_cpu_name = "";
      disks_filter = "";
      mem_graphs = true;
      mem_below_net = false;
      zfs_arc_cached = true;
      show_swap = true;
      swap_disk = true;
      show_disks = true;
      only_physical = true;
      use_fstab = true;
      zfs_hide_datasets = false;
      disk_free_priv = false;
      show_io_stat = true;
      io_mode = true;
      io_graph_combined = true;
      io_graph_speeds = "";
      net_download = 100;
      net_upload = 100;
      net_auto = true;
      net_sync = true;
      net_iface = "";
      base_10_bitrate = "Auto";
      show_battery = true;
      selected_battery = "Auto";
      show_battery_watts = true;
      log_level = "WARNING";
      save_config_on_exit = true;
      nvml_measure_pcie_speeds = true;
      rsmi_measure_pcie_speeds = true;
      gpu_mirror_graph = true;
      shown_gpus = "nvidia amd intel";
    };
  };
  programs.bash = {
    enable = true;
    shellAliases = {
      btop = "LC_NUMBERIC='en_US.UTF-8' btop";
    };
  };
}
