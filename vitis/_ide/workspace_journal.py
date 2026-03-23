# 2026-03-23T12:54:20.064599400
import vitis

client = vitis.create_client()
client.set_workspace(path="vitis")

platform = client.create_platform_component(name = "npu_kv260_platform",hw_design = "$COMPONENT_LOCATION/../../matmul_accelerator/system_wrapper.xsa",os = "standalone",cpu = "psu_cortexa53_0",domain_name = "standalone_psu_cortexa53_0",architecture = "64-bit",compiler = "gcc")

platform = client.get_component(name="npu_kv260_platform")
status = platform.build()

comp = client.create_app_component(name="npu_test_app",platform = "$COMPONENT_LOCATION/../npu_kv260_platform/export/npu_kv260_platform/npu_kv260_platform.xpfm",domain = "standalone_psu_cortexa53_0")

comp = client.get_component(name="npu_test_app")
comp.build()

comp.build()

vitis.dispose()

