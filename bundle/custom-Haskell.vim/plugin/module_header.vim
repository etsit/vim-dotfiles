"keymapping --h will generate the something like:
"--------------------------------------------------------------------------------
"-- | 
"-- Module      : MyModule
"-- Note        : This is a preview
"-- 
"-- This is an empty module, to show the headercomment produced. 
"-- 
"--------------------------------------------------------------------------------

let s:width = 80

function! HaskellModuleHeader(...)
    let name = 0 < a:0 ? a:1 : inputdialog("Module: ")
    let note = 1 < a:0 ? a:2 : inputdialog("Note: ")
    let description = 2 < a:0 ? a:3 : inputdialog("Describe this module: ")
    
    return  repeat('-', s:width) . "\n" 
    \       . "-- | \n" 
    \       . "-- Module      : " . name . "\n"
    \       . "-- Note        : " . note . "\n"
    \       . "-- \n"
    \       . "-- " . description . "\n"
    \       . "-- \n"
    \       . repeat('-', s:width) . "\n"
    \       . "\n"

endfunction

nmap <silent> --h "=HaskellModuleHeader()<CR>:0put =<CR>
