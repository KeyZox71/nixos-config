{
  quickMode,
  ...
}:
{
  performance = {
    byteCompileLua.enable = if quickMode then false else true;
    combinePlugins.enable = if quickMode then false else true;
  };
}
