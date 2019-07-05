#include <ida.hpp>
#include <idp.hpp>
#include <expr.hpp>
#include <bytes.hpp>
#include <loader.hpp>
#include <kernwin.hpp>

/*
	0x0080 00 00 + 1024*1024
	0x810000
67 32 0C

	emuppc(0x0064034, 0x0064054, 0x810000);
	emuppc(0x006A344, 0x006A364, 0x810000);
*/

extern void init_emul_ppc(void);
extern void emul_ppc(uint32 start, uint32 stop, uint32 stack);

static const char emuppc_args[] = { VT_LONG, VT_LONG, VT_LONG, 0 };

static error_t idaapi emuppc_func(idc_value_t *argv, idc_value_t *res)
{
	msg("emuppc: arg0=%x, arg1=%x, arg2=%x\n", argv[0].num, argv[1].num, argv[2].num);

	emul_ppc(argv[0].num, argv[1].num, argv[2].num);

	return eOk;
}

int idaapi init(void)
{
	init_emul_ppc();

	bool res = set_idc_func_ex("emuppc", emuppc_func, emuppc_args, 0);
	msg("init: %d\n", res);

	return PLUGIN_KEEP;
}

void idaapi term(void)
{
	bool res = set_idc_func_ex("emuppc", NULL, NULL, 0);
	msg("term: %d\n", res);
}


void idaapi run(int arg)
{
	msg("run\n");
}

static const char comment[] = "PPC Emulator";

static const char help[] = "";

static const char wanted_name[] = "PPC Emulator";
static const char wanted_hotkey[] = "";


plugin_t PLUGIN =
{
  IDP_INTERFACE_VERSION,
  0,
  init,
  term,
  run,
  comment,
  help,
  wanted_name,
  wanted_hotkey
};
