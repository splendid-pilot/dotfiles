;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-
(setq user-full-name "Theodore Chen"
      user-mail-address "S2817582765@gmail.com")
(setq doom-themes-enable-bold t
      doom-themes-enable-italic t)

(defun set-theme-based-on-gnome-color-scheme ()
  "Set Doom Emacs theme based on GNOME color scheme."
  (let ((color-scheme (string-trim (shell-command-to-string "gsettings get org.gnome.desktop.interface color-scheme"))))
    (cond
     ((string= color-scheme "'default'")
      (setq doom-theme 'doom-ayu-light))
     ((string= color-scheme "'prefer-dark'")
      (setq doom-theme 'doom-tokyo-night)))))
(set-theme-based-on-gnome-color-scheme)
(load-theme doom-theme t)

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

(evil-define-key* 'normal global-map
  (kbd "<SPC>wmf") 'toggle-frame-maximized)

(after! apheleia
  (dolist (mode '(python-mode python-ts-mode))
    (setf (alist-get mode apheleia-mode-alist) '(ruff-isort ruff)))

  (add-to-list 'apheleia-mode-alist '(markdown-mode . prettier)))

(add-hook 'python-mode-hook #'flymake-ruff-load)

(setq lsp-inlay-hint-enable t)
(after! lsp-mode
  (setq lsp-ruff-lsp-server-command '("ruff" "server")))

;; (use-package! org-modern
;;   :config
;;   (setq
;;    org-auto-align-tags t
;;    org-tags-column 0
;;    org-fold-catch-invisible-edits 'show-and-error
;;    org-special-ctrl-a/e t
;;    org-insert-heading-respect-content t

;;    ;; Don't style the following
;;    org-modern-tag nil
;;    org-modern-priority nil
;;    org-modern-todo nil
;;    org-modern-table nil

;;    ;; Agenda styling
;;    org-agenda-tags-column 0
;;    org-agenda-block-separator ?─
;;    org-agenda-time-grid
;;    '((daily today require-timed)
;;      (800 1000 1200 1400 1600 1800 2000)
;;      " ┄┄┄┄┄ " "┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄")
;;    org-agenda-current-time-string
;;    "⭠ now ─────────────────────────────────────────────────")

;;   (global-org-modern-mode))

;; (use-package! org-superstar
;;   :config
;;   (setq org-superstar-leading-bullet " ")
;;   (setq org-superstar-special-todo-items t) ;; Makes TODO header bullets into boxes
;;   (setq org-superstar-todo-bullet-alist '(("TODO" . 9744)
;;                                           ("DONE" . 9744)
;;                                           ("READ" . 9744)
;;                                           ("IDEA" . 9744)
;;                                           ("WAITING" . 9744)
;;                                           ("CANCELLED" . 9744)
;;                                           ("PROJECT" . 9744)
;;                                           ("POSTPONED" . 9744)))
;;   )

;; (setq org-lowest-priority ?F)  ;; Gives us priorities A through F
;; (setq org-default-priority ?E) ;; If an item has no priority, it is considered [#E].

;; (setq org-priority-faces
;;       '((65 . "#BF616A")
;;         (66 . "#EBCB8B")
;;         (67 . "#B48EAD")
;;         (68 . "#81A1C1")
;;         (69 . "#5E81AC")
;;         (70 . "#4C566A")))

;; (setq org-todo-keywords
;;       '((sequence
;;          "TODO" "PROJ" "READ" "CHECK" "IDEA" ; Needs further action
;;          "|"
;;          "DONE")))                           ; Needs no action currently
;; (setq org-todo-keyword-faces
;;       '(("TODO"      :inherit (org-todo region) :foreground "#A3BE8C" :weight bold)
;;         ("PROJ"      :inherit (org-todo region) :foreground "#88C0D0" :weight bold)
;;         ("READ"      :inherit (org-todo region) :foreground "#8FBCBB" :weight bold)
;;         ("CHECK"     :inherit (org-todo region) :foreground "#81A1C1" :weight bold)
;;         ("IDEA"      :inherit (org-todo region) :foreground "#EBCB8B" :weight bold)
;;         ("DONE"      :inherit (org-todo region) :foreground "#30343d" :weight bold)))
;;
(use-package! colorful-mode
  :ensure t ; Optional
  :config
  (global-colorful-mode)
  )
;; (defconst date-re "[0-9]\\{4\\}-[0-9]\\{2\\}-[0-9]\\{2\\}")
;; (defconst time-re "[0-9]\\{2\\}:[0-9]\\{2\\}")
;; (defconst day-re "[A-Za-z]\\{3\\}")
;; (defconst day-time-re (format "\\(%s\\)? ?\\(%s\\)?" day-re time-re))

;; (defun svg-progress-percent (value)
;;   (save-match-data
;;     (svg-image (svg-lib-concat
;;                 (svg-lib-progress-bar  (/ (string-to-number value) 100.0)
;;                                        nil :margin 0 :stroke 2 :radius 3 :padding 2 :width 11)
;;                 (svg-lib-tag (concat value "%")
;;                              nil :stroke 0 :margin 0)) :ascent 'center)))

;; (defun svg-progress-count (value)
;;   (save-match-data
;;     (let* ((seq (split-string value "/"))
;;            (count (if (stringp (car seq))
;;                       (float (string-to-number (car seq)))
;;                     0))
;;            (total (if (stringp (cadr seq))
;;                       (float (string-to-number (cadr seq)))
;;                     1000)))
;;       (svg-image (svg-lib-concat
;;                   (svg-lib-progress-bar (/ count total) nil
;;                                         :margin 0 :stroke 2 :radius 3 :padding 2 :width 11)
;;                   (svg-lib-tag value nil
;;                                :stroke 0 :margin 0)) :ascent 'center))))

;; (setq svg-tag-tags
;;       `(
;;         ;; Org tags
;;         (":\\([A-Za-z0-9]+\\)" . ((lambda (tag) (svg-tag-make tag))))
;;         (":\\([A-Za-z0-9]+[ \-]\\)" . ((lambda (tag) tag)))

;;         ;; Task priority
;;         ("\\[#[A-Z]\\]" . ( (lambda (tag)
;;                               (svg-tag-make tag :face 'org-priority
;;                                             :beg 2 :end -1 :margin 0))))

;;         ;; TODO / DONE
;;         ("TODO" . ((lambda (tag) (svg-tag-make "TODO" :face 'org-todo :inverse t :margin 0))))
;;         ("DONE" . ((lambda (tag) (svg-tag-make "DONE" :face 'org-done :margin 0))))


;;         ;; Citation of the form [cite:@Knuth:1984]
;;         ("\\(\\[cite:@[A-Za-z]+:\\)" . ((lambda (tag)
;;                                           (svg-tag-make tag
;;                                                         :inverse t
;;                                                         :beg 7 :end -1
;;                                                         :crop-right t))))
;;         ("\\[cite:@[A-Za-z]+:\\([0-9]+\\]\\)" . ((lambda (tag)
;;                                                    (svg-tag-make tag
;;                                                                  :end -1
;;                                                                  :crop-left t))))


;;         ;; Active date (with or without day name, with or without time)
;;         (,(format "\\(<%s>\\)" date-re) .
;;          ((lambda (tag)
;;             (svg-tag-make tag :beg 1 :end -1 :margin 0))))
;;         (,(format "\\(<%s \\)%s>" date-re day-time-re) .
;;          ((lambda (tag)
;;             (svg-tag-make tag :beg 1 :inverse nil :crop-right t :margin 0))))
;;         (,(format "<%s \\(%s>\\)" date-re day-time-re) .
;;          ((lambda (tag)
;;             (svg-tag-make tag :end -1 :inverse t :crop-left t :margin 0))))

;;         ;; Inactive date  (with or without day name, with or without time)
;;         (,(format "\\(\\[%s\\]\\)" date-re) .
;;          ((lambda (tag)
;;             (svg-tag-make tag :beg 1 :end -1 :margin 0 :face 'org-date))))
;;         (,(format "\\(\\[%s \\)%s\\]" date-re day-time-re) .
;;          ((lambda (tag)
;;             (svg-tag-make tag :beg 1 :inverse nil :crop-right t :margin 0 :face 'org-date))))
;;         (,(format "\\[%s \\(%s\\]\\)" date-re day-time-re) .
;;          ((lambda (tag)
;;             (svg-tag-make tag :end -1 :inverse t :crop-left t :margin 0 :face 'org-date))))

;;         ;; ;; Progress
;;         ("\\(\\[[0-9]\\{1,3\\}%\\]\\)" . ((lambda (tag)
;;                                             (svg-progress-percent (substring tag 1 -2)))))
;;         ("\\(\\[[0-9]+/[0-9]+\\]\\)" . ((lambda (tag)
;;                                           (svg-progress-count (substring tag 1 -1)))))
;;         ))

;; (use-package! svg-tag-mode
;;   :hook org
;;   )
