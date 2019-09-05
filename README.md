# emuppc for ida pro

PowerPC emulator for unpack into IDAPro some PowerPC binary

1) load plugin into ida
2) make stack segment as less 1Mb into IDA on loaded ppc binary
3) run into idc console emuppc(start addr, end addr, stack addr)
  example
  >emuppc(0x006A344, 0x006A364, 0x810000);

discontinue since 27.07.15