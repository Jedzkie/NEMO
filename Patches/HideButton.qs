//===================================================//
// Patch Functions wrapping over HideButton function //
//===================================================//

function HideNavButton() {
  return HideButton(
    ["navigation_interface\\btn_Navigation", "RO_menu_icon\\navigation"],
    ["\x00", "\x00"]
  );
}

function HideBgButton() {
  return HideButton(
    ["basic_interface\\btn_battle_field", "RO_menu_icon\\battle"],
    ["\x00", "\x00"]
  );
}

function HideBankButton() {
  return HideButton(
    ["basic_interface\\btn_bank", "RO_menu_icon\\bank"],
    ["\x00", "\x00"]
  );
}

function HideBooking() {
  return HideButton(
    ["basic_interface\\booking", "RO_menu_icon\\booking"],
    ["\x00", "\x00"]
  );
}

function HideRodex() {
  return HideButton("RO_menu_icon\\mail", "\x00");
}

function HideAchieve() {
  return HideButton("RO_menu_icon\\achievement", "\x00");
}

//##########################################################
//# Purpose: Find the first match amongst the src prefixes #
//#          and replace it with corresponding tgt prefix  #
//##########################################################

function HideButton(src, tgt) {
  
  //Step 1a - Ensure both are lists/arrays
  if (typeof(src) === "string")
    src = [src];
  
  if (typeof(tgt) === "string")
    tgt = [tgt];
  
  //Step 1b - Loop through and find first match
  var offset = -1;
  for (var i = 0; i < src.length; i++) {
    offset = exe.findString(src[i], RAW, false);
    if (offset !== -1)
      break;
  }
  
  if (offset === -1)
    return "Failed in Step 1";
  
  //Step 2 - Replace with corresponding value in tgt
  exe.replace(offset, tgt[i], PTYPE_STRING);
  
  return true;
}

//========================================================//
// Disable for Unsupported Clients - Check for Button bmp //
//========================================================//

function HideRodex_() {
  return (exe.findString("\xC0\xAF\xC0\xFA\xC0\xCE\xC5\xCD\xC6\xE4\xC0\xCC\xBD\xBA\\basic_interface\\RO_menu_icon\\mail", RAW) !== -1);
}

function HideAchieve_() {
  return (exe.findString("\xC0\xAF\xC0\xFA\xC0\xCE\xC5\xCD\xC6\xE4\xC0\xCC\xBD\xBA\\basic_interface\\RO_menu_icon\\achievement", RAW) !== -1);
}
