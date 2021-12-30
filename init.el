;;; Package -- Summary
;;  The simple init file for Emacs 27.2
;;; Commentary:
;;  Verision 0.1

;;; Code:
(defconst hm/default-font-size 142) ;; Set default font size

(set-face-attribute 'default nil :font "Iosevka" :slant 'italic :height hm/default-font-size :weight 'normal)                ;; Set the font face
(set-face-attribute 'fixed-pitch nil :font "Iosevka" :slant 'normal :height hm/default-font-size)                            ;; Set the fixed pitch face
(set-face-attribute 'variable-pitch nil :font "Cantarell" :slant 'normal :height hm/default-font-size :weight 'regular)      ;; Set the variable pitch face


  (if (fboundp 'scroll-bar-mode)
      (when (scroll-bar-mode -1)))
  (if (fboundp 'tool-bar-mode)
      (when (tool-bar-mode -1)))
  (if (fboundp 'tooltip-mode)
      (when (tooltip-mode -1)))
  (if (fboundp 'menu-bar-mode)
      (when (menu-bar-mode t)))


(display-time-mode t)                ;;
(global-hl-line-mode t)              ;; Highlight line on point.
(electric-pair-mode t)               ;; Electric pair mode
(set-fringe-mode -1)                 ;; The vertical buffer
(column-number-mode t)               ;; The column number
(global-display-line-numbers-mode t) ;; The line numbers

(require 'package)
(add-to-list  'package-archives '("gnu"   . "https://elpa.gnu.org/packages/") t)
(add-to-list  'package-archives '("melpa" . "https://melpa.org/packages/") t)
(add-to-list  'package-archives '("org"   . "http://orgmode.org/elpa/") t)
(package-initialize )
(when (not (package-installed-p 'use-package))
  (package-refresh-contents)
  (package-install 'use-package))

(setq-default  display-time-day-and-date t)                     ;; Set date end time
(setq-default  inhibit-splash-screen   t)                       ;; Inhibit splash screen
(setq-default  inhibit-startup-screen  t)                       ;; Inhibit startup screen
(setq-default  ingibit-startup-message t)                       ;; Inhibit startup message
(setq-default  initial-scratch-message ";; Hello world! ")      ;; New scratch message
(setq-default  load-prefer-newer       t)                       ;; Don't use the compiled code if its the older package.
(setq-default  enable-recursive-minibuffers t)                  ;; Allow commands to be run on minibuffers.
(setq-default  ring-bell-function 'ignore)                      ;; Do not ring bell
(setq-default  cua-selection-mode t)                            ;; Delete regions
(setq-default  create-lockfiles nil)                            ;; Do not create lockfiles.
(setq-default  indent-tabs-mode nil)                            ;; Turn off tabs
(setq-default  tab-width          4)                            ;; Replace tabs with 4 spaces
(setq-default  standart-indent    4)                            ;; The stadart indentation 4 spaces

(setq use-dialog-box           nil)
(setq make-backup-files        nil)   ;; Disable backup files
(setq auto-save-default        nil)   ;; Disable autosave files
(setq auto-save-list-file-name nil)



;(setq-default scheme-program-name   "/usr/bin/mit-scheme")     ;; Need to install mit-scheme
;(setq-default scheme-program-name   "/usr/bin/chicken-csi")    ;; Need to install chicken
(setq-default scheme-program-name   "/usr/bin/mzscheme")        ;; Need to install racket


(defun load-config-file (filename)
 "Loader for config files.The FILENAME is name config file."
(if (file-exists-p (expand-file-name filename user-emacs-directory))
  (load-file (expand-file-name filename user-emacs-directory))
  (message "The file %s does not exists" filename)))

(setq custom-file "custom-file.el")

(load-config-file "custom-file.el")
(load-config-file "org-config.el")
;;(load-config-file "exwm-config.el")


;; Load the theme
(add-to-list 'custom-theme-load-path "~/.emacs.d/dark-home-theme.el")
(load-theme 'dark-home t)

;; Set key
(global-set-key (kbd "<escape>")  'keyboard-escape-quit)
(global-set-key (kbd "C-<left>")  'windmove-left)           ;; move to left window
(global-set-key (kbd "C-<right>") 'windmove-right)          ;; move to right window
(global-set-key (kbd "C-<up>")    'windmove-up)             ;; move to upper window
(global-set-key (kbd "C-<down>")  'windmove-down)           ;; move to lower window

;; Delight
(use-package delight
  :ensure t)


;;(use-package modus-themes
;;  :ensure                         ; omit this to use the built-in themes
;;  :init
;;  ;; Add all your customizations prior to loading the themes
;;  (setq modus-themes-italic-constructs t
;;        modus-themes-bold-constructs nil
;;        modus-themes-region '(bg-only no-extend))
;;
;;  ;; Load the theme files before enabling a theme (else you get an error).
;;  (modus-themes-load-themes)
;;  :config
;;  ;; Load the theme of your choice:
;;  (modus-themes-load-operandi) ;; OR (modus-themes-load-vivendi)
;;  :bind ("<f5>" . modus-themes-toggle))




;;;; Switch-window
;;(use-package switch-window
;;  :ensure t
;;  :config
;;  (setq switch-window-input-style 'minibuffer)
;;  (setq switch-window-ancrease 4)
;;  (setq switch-window-threshold 2)
;;  (setq switch-window-shortcut-style 'qwerty)
;;  (setq switch-window-qwerty-shortcuts
;;        '("a" "s" "d" "f" "j" "k" "l"))
;;  :bind
;;  ([remap other-window] . switch-window)
;;  )


;; Buffer moveq
(use-package buffer-move
  :ensure t
  :bind
 ("<C-M-up>"    . 'buf-move-up)
 ("<C-M-down>"  . 'buf-move-down)
 ("<C-M-left>"  . 'buf-move-left)
 ("<C-M-right>" . 'buf-move-right))

;; Poverline
(use-package powerline
  :ensure t
  :config
  (powerline-default-theme))

;; Which-key
(use-package which-key
  :ensure t
  :config
  (which-key-mode))

;; Consuel
(use-package counsel
  :ensure t
  :bind
  ("C-M-j" . counsel-switch-buffer)
  ("C-M-r" . counsel-minibuffer-history)
  :config
  (counsel-mode t)
  :delight)

;; Ivy
(use-package ivy
  :ensure t
  :config
  (ivy-mode t)
  :bind
  ("C-x b" . ivy-switch-buffer)
  ("C-x B" . ivy-switch-buffer-other-window)
  ("C-c C-r" . ivy-resume)
  :delight)

;; Ivy-rich
(use-package ivy-rich
  :ensure t
  :config
  (ivy-rich-mode t))

;; Hydra
(use-package hydra
  :ensure t)

;; Swiper
(use-package swiper
  :ensure t
  :bind
  ("C-s" . swiper))

;; Lsp-mode
(use-package lsp-mode
  :ensure t
  :commands
  (lsp lsp-deferred)
  :init
  (setq lsp-keymap-prefix "C-c l")
  :hook
  (lsp-mode . lsp-enable-which-key-integration ))

(use-package lsp-ui
  :ensure t
  :hook
  (lsp-mode . lsp-ui-mode))

(use-package lsp-ivy
  :commands
  lsp-ivy-workspace-symbol)

;; Company
(use-package company
  :ensure t
;  :after lsp-mode
  :hook
  (lsp-mode . company-mode)
  :config
  (add-hook 'after-init-hook 'global-company-mode)
  (setq company-idle-delay 0.3
      company-selection-wrap-around t
      company-minimum-prefix-length 3 )
  (global-company-mode t)
  :bind
  ("TAB" . company-indent-or-complete-common)
  :delight)

;; Company-box
(use-package company-box
  :ensure t
  :config
  (company-box-mode t)
  :delight)

;; Slime
(use-package slime
  :ensure t
  :defer t
  :init
  ; (setq inferior-lisp-program "/usr/bin/sbcl")     ;; Need to install sbcl
  (setq inferior-lisp-program "/usr/bin/clisp")     ;; Need to install clisp
  :config
    (slime-setup '(slime-fancy slime-company))
  :hook
  (slime-mode . slime-company))

;;Slime company
(use-package slime-company
  :ensure t
  :after slime
  :bind-keymap
    ("C-n" . company-select-next)
    ("C-p" . company-select-previous)
    ("C-d" . company-show-doc-buffer)
    ("M-." . company-show-location)
  :config (setq slime-company-completion 'fuzzy
                slime-company-after-completion 'slime-company-just-one-space))

;; Ido
(use-package ido
  :ensure t
  :config
  (setq ido-enable-prefix nil)
  (setq ido-enable-flex-matching t)
  (setq ido-create-new-buffer 'always)
  (setq ido-use-filename-at-point 'guess)
  (setq ido-max-prospects 10)
  (setq ido-default-file-method 'selected-window)
  (setq ido-auto-merge-work-directories-length -1)
  (ido-mode t)
  :delight)

;; Smex
(use-package smex
  :ensure t
  :config
  (smex-initialize)
  :bind
  ("M-x" . smex)
  ("M-X" . smex-major-mode-commands))

;; Magit
(use-package magit
  :ensure t
  :bind
  ("C-x m" . magit-status))

;; Projectile
(use-package projectile
  :ensure t
  :init
  (when (file-directory-p "~/Projects/Code")
    (setq projectile-project-search-path '("~/Projects/Code")))
  (setq projectile-switch-project-action #'projectile-dired)
  :config
  (projectile-mode t)
  :bind
  ("C-x f" . projectile-find-file)
  :delight)

(defun duplicate-line ()
  "Duplicate current line."
  (interactive)
  (move-beginning-of-line 1)
  (kill-line)
  (yank)
  (newline)
  (yank))
 (global-set-key (kbd "C-,") 'duplicate-line)

;; CC-mode
(use-package cc-mode
  :ensure t
  :config
  (setq-default c-basic-offset 4 c-default-style '((cc-mode ."c") (java-mode . "java") (awk-mode . "awk") (other . "bsd"))))

;; Python
(use-package python
  :ensure t
  :custom
  (python-indent-offset 4))

;; Whitespace
(use-package whitespace
  :ensure t
  :init
  (dolist (hook '(prog-mode-hook text-mode-hook)))
  (add-hook  'before-save-hook #'whitespace-cleanup)
  :config
  (setq whitespace-line-column 80)
  (setq whitespace-style '(;face
                           trailing
                           tabs
                           spaces
                          ;lines
                           newline
                          ; empty
                           space-mark
                           tab-mark
                           newline-mark
                           space-before-tab
                           indentation
                           space-after-tab))
  :bind
  ("C-;" . whitespace-mode))

;; Move Text
(use-package move-text
  :ensure t
  :bind
  ("M-p" . move-text-up)
  ("M-n" . move-text-down))

;; Multiple cursors
(use-package multiple-cursors
  :ensure t
  :config
  (setq mc/always-run-for-all t)
  :bind
  ("C->" . mc/mark-next-like-this)
  ("C-<" . mc/mark-previous-like-this)
  ("C-c a" . mc/mark-all-like-this)
  ("C-c h" . mc-hide-unmatched-lines-mode)
  ("C-c l" . mc/edit-lines))

;; Flycheck
(use-package flycheck
  :ensure t
  :config
  (setq flycheck-indication-mode nil) ;; Do display errors on left fringe.
  (global-flycheck-mode t))

;; Pdf-tools
(use-package pdf-tools
  :doc "Better pdf viewing"
  :disabled t
  :ensure t
  :mode
  ("\\.pdf\\'" . pdf-view-mode)
  :bind
  (:map pdf-view-mode-map
        ("j" . image-next-line)
        ("k" . image-previous-line)))

;; Markdown
(use-package markdown-mode
  :ensure t
  :mode
  (("\\.md\\'" . markdown-mode)
  ("\\.markdown\\'" . markdown-mode)))

;; Define-word
(use-package define-word
  :ensure t
  :bind
  ("C-c w" . define-word-at-point))

(use-package flyspell
 :ensure t
 :bind
 ("M-e " . flyspell-goto-next-error)
 :config
 (flyspell-mode t))

;TODO ispell
;TODOOO   HTML and JS
;TODOOOO  Theme

(provide 'init)
;;; init.el ends here
