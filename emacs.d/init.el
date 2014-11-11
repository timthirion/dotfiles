; Tim Thirion
; init.el
; t.a.thirion@gmail.com
; Started: ca. 2006
; Updated: November 2014


; Requirements

; Initialize packages
(require 'package)
(add-to-list 'package-archives
	     '("marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize)

; Show whitespace
(require 'whitespace)

; Interactively do stuff
(require 'ido)
(ido-mode t)

; Require keychord
(add-to-list 'load-path "~/.emacs.d/key-chord")
(require 'key-chord)
(key-chord-mode 1)

; Require evil (muahaha)
(add-to-list 'load-path "~/.emacs.d/evil")
(require 'evil)
(evil-mode 1)

; Require company
;(add-to-list 'load-path "~/.emacs.d/elpa/company-0.8.7")
;(autoload 'company-mode "company" nil t)

; Configure everything
(add-to-list 'load-path "~/.emacs.d/config")
(load-library "config-evil")

; Start up

; Inhibit the startup message
(setq inhibit-startup-message t)

; Set the initial frame size
;(add-to-list 'default-frame-alist '(width . 202))
;(add-to-list 'default-frame-alist '(height . 60))

; OR start maximized
(set-frame-parameter nil 'fullscreen 'fullboth)

; Hide the menu, tool, and scroll bars
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

; Choose among the built-in themes (pick one)
(load-theme 'adwaita t)
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
;(load-theme 'wombat t)


; Text editing

; Enable syntax highlighting
(global-font-lock-mode t)

; Set the standard indent to 2 instead of 4
(setq standard-indent 2)

; Suppress backup files
(setq make-backup-files nil)

; Enable line numbers (4 digits, justify right)
(global-linum-mode t)
(custom-set-variables '(linum-format (quote "%4d")))

; Disable audible and visual bells
(setq ring-bell-function 'ignore)

; Scroll smoothly
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1))
      mouse-wheel-progressive-speed nil
      mouse-wheel-follow-mouse 't
      redisplay-dont-pause t
      scroll-margin 1
      scroll-step 1
      scroll-conservatively 10000
      scroll-preserve-screen-position 1)
