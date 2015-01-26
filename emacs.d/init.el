; Tim Thirion
; init.el
; t.a.thirion@gmail.com
; Started: ca. 2006
; Updated: January 2015


; Requirements
(require 'cl)

; Initialize packages
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize)

; Install required packages, if necessary
(defvar required-packages
  '(ample-theme
    anti-zenburn-theme
    cmake-font-lock
    company
    evil
    glsl-mode
    haskell-mode
    key-chord
    magit
    markdown-mode
    paredit
    rainbow-delimiters
    solarized-theme
    zenburn-theme))

(defun packages-installed-p ()
  (loop for p in required-packages
    when (not (package-installed-p p)) do (return nil)
    finally (return t)))

(unless (packages-installed-p)
  (message "%s" "Refreshing package database ...")
  (package-refresh-contents)
  (message "%s" "Done.")
  (dolist (p required-packages)
    (when (not (package-installed-p p))
      (package-install p))))

; Show whitespace
(require 'whitespace)

; Interactively do stuff
(require 'ido)
(ido-mode t)

; Require keychord
(require 'key-chord)
(key-chord-mode 1)

; Require evil (muahaha)
(setq evil-want-C-u-scroll t)
(require 'evil)
(evil-mode 1)

; Require company
(add-hook 'after-init-hook 'global-company-mode)

; Require paredit
(autoload 'enable-paredit-mode "paredit"
  "Turn on pseudo-structural editing of Lisp code." t)
(add-hook 'emacs-lisp-mode-hook                  #'enable-paredit-mode)
(add-hook 'eval-expression-minibuffer-setup-hook #'enable-paredit-mode)
(add-hook 'ielm-mode-hook                        #'enable-paredit-mode)
(add-hook 'lisp-mode-hook                        #'enable-paredit-mode)
(add-hook 'lisp-interaction-mode-hook            #'enable-paredit-mode)
(add-hook 'scheme-mode-hook                      #'enable-paredit-mode)

; Require rainbow delimiters
(require 'rainbow-delimiters)
(add-hook 'emacs-startup-hook #'rainbow-delimiters-mode)
;(global-rainbow-delimiters-mode)

; Configure everything

(add-to-list 'load-path "~/.emacs.d/config")
(load-library "config-evil")

; Start up

; Inhibit the startup message
(setq inhibit-startup-message t)

; Focus follows mouse
(setq focus-follows-mouse t)

; Set frame alpha
(add-to-list 'default-frame-alist '(alpha 90 75))

; Set the initial frame size (maximized)
(add-to-list 'default-frame-alist '(width . 202))
(add-to-list 'default-frame-alist '(height . 60))

; OR start fullscreen
;(set-frame-parameter nil 'fullscreen 'fullboth)

; Hide the menu, tool, and scroll bars when windowed
(menu-bar-mode -1)
(when (window-system)
  (tool-bar-mode -1)
  (scroll-bar-mode -1))

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
;(load-theme 'wombat t)

; OR choose an installed theme
(load-theme 'ample t)
;(load-theme 'solarized-light t)
;(load-theme 'solarized-dark t)
;(load-theme 'anti-zenburn t)
;(load-theme 'zenburn t)

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
(add-hook 'term-mode-hook '(lambda () (linum-mode 0)))

; Enable column numbers
(column-number-mode 1)

; Disable audible and visual bells
(setq ring-bell-function 'ignore)

; No cursor blinking
(blink-cursor-mode -1)

; Highlight the current line
;(global-hl-line-mode 1)

; Word wrap at column 80 in all modes
(turn-on-auto-fill)
(set-fill-column 80)
;(add-hook 'text-mode-hook 'turn-on-auto-fill)
;(add-hook 'text-mode-hook '(lambda () (set-fill-column 80)))

; Scroll smoothly
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1))
      mouse-wheel-progressive-speed nil
      mouse-wheel-follow-mouse 't
      redisplay-dont-pause t
      scroll-margin 1
      scroll-step 1
      scroll-conservatively 10000
      scroll-preserve-screen-position 1)
