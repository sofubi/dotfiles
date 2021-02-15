function! crystalline#theme#forest_night#set_theme() abort
  call crystalline#generate_theme({
        \ 'NormalMode': [[235, 142], ['#323d43', '#a7c080']],
        \ 'InsertMode': [[235, 223], ['#323d43', '#d8caac']],
        \ 'VisualMode': [[235, 167], ['#323d43', '#e68183']],
        \ 'ReplaceMode': [[235, 208], ['#323d43', '#e39b7b']],
        \ '': [[247, 238], ['#999f93', '#505a60']],
        \ 'Inactive': [[245, 236], ['#868d80', '#3c474d']],
        \ 'Fill': [[245, 236], ['#868d80', '#3c474d']],
        \ 'Tab': [[245, 236], ['#868d80', '#3c474d']],
        \ 'TabType': [[235, 208], ['#323d43', '#e39b7b']],
        \ 'TabSel': [[235, 142], ['#323d43', '#a7c080']],
        \ 'TabFill': [[245, 236], ['#868d80', '#3c474d']],
        \ })
endfunction
