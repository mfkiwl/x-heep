// Copyright lowRISC contributors.
// Licensed under the Apache License, Version 2.0, see LICENSE for details.
// SPDX-License-Identifier: Apache-2.0
//
// xbar_${xbar.name}_sim_cfg.hjson file generated by `tlgen.py` tool
{
  name: ${xbar.name}

  // Top level dut name (sv module).
  dut: xbar_${xbar.name}

  // Testplan hjson file.
  testplan: "{proj_root}/${xbar.ip_path}/data/autogen/{dut}_testplan.hjson"

  // Add xbar_main specific exclusion files.
  vcs_cov_excl_files: ["{proj_root}/hw/top_earlgrey/ip/{dut}/dv/autogen/xbar_cov_excl.el"]

  // replace common cover.cfg with a generated one, which includes xbar toggle exclusions
  overrides: [
    {
      name: default_vcs_cov_cfg_file
      value: "-cm_hier {proj_root}/hw/top_earlgrey/ip/{dut}/dv/autogen/xbar_cover.cfg"
    }
  ]
  // Import additional common sim cfg files.
  import_cfgs: [// xbar common sim cfg file
                "{proj_root}/hw/ip/tlul/generic_dv/xbar_sim_cfg.hjson"]
}