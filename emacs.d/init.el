;; Tim Thirion
;; .emacs
;; Last Updated: 11/10/2014

; Requirements

; Require keychord
(add-to-list 'load-path "~/.emacs.d/key-chord")
(require 'key-chord)
(key-chord-mode 1)

; Require evil (muahaha)
(add-to-list 'load-path "~/.emacs.d/evil")
(require 'evil)
(evil-mode 1)

; Configure everything
(add-to-list 'load-path "~/.emacs.d/config")
(load-library "config-evil")


; Start up

; Inhibit the startup message
(setq inhibit-startup-message t)

; Set the initial frame size
(add-to-list 'default-frame-alist '(width . 202))
(add-to-list 'default-frame-alist '(height . 60))

; Hide the tool bar
(tool-bar-mode -1)

; Hide the scroll bar
(scroll-bar-mode -1)

; Choose among the built-in themes (pick one)
;(load-theme 'adwaita t)
;(load-theme 'deeper-blue t)
;(load-theme 'dichromacy t)
;(load-theme 'leuven t)
;(load-theme 'light-blue t)
;(load-theme 'manoj-dark t)
;(load-theme 'misterioso t)
;(load-theme 'tango-dark t)
;(load-theme 'tango t)
;(load-theme 'tsdh-dark t)
;(load-theme 'tsdh-light t)
;(load-theme 'wheatgrass t)
;(load-theme 'whiteboard t)
(load-theme 'wombat t)


; Text editing

; Enable syntax highlighting
(global-font-lock-mode t)

; Set the standard indent to 2 instead of 4
(setq standard-indent 2)

; Suppress backup files
(setq make-backup-files nil)

; Enable line numbers
(global-linum-mode t)
(setq linum-format "%d ")

; Disable audible and visual bells
(setq ring-bell-function 'ignore)
