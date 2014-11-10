; The chord 'jk' returns us to normal mode. 
(key-chord-define evil-insert-state-map (kbd "jk") 'evil-normal-state)

; The cursor reflects our evil mode.
(setq evil-emacs-state-cursor '("red" box))
(setq evil-normal-state-cursor '("green" box))
(setq evil-visual-state-cursor '("orange" box))
(setq evil-insert-state-cursor '("red" bar))
(setq evil-replace-state-cursor '("red" bar))
(setq evil-operator-state-cursor '("red" hollow))

; Disable arrow keys
(global-unset-key (kbd "<left>"))
(global-unset-key (kbd "<up>"))
(global-unset-key (kbd "<right>"))
(global-unset-key (kbd "<down>"))
