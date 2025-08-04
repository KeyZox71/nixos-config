{
  liteMode,
  pkgs,
  ...
}:
{
  enable = if liteMode == true then false else true;
}
