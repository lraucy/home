
setlocal tabstop=4
setlocal softtabstop=4
setlocal shiftwidth=4
setlocal smarttab
setlocal expandtab

set nosmartindent

setlocal makeprg=jslint\ %
setlocal errorformat=%-P%f,
                    \%-G/*jslint\ %.%#*/,
                    \%*[\ ]%n\ %l\\,%c:\ %m,
                    \%-G\ \ \ \ %.%#,
                    \%-GNo\ errors\ found.,
                    \%-Q

