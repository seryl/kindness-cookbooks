; Generated by Chef for <%= node[:fqdn] %>
; Local modifications will be overwritten.

(vendor 'lua-mode)
(autoload 'lua-mode "lua-mode.el"
  "Major mode for editing Lua files" t)

(setq auto-mode-alist (cons '("\\.lua$" . lua-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("rockspec" . lua-mode) auto-mode-alist))
(setq interpreter-mode-alist (cons '("lua" . lua-mode) interpreter-mode-alist))

(add-hook 'lua-mode-hook
          (lambda ()
            (add-hook 'local-write-file-hooks
                      '(lambda()
                         (save-excursion
                           (untabify (point-min) (point-max))
                           (delete-trailing-whitespace)
                           )))
            (set (make-local-variable 'indent-tabs-mode) 'nil)
            (set (make-local-variable 'tab-width) 2)))
