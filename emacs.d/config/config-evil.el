; Basic options
(setq evil-auto-indent t)
(setq evil-regexp-search t)
(setq evil-want-C-i-jump t)

; The chord 'jk' returns us to normal mode. 
(key-chord-define evil-insert-state-map (kbd "jk") 'evil-normal-state)

; The cursor reflects our evil mode.
(setq evil-emacs-state-cursor '("red" box))
(setq evil-normal-state-cursor '("green" box))
(setq evil-visual-state-cursor '("orange" box))
(setq evil-insert-state-cursor '("red" bar))
(setq evil-replace-state-cursor '("red" bar))
(setq evil-operator-state-cursor '("red" hollow))

; Arrow keys move through frames in normal mode
(define-key evil-normal-state-map (kbd "<left>") 'windmove-left)
(define-key evil-normal-state-map (kbd "<up>") 'windmove-up)
(define-key evil-normal-state-map (kbd "<right>") 'windmove-right)
(define-key evil-normal-state-map (kbd "<down>") 'windmove-down)

; Disable arrow keys when in insert mode
(define-key evil-insert-state-map (kbd "<left>") nil)
(define-key evil-insert-state-map (kbd "<up>") nil)
(define-key evil-insert-state-map (kbd "<right>") nil)
(define-key evil-insert-state-map (kbd "<down>") nil)

; Disable arrow keys when in visual mode as well
(define-key evil-visual-state-map (kbd "<left>") nil)
(define-key evil-visual-state-map (kbd "<up>") nil)
(define-key evil-visual-state-map (kbd "<right>") nil)
(define-key evil-visual-state-map (kbd "<down>") nil)

