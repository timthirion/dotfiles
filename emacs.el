; Tim Thirion
; t.a.thirion@gmail.com
; Started: ca. 2006

;
; Required packages
;
(require 'cl)

; Initialize packages
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/"))
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
    hemisu-theme
    key-chord
    magit
    markdown-mode
    noctilux-theme
    paredit
    rainbow-blocks
    rainbow-delimiters
    rainbow-identifiers
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
(add-hook 'term-mode-hook (lambda () (turn-off-evil-mode)))

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

; Require the various rainbow modes
(require 'rainbow-blocks)
(require 'rainbow-delimiters)
(require 'rainbow-identifiers)

; Configure evil in a separate file
(add-to-list 'load-path "~/.emacs.d/config")
(load-library "config-evil")

;
; General preferences
;
(fset 'yes-or-no-p 'y-or-n-p)

(setq auto-save-default t
      auto-save-interval 50
      auto-save-timeout 5
      backup-directory-alist '(( "." . "~/.emacs-backups"))
      delete-auto-save-files t
      focus-follows-mouse t
      initial-scratch-message nil
      inhibit-startup-message t
      linum-format "%4d"
      make-backup-files nil
      ring-bell-function 'ignore
      show-paren-delay 0
      standard-indent 2
      system-uses-terminfo nil
      tab-always-indent 'complete)

(setq-default indent-tabs-mode nil)

; Always scroll smoothly
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1))
      mouse-wheel-progressive-speed nil
      mouse-wheel-follow-mouse 't
      redisplay-dont-pause t
      scroll-margin 1
      scroll-step 1
      scroll-conservatively 10000
      scroll-preserve-screen-position 1)

; More general preferences
(blink-cursor-mode -1)
(column-number-mode 1)
(global-font-lock-mode t)
(global-linum-mode t)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(show-paren-mode 0)
(tool-bar-mode -1)
(turn-on-auto-fill)
(set-fill-column 80)

; Set frame alpha
(add-to-list 'default-frame-alist '(alpha 90 90))

; Set the initial frame size (maximized)
(add-to-list 'default-frame-alist '(width . 202))
(add-to-list 'default-frame-alist '(height . 60))

; OR start fullscreen
;(set-frame-parameter nil 'fullscreen 'fullboth)

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
;(load-theme 'ample t)
;(load-theme 'hemisu-light t)
;(load-theme 'hemisu-dark t)
(load-theme 'noctilux t)
;(load-theme 'solarized-light t)
;(load-theme 'solarized-dark t)
;(load-theme 'anti-zenburn t)
;(load-theme 'zenburn t)

;
; Hooks
;

; On save
(add-hook 'before-save-hook 'delete-trailing-whitespace)

; ELisp mode
(add-hook 'emacs-lisp-mode-hook
	  (lambda ()
	    (rainbow-delimiters-mode)))


; Term mode

(evil-set-initial-state 'term-mode 'emacs)

; No line numbers
(add-hook 'term-mode-hook
	  (lambda ()
	    (linum-mode 0)))

; After 'exit' in ansi-term, kill the buffer
(defadvice term-sentinel (around my-advice-term-sentinel (proc msg))
  (if (memq (process-status proc) '(signal exit))
      (let ((buffer (process-buffer proc)))
	ad-do-it
	(kill-buffer buffer))
    ad-do-it))
(ad-activate 'term-sentinel)

; Stop asking me which shell to use
(defvar my-term-shell "/usr/local/bin/fish")
(defadvice ansi-term (before force-bash)
  (interactive (list my-term-shell)))
(ad-activate 'ansi-term)

; Use UTF-8
(defun my-term-use-utf8 ()
  (set-buffer-process-coding-system 'utf-8-unix 'utf-8-unix))
(add-hook 'term-exec-hook 'my-term-use-utf8)

; Make URLs clickable
(add-hook 'term-mode-hook '(lambda () (goto-address-mode)))
