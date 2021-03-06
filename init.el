;; ========== Custom ==========
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-term-color-vector
   [unspecified "#2d2a2e" "#ff6188" "#a9dc76" "#ffd866" "#78dce8" "#ab9df2" "#a1efe4" "#fcfcfa"] t)
 '(column-number-mode t)
 '(custom-enabled-themes '(atom-one-dark))
 '(custom-safe-themes
   '("171d1ae90e46978eb9c342be6658d937a83aaa45997b1d7af7657546cae5985b" "6c386d159853b0ee6695b45e64f598ed45bd67c47f671f69100817d7db64724d" "cf922a7a5c514fad79c483048257c5d8f242b21987af0db813d3f0b138dfaf53" "1d5e33500bc9548f800f9e248b57d1b2a9ecde79cb40c0b1398dec51ee820daf" "5b7c31eb904d50c470ce264318f41b3bbc85545e4359e6b7d48ee88a892b1915" "5846b39f2171d620c45ee31409350c1ccaddebd3f88ac19894ae15db9ef23035" default))
 '(fill-column 120)
 '(global-display-fill-column-indicator-mode t)
 '(helm-autoresize-mode t)
 '(package-selected-packages
   '(scroll-restore undo-tree common-lisp-snippets indium eslint-fix tide gtk-variant lsp-mode all-the-icons-ibuffer all-the-icons-dired sly atom-one-dark-theme centaur-tabs which-key lsp-haskell sly-repl-ansi-color geiser-racket geiser paredit helm-projectile projectile rainbow-mode multiple-cursors company-quickhelp yasnippet powerline helm atom-dark-theme all-the-icons nyan-mode highlight-parentheses sly-quicklisp sly-hello-world rainbow-delimiters neotree monokai-pro-theme fill-column-indicator evil company))
 '(safe-local-variable-values
   '((Log . clx\.log)
     (Package . Xlib)
     (Lowercase . Yes)
     (Base . 10)
     (Package . XLIB)
     (Syntax . Common-lisp))))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(rainbow-delimiters-depth-1-face ((t (:foreground "#FF6663"))))
 '(rainbow-delimiters-depth-2-face ((t (:foreground "#FEB144"))))
 '(rainbow-delimiters-depth-3-face ((t (:foreground "#FDFD97"))))
 '(rainbow-delimiters-depth-4-face ((t (:foreground "#9EE09E"))))
 '(rainbow-delimiters-depth-5-face ((t (:foreground "#9EC1CF"))))
 '(rainbow-delimiters-depth-6-face ((t (:foreground "#FF6663"))))
 '(rainbow-delimiters-depth-7-face ((t (:foreground "#FEB144"))))
 '(rainbow-delimiters-depth-8-face ((t (:foreground "#FDFD97"))))
 '(rainbow-delimiters-depth-9-face ((t (:foreground "#9EE09E"))))
 '(rainbow-delimiters-unmatched-face ((t (:foreground "#000000") (:background "#FF6663")))))

(load (expand-file-name "~/.roswell/helper.el"))

;; ========== Settings ==========
(tool-bar-mode 0)
(menu-bar-mode 0)

(cua-mode 1)

(global-company-mode 1)
(company-quickhelp-mode 1)

(global-git-gutter-mode 1)
(set-default 'cursor-type 'bar)

(which-key-mode 1)

(global-prettify-symbols-mode 1)
(global-hl-line-mode 1)

(highlight-parentheses-mode 1)
(show-paren-mode 1)

; (nyan-mode 1)
; (nyan-start-animation)

(global-display-line-numbers-mode 1)

(powerline-default-theme)

(set-frame-font "Cozette 64" nil t)
(scroll-bar-mode 0)

(yas-global-mode 1)

;; ========== Modes ==========
(define-minor-mode my-lisp-repl
  "Overrides arrows in SBCL REPL."
  :lighter " my-repl"
  :keymap (let ((map (make-sparse-keymap)))
	    (define-key map (kbd "<up>") 'sly-mrepl-previous-input-or-button)
	    (define-key map (kbd "<down>") 'sly-mrepl-next-input-or-button)
            map))

;; ========== Hooks ==========
(eval-after-load 'helm
  (lambda ()
    (helm-autoresize-mode 1)
    (set-face-attribute 'helm-source-header nil
                        :background "gray30"
                        :height 90)))

(add-hook 'neo-after-create-hook
	  (lambda (&rest _) (display-line-numbers-mode -1)))

(add-hook 'after-init-hook (lambda ()
			     (setq helm-split-window-in-side-p t)
			     (neotree-dir "~")
			     (neotree-toggle)
			     (setq neo-window-fixed-size nil)

			     (set-face-foreground 'show-paren-match "#000000")
			     (set-face-background 'show-paren-match "#77FF77")

			     (remove-hook 'lisp-mode-hook 'slime-lisp-mode-hook)
			     ;; (add-hook 'prog-mode-hook 'turn-on-fci-hook)
			     ))

(add-hook 'lisp-mode-hook (lambda (&rest _)
			    (enable-paredit-mode)
			    (sly-editing-mode)))

(add-hook 'sly-connected-hook (lambda () (my-lisp-repl) (enable-paredit-mode)))

(add-hook 'window-setup-hook #'gtk-variant-set-frame)

(add-hook 'haskell-mode-hook #'lsp)
(add-hook 'haskell-literate-mode-hook #'lsp)

;; ========== Variables ==========
(setq inferior-lisp-program "ros -Q run")
(setq default-frame-alist
      '((top . 100) (left . 500) (width . 185) (height . 60)))

(setq mouse-wheel-scroll-amount '(2 ((shift) . 4) ((control) . nil)))
(setq mouse-wheel-progressive-speed nil)
;; ;; Requires package 'all-the-icons'
;; ;; (setq neo-theme (if (display-graphic-p) nil))
(setq neo-theme (if (display-graphic-p) 'arrow 'arrow))
(setq neo-window-width 30)

(setq inhibit-startup-message t) ; Disable startup message

(setq frame-title-format
      '(buffer-file-name "%f" ; File buffer
			 (dired-directory
			  dired-directory ; Dired buffer
			  (revert-buffer-function
			   "%b" ; Buffer Menu
			   ("%b - Dir: " default-directory)))))
(setq scroll-conservatively 2)
(setq neo-smart-open t)
(setq js-indent-level 2)
(setq ring-bell-function 'ignore)

(push 'sly-repl-ansi-color sly-contribs)
;; (setq cua-enable-cua-keys nil)

;; ========== My Functions ==========
(defun open-init-file ()
  (interactive)
  (find-file "~/.emacs.d/init.el"))

(defun better-backward-kill-word ()
  (interactive)
  (if (seq-filter (lambda (ext) (cl-search ext (buffer-name))) '(".el" ".lisp" "sly-mrepl for sbcl"))
      (cond ((eq (char-before) #x20) (delete-horizontal-space t)) ; Space
	    ((eq (char-before) #x9) (delete-horizontal-space t)) ; Tab
	    ((eq (char-before) #xa)  (backward-delete-char-untabify 1)) ; New line
	    ((and (eq (char-before)              #x22)    (eq (char-after) #x22))  (paredit-splice-sexp-killing-backward)) ; "" - inside empty string
	    ((and (eq (char-before)              #x28)    (eq (char-after) #x29))  (paredit-splice-sexp-killing-backward)) ; () - inside empty brackets
	    ((and (eq (char-before (1- (point))) #x28)    (eq (char-before) #x29)) (delete-backward-char 2)) ; () - in front of empty brackets
	    (t (paredit-backward-kill-word)))
    (cond ((eq (char-before) #x20) (delete-horizontal-space t)) ; Space
	  ((eq (char-before) #xa)  (backward-delete-char-untabify 1)) ; New line
	  (t (backward-kill-word 1))))); Anything else

(defun ctrl-x ()
  (interactive)
  (if (and (eq (char-before) #xa)
	   (eq (char-after)  #xa)) ;; Return key.
      (backward-delete-char 1)
    (progn
      (move-beginning-of-line 1)
      (kill-line)
      (backward-delete-char 1))))

(defun ctrl-c ()
  (interactive)
  (if (not (region-active-p))
      (let ((curr-pos (point)))
	(move-beginning-of-line 1)
	(kill-line)
	(yank)
	(goto-char curr-pos))))

(defun ctrl-enter ()
  (interactive)
  (move-end-of-line 1)
  (newline))

(defun ctrl-shift-enter ()
  (interactive)
  (move-beginning-of-line 1)
  (newline)
  (backward-char))

(defun multiple-cursors ()
  "It's just an alias. It's easier to remember."
  (interactive)
  (set-rectangular-region-anchor))

;; ========== Bindings ==========
(define-key cua-global-keymap (kbd "<C-return>") 'ctrl-enter)
(define-key cua-global-keymap (kbd "<C-S-return>") 'ctrl-shift-enter)
(global-set-key (kbd "C-S-v") 'helm-show-kill-ring)
(global-set-key (kbd "C-S-x") 'ctrl-x)
(global-set-key (kbd "C-S-c") 'ctrl-c)
(global-set-key (kbd "<M-backspace>") 'better-backward-kill-word)
(global-set-key (kbd "<C-backspace>") 'better-backward-kill-word)
(global-set-key (kbd "C-S-f") 'rgrep)
(define-key key-translation-map (kbd "ESC") (kbd "C-g"))
(global-set-key [f8] 'neotree-toggle)
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "M-b") 'helm-buffers-list)
(global-set-key (kbd "C-s") 'save-buffer)
(global-set-key (kbd "C-f") 'isearch-forward) (define-key isearch-mode-map "\C-f" 'isearch-repeat-forward)
(global-set-key "\t" 'company-indent-or-complete-common)
(global-set-key (kbd "C-/") 'comment-line)
(global-set-key (kbd "C-p") 'helm-projectile)
(global-set-key (kbd "<f9>") 'open-init-file)
;; (centaur-tabs-mode 1)
(global-set-key (kbd "<C-tab>") 'centaur-tabs-forward)
(global-set-key (kbd "<C-iso-lefttab>") 'centaur-tabs-backward)
(global-set-key (kbd "C-t") 'centaur-tabs--create-new-tab)
(global-set-key (kbd "C-w") 'kill-this-buffer)

(global-set-key (kbd "C-;") 'other-window)
(global-set-key (kbd "C-'") 'delete-other-windows)

(global-set-key [mouse-1] 'push-button) ; Left clicking on buttons in SLY debugger.

;; ========== Melpa ==========

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)

(package-initialize)
