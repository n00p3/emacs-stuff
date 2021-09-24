(tool-bar-mode 0)
(menu-bar-mode 0)

(setq default-frame-alist
      '((top . 100) (left . 500) (width . 185) (height . 60)))

(setq mouse-wheel-scroll-amount '(2 ((shift) . 4) ((control) . nil)))
(setq mouse-wheel-progressive-speed nil)
(cua-mode 1)

(global-company-mode 1)
(company-quickhelp-mode 1)

(global-git-gutter-mode 1)

(defun turn-on-fci-hook ()
  (set-fill-column 120)
  (turn-on-fci-mode))

(add-hook 'prog-mode-hook 'turn-on-fci-hook)
(add-hook 'lisp-mode-hook 'enable-paredit-mode)

;;(setq tab-always-indent 'complete)

(set-default 'cursor-type 'bar)

(add-hook 'neo-after-create-hook
	  (lambda (&rest _) (display-line-numbers-mode -1)))

;; ;; Requires package 'all-the-icons'
;; ;; (setq neo-theme (if (display-graphic-p) nil))
(setq neo-theme (if (display-graphic-p) 'icons 'arrow))
(setq neo-window-width 30)

(setq inhibit-startup-message t) ; Disable startup message

(add-hook 'after-init-hook (lambda ()
			     (setq helm-split-window-in-side-p t)
			     (neotree-dir "~")
			     (setq neo-window-fixed-size nil)))

(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)
(rainbow-mode 1)
(global-prettify-symbols-mode 1)
(global-hl-line-mode 1)

(highlight-parentheses-mode 1)
(show-paren-mode 1)
;; (nyan-mode 1)
;; (nyan-start-animation)

(setq scroll-conservatively 2)

(global-display-line-numbers-mode 1)

;; (toggle-scroll-bar -1)

(setq neo-smart-open t)

(eval-after-load 'helm
  (lambda ()
    (helm-autoresize-mode 1)
    (set-face-attribute 'helm-source-header nil
                        :background "gray30"
                        :height 90)))


(setq ring-bell-function 'ignore) 
(powerline-default-theme)
;; Key bindings
(define-key key-translation-map (kbd "ESC") (kbd "C-g"))
(global-set-key [f8] 'neotree-toggle)
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "M-b") 'helm-buffers-list)
(global-set-key (kbd "C-s") 'save-buffer)
(global-set-key (kbd "C-f") 'isearch-forward) (define-key isearch-mode-map "\C-f" 'isearch-repeat-forward)
(global-set-key "\t" 'company-indent-or-complete-common)
(global-set-key (kbd "C-/") 'comment-line)
(global-set-key (kbd "C-p") 'helm-projectile)

(defun multiple-cursors ()
  "It's just an alias. It's easier to remember."
  (interactive)
  (set-rectangular-region-anchor))

(remove-hook 'lisp-mode-hook 'slime-lisp-mode-hook)

(define-minor-mode my-lisp-repl
  "Overrides arrows in SBCL REPL."
  :lighter " my-repl"
  :keymap (let ((map (make-sparse-keymap)))
	    (define-key map (kbd "<up>") 'sly-mrepl-previous-input-or-button)
	    (define-key map (kbd "<down>") 'sly-mrepl-next-input-or-button)
            map))

(add-hook 'sly-connected-hook (lambda () (my-lisp-repl) (enable-paredit-mode)))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-term-color-vector
   [unspecified "#2d2a2e" "#ff6188" "#a9dc76" "#ffd866" "#78dce8" "#ab9df2" "#a1efe4" "#fcfcfa"])
 '(column-number-mode t)
 '(custom-enabled-themes '(doom-one))
 '(custom-safe-themes
   '("6c386d159853b0ee6695b45e64f598ed45bd67c47f671f69100817d7db64724d" "cf922a7a5c514fad79c483048257c5d8f242b21987af0db813d3f0b138dfaf53" "1d5e33500bc9548f800f9e248b57d1b2a9ecde79cb40c0b1398dec51ee820daf" "5b7c31eb904d50c470ce264318f41b3bbc85545e4359e6b7d48ee88a892b1915" "5846b39f2171d620c45ee31409350c1ccaddebd3f88ac19894ae15db9ef23035" default))
 '(global-display-fill-column-indicator-mode t)
 '(helm-autoresize-mode t)
 '(package-selected-packages
   '(good-scroll lsp-haskell doom-themes smooth-scrolling sly-repl-ansi-color geiser-racket geiser paredit helm-projectile projectile sublimity minimap rainbow-mode multiple-cursors company-quickhelp yasnippet powerline helm swiper ivy atom-dark-theme all-the-icons nyan-mode yascroll highlight-parentheses sly-quicklisp sly-hello-world rainbow-delimiters neotree monokai-pro-theme fill-column-indicator evil company))
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
 '(rainbow-delimiters-unmatched-face ((t (:background "#FF6663")))))

(centaur-tabs-mode 1)
(global-set-key (kbd "<C-tab>") 'centaur-tabs-forward)
(global-set-key (kbd "<C-iso-lefttab>") 'centaur-tabs-backward)
(global-set-key (kbd "C-t") 'centaur-tabs--create-new-tab)
(global-set-key (kbd "C-w") 'kill-this-buffer)

(global-set-key (kbd "C-;") 'other-window)
(global-set-key (kbd "C-'") 'delete-other-windows) 

(load (expand-file-name "~/.roswell/helper.el"))
(setq inferior-lisp-program "ros -Q run")

(defun open-init-file ()
  (interactive)
  (find-file "~/.emacs.d/init.el"))

(defun better-backward-kill-word ()
  (interactive)
  (if (seq-filter (lambda (ext) (cl-search ext (buffer-name))) '(".el" ".lisp" "sly-mrepl for sbcl"))
      (cond ((eq (char-before) #x20) (delete-horizontal-space t)) ; Space
	    ((eq (char-before) #x9) (delete-horizontal-space t)) ; Tab
	    ((eq (char-before) #xa)  (backward-delete-char-untabify 1)) ; New line
	    ((and (eq (char-before)               #x22)   (eq (char-after) #x22)) (paredit-splice-sexp-killing-backward)) ; "" - inside empty string
	    ((and (eq (char-before)               #x28)   (eq (char-after) #x29)) (paredit-splice-sexp-killing-backward)) ; () - inside empty brackets
	    ((and (eq (char-before (1- (point))) #x28)    (eq (char-after) #x29)) (delete-backward-char 2)) ; () - in front of empty brackets
	    (t (paredit-backward-kill-word)))
    (cond ((eq (char-before) #x20) (delete-horizontal-space t)) ; Space
	  ((eq (char-before) #xa)  (backward-delete-char-untabify 1)) ; New line
	  (t (backward-kill-word 1))))); Anything else

(global-set-key (kbd "<M-backspace>") 'better-backward-kill-word)
(global-set-key (kbd "<C-backspace>") 'better-backward-kill-word)

(push 'sly-repl-ansi-color sly-contribs)

(add-hook 'haskell-mode-hook #'lsp)
(add-hook 'haskell-literate-mode-hook #'lsp)

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)

(package-initialize)
