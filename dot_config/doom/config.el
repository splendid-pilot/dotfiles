;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-
(setq user-full-name "Theodore Chen"
      user-mail-address "S2817582765@gmail.com")
(setq doom-themes-enable-bold t
      doom-themes-enable-italic t)

(setq doom-theme 'doom-tokyo-night)

(setq display-line-numbers-type 'relative)
(setq doom-font (font-spec :family "JetBrainsMono Nerd Font" :size 18 :weight 'SemiBold))

(setq org-directory "~/Projects/notes")
(setq org-roam-directory "~/Projects/notes/roam")
(setq org-hide-emphasis-markers t)

(use-package! websocket
  :after org-roam)

(use-package! org-roam-ui
  :after org-roam
  :config
  (setq org-roam-ui-sync-theme t
        org-roam-ui-follow t
        org-roam-ui-update-on-save t
        org-roam-ui-open-on-start t))

(use-package! rime
  :custom
  (default-input-method "rime")
  (rime-show-candidate 'posframe)
  :bind
  (:map rime-mode-map
        ("C-`" . 'rime-send-keybinding))
  )

(use-package! chezmoi)

(evil-define-key* '(normal visual) visual-line-mode-map
  (kbd "j") 'evil-next-visual-line
  (kbd "k") 'evil-previous-visual-line
  (kbd "0") 'evil-beginning-of-visual-line
  (kbd "$") 'evil-end-of-visual-line
  (kbd "g0") 'evil-beginning-of-line
  (kbd "g$") 'evil-end-of-line
  (kbd "^") 'evil-first-non-blank-of-visual-line
  )


(after! apheleia
  (add-to-list 'apheleia-mode-alist '(markdown-mode . prettier)))
