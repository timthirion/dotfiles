; Basic options
(setq evil-auto-indent t)
(setq evil-regexp-search t)
(setq evil-want-C-i-jump t)

; The chord 'jk' returns us to normal mode.
(key-chord-define evil-insert-state-map (kbd "jk") 'evil-normal-state)

; Leader and its bindings
(evil-leader/set-leader "<SPC>")
(evil-leader/set-key
  "-" (lambda () (interactive) (split-window-below) (balance-windows))
  "\\" (lambda () (interactive) (split-window-right) (balance-windows))
  "h" 'evil-window-left
  "j" 'evil-window-down
  "k" 'evil-window-up
  "l" 'evil-window-right
  "e" 'find-file
  "x" 'delete-window
  "w" 'save-buffer)

; The cursor reflects our evil mode.
(setq evil-emacs-state-cursor '("red" box))
(setq evil-normal-state-cursor '("green" box))
(setq evil-visual-state-cursor '("orange" box))
(setq evil-insert-state-cursor '("red" bar))
(setq evil-replace-state-cursor '("red" bar))
(setq evil-operator-state-cursor '("red" hollow))

; Disable arrow keys when in normal mode
(define-key evil-normal-state-map (kbd "<left>") nil)
(define-key evil-normal-state-map (kbd "<up>") nil)
(define-key evil-normal-state-map (kbd "<right>") nil)
(define-key evil-normal-state-map (kbd "<down>") nil)

; Disable arrow keys when in insert mode as well
(define-key evil-insert-state-map (kbd "<left>") nil)
(define-key evil-insert-state-map (kbd "<up>") nil)
(define-key evil-insert-state-map (kbd "<right>") nil)
(define-key evil-insert-state-map (kbd "<down>") nil)

; Disable arrow keys when in visual mode as well
(define-key evil-visual-state-map (kbd "<left>") nil)
(define-key evil-visual-state-map (kbd "<up>") nil)
(define-key evil-visual-state-map (kbd "<right>") nil)
(define-key evil-visual-state-map (kbd "<down>") nil)

; H & L to move to the beginning and end of line, respectively
(define-key evil-normal-state-map (kbd "H") 'evil-first-non-blank)
(define-key evil-normal-state-map (kbd "L") 'evil-last-non-blank)
