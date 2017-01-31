;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Configuration Layers declaration.
You should not put any user code in this function besides modifying the variable
values."
  (setq-default
   ;; Base distribution to use. This isd
   ;; of a list then all discovered layers will be installed.
   dotspacemacs-configuration-layers
   '(
     sql
     fasd
     javascript
     racket
     html
     python
     (auto-completion :variables
                      auto-completion-enable-help-tooltip t)
     better-defaults
     (colors :variables
             colors-enable-nyan-cat-progress-bar (display-graphic-p))
     (c-c++ :variables c-c++-default-mode-for-headers 'c++-mode) 
     (chinese :variables
              chinese-enable-youdao-dict t)
     chinese
     emacs-lisp
     git
     github
     graphviz
     ibuffer
     imenu-list
     latex
     markdown
     org
     plantuml
     (ranger :variables
             ranger-show-preview t)
     (shell :variables
            shell-default-height 30
            shell-default-position 'bottom)
     shell-scripts
     smex
     (spell-checking :variables
                     ispell-dictionary "english")
     syntax-checking
     journal
     (ycmd :variables
           ycmd-server-command '("python" "/home/robin/github/ycmd/ycmd/")
           ycmd-global-config "/home/robin/github/dotfiles/utils/global_config.py"
           ycmd-force-semantic-completion t)
     )
   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   dotspacemacs-additional-packages '()
   ;; A list of packages and/or extensions that will not be install and loaded.
   dotspacemacs-excluded-packages '()
   ;; If non-nil spacemacs will delete any orphan packages, i.e. packages that
   ;; are declared in a layer which is not a member of
   ;; the list `dotspacemacs-configuration-layers'. (default t)
   dotspacemacs-delete-orphan-packages nil))

(defun dotspacemacs/init ()
  "Initialization function.
This function is called at the very startup of Spacemacs initialization
before layers configuration.
You should not put any user code in there besides modifying the variable
values."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; If non nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https t
   ;; Maximum allowed time in seconds to contact an ELPA repository.
   dotspacemacs-elpa-timeout 5
   ;; If non nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. (default t)
   dotspacemacs-check-for-update t
   ;; One of `vim', `emacs' or `hybrid'. Evil is always enabled but if the
   ;; variable is `emacs' then the `holy-mode' is enabled at startup. `hybrid'
   ;; uses emacs key bindings for vim's insert mode, but otherwise leaves evil
   ;; unchanged. (default 'vim)
   dotspacemacs-editing-style 'vim
   ;; If non nil output loading progress in `*Messages*' buffer. (default nil)
   dotspacemacs-verbose-loading nil
   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner 'random
   ;; List of items to show in the startup buffer. If nil it is disabled.
   ;; Possible values are: `recents' `bookmarks' `projects'.
   ;; (default '(recents projects))
   dotspacemacs-startup-lists '(recents projects)
   ;; Number of recent files to show in the startup buffer. Ignored if
   ;; `dotspacemacs-startup-lists' doesn't include `recents'. (default 5) dotspacemacs-startup-recent-list-size 5
   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(
                         spacemacs-dark
                         niflheim
                         spacemacs-light
                         deeper-blue
                         )
   ;; If non nil the cursor color matches the state color in GUI Emacs.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font. `powerline-scale' allows to quickly tweak the mode-line
   ;; size to make separators look not too crappy.
   dotspacemacs-default-font '("Source Code Pro"
                               :size 18
                               :weight normal
                               :width normal
                               :powerline-scale 1.1)
   ;; The leader key
   dotspacemacs-leader-key "SPC"
   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"
   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-emacs-command-key "SPC"
   dotspacemacs-major-mode-leader-key ","
   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m)
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs C-i, TAB and C-m, RET.
   ;; Setting it to a non-nil value, allows for separate commands under <C-i>
   ;; and TAB or <C-m> and RET.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab nil
   ;; (Not implemented) dotspacemacs-distinguish-gui-ret nil
   ;; The command key used for Evil commands (ex-commands) and
   ;; Emacs commands (M-x).
   ;; By default the command key is `:' so ex-commands are executed like in Vim
   ;; with `:' and Emacs commands are executed with `<leader> :'.
   ;; dotspacemacs-command-key ":"
   ;; If non nil `Y' is remapped to `y$'. (default t)
   dotspacemacs-remap-Y-to-y$ t
   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"
   ;; If non nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil
   ;; If non nil then the last auto saved layouts are resume automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil
   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache
   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 5
   ;; If non nil then `ido' replaces `helm' for some commands. For now only
   ;; `find-files' (SPC f f), `find-spacemacs-file' (SPC f e s), and
   ;; `find-contrib-file' (SPC f e c) are replaced. (default nil)
   dotspacemacs-use-ido nil
   ;; If non nil, `helm' will try to minimize the space it uses. (default nil)
   dotspacemacs-helm-resize nil
   ;; if non nil, the helm header is hidden when there is only one source.
   ;; (default nil)
   dotspacemacs-helm-no-header nil
   ;; define the position to display `helm', options are `bottom', `top',
   ;; `left', or `right'. (default 'bottom)
   dotspacemacs-helm-position 'bottom
   ;; If non nil the paste micro-state is enabled. When enabled pressing `p`
   ;; several times cycle between the kill ring content. (default nil)
   dotspacemacs-enable-paste-micro-state nil
   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.4
   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom
   ;; If non nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar nil
   ;; If non nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil
   ;; If non nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil
   ;; If non nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup nil
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90
   ;; If non nil unicode symbols are displayed in the mode line. (default t)
   dotspacemacs-mode-line-unicode-symbols t
   ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters the
   ;; point when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t
   ;; If non nil line numbers are turned on in all `prog-mode' and `text-mode'
   ;; derivatives. If set to `relative', also turns on relative line numbers.
   ;; (default nil)
   dotspacemacs-line-numbers t
   ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil
   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all
   ;; If non nil advises quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server t
   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `ag', `pt', `ack' and `grep'.
   ;; (default '("ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("ag" "pt" "ack" "grep")
   ;; The default package repository used if no explicit repository has been
   ;; specified with an installed package.
   ;; Not used for now. (default nil)
   dotspacemacs-default-package-repository nil
   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed'to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup nil
   ))

(defun dotspacemacs/user-init ()
  "Initialization function for user code.
It is called immediately after `dotspacemacs/init', before layer configuration
executes.
 This function is mostly useful for variables that need to be set
before packages are loaded. If you are unsure, you should try in setting them in
`dotspacemacs/user-config' first."
  ;solve the hanging problem when facing DNS hijack.
  (setq configuration-layer--elpa-archives
        '(("melpa-cn" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")
          ("org-cn"   . "http://mirrors.tuna.tsinghua.edu.cn/elpa/org/")
          ("gnu-cn"   . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")))
  (setq tramp-ssh-controlmaster-options
        "-o ControlMaster=auto -o ControlPath='tramp.%%C' -o ControlPersist=no")
  )

(defun dotspacemacs/user-config ()
  "Configuration function for user code.
This function is called at the very end of Spacemacs initialization after
layers configuration.
This is the place where most of your configurations should be done. Unless it is
explicitly specified that a variable should be set before a package is loaded,
you should place your code here."

  ;; make timestamps unified to English
  (setq system-time-locale "C")

  ;;org-mod configuration;
  (require 'ox-latex)

  (spacemacs//set-monospaced-font "Source Code Pro" "Noto Sans CJK SC Regular" 16 20)

  ;;org-journal
  (setq org-journal-dir "~/org/journal/")
  (setq org-journal-date-format "%Y-%m-%d %a")
  ;; bind evil-forward/backward-args
  (define-key evil-normal-state-map "L" 'evil-forward-arg)
  (define-key evil-normal-state-map "H" 'evil-backward-arg)
  (define-key evil-motion-state-map "L" 'evil-forward-arg)
  (define-key evil-motion-state-map "H" 'evil-backward-arg)

  ;; bind evil-jump-out-args
  (define-key evil-normal-state-map "K" 'evil-jump-out-args)

  (define-key evil-motion-state-map "j" 'evil-next-visual-line)
  (define-key evil-motion-state-map "k" 'evil-previous-visual-line)
  (define-key evil-motion-state-map "F" 'evil-avy-goto-char)
  (with-eval-after-load 'org
    (setq org-directory "~/org/"
          org-default-notes-file "~/org/collections.org"
          org-agenda-files '("~/org/calendar")
          org-todo-keywords '((sequence "TODO" "NEXT" "WAITING" "|" "DONE" "CANCELED"))
          org-agenda-skip-scheduled-if-done nil
          org-agenda-skip-scheduled-if-deadline-is-shown t
          org-src-fontify-natively t
                                        ;org-mode export to latex settings
          org-latex-pdf-process '("latexmk -f -pdflatex='xelatex -shell-escape' -pdf %f")
          org-latex-listings 'minted
          org-latex-minted-options '(("fontsize" "\\scriptsize") ("breaklines" ""))
          org-export-with-smart-quotes t
          org-startup-indented t
          org-plantuml-jar-path "~/plantuml/plantuml.jar"
          org-export-headline-levels 7

          org-capture-templates '(("t" "Todo" entry (file "~/org/calendar/buffer.org")
                                   "* TODO %? %^G \n %i\n ")
                                  ("n" "Note" entry (file "~/org/collections.org")
                                   "* %? \n %i\n")
                                  )

          org-refile-use-outline-path t
          org-outline-path-complete-in-steps t

          org-refile-targets '((nil :maxlevel . 2)
                               ("~/org/calendar/agenda.org" :maxlevel . 2))

          org-archive-location "~/org/calendar/archive.org::datetree/"
          )

    (setcdr (assoc "\\.pdf\\'" org-file-apps) "evince %s")
    (add-to-list 'org-src-lang-modes (quote ("dot" . graphviz-dot)))
    (evil-declare-key 'normal evil-org-mode-map "<" (lambda () (interactive)
                                                      (call-interactively (if (org-at-heading-p) #'org-promote-subtree #'evil-shift-left))))
    (evil-declare-key 'normal evil-org-mode-map ">" (lambda () (interactive)
                                                      (call-interactively (if (org-at-heading-p) #'org-demote-subtree #'evil-shift-right))))
    (add-to-list 'org-latex-classes
                 '("buptsse-lab"
                   "\\documentclass{buptsse-lab}
                   [NO-DEFAULT-PACKAGES]"
                   ("\\section{%s}" . "\\section*{%s}")
                   ("\\subsection{%s}" . "\\subsection*{%s}")
                   ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
                   ("\\paragraph{%s}" . "\\paragraph*{%s}")
                   ("\\subparagraph{%s}" . "\\subparagraph*{%s}")
                   )
                 )
    (org-babel-do-load-languages
     'org-babel-load-languages
      '((python . t)
        (plantuml . t)
        (dot . t)
        )
      )
    (defun my/org-confirm-babel-evaluate (lang body) (not (or (string= lang "dot") (string= lang "plantuml"))))
    (setq org-confirm-babel-evaluate 'my/org-confirm-babel-evaluate)
    (add-to-list 'org-latex-classes
                 '("article"
                   "\\documentclass[12pt]{article}
[NO-DEFAULT-PACKAGES]
\\usepackage[margin=30mm]{geometry}
\\usepackage{amsmath, amssymb, minted}
\\usepackage[hidelinks]{hyperref}
\\usepackage{xeCJK, fontspec}
\\setmainfont{Arno Pro}
\\setsansfont{Proxima Nova}
\\setmonofont{Source Code Pro}
\\setCJKmainfont[BoldFont={方正准雅宋_GBK}]{方正兰亭刊宋_GBK}
\\setCJKsansfont{汉仪旗黑}"
                   ("\\section{%s}" . "\\section*{%s}")
                   ("\\subsection{%s}" . "\\subsection*{%s}")
                   ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
                   ("\\paragraph{%s}" . "\\paragraph*{%s}")
                   ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))
                        )
  ;; LaTeX
  (setq TeX-engine 'xetex
        TeX-PDF-mode t)

  ;;faces config
  (custom-set-variables
   '(org-export-backends (quote (ascii html latex md)))
   '(org-image-actual-width nil)
   '(org-level-color-stars-only nil)
   '(org-pretty-entities t)
   )


  )
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(evil-want-Y-yank-to-eol t)
 '(org-export-backends (quote (ascii html latex md)))
 '(org-image-actual-width nil)
 '(org-level-color-stars-only nil)
 '(org-pretty-entities t)
 '(package-selected-packages
   (quote
    (org-journal sql-indent fasd skewer-mode simple-httpd json-snatcher json-reformat dash-functional tern ashes-theme web-mode tagedit slim-mode scss-mode sass-mode pug-mode less-css-mode helm-css-scss haml-mode emmet-mode company-web web-completion-data faceup youdao-dictionary names chinese-word-at-point fcitx powerline spinner org alert log4e gntp markdown-mode hydra parent-mode fringe-helper git-gutter+ git-gutter pkg-info epl flx iedit evil goto-chg highlight diminish request-deferred request deferred company pos-tip bind-map bind-key pythonic f s avy auto-complete popup package-build plantuml-mode insert-shebang hide-comnt company-auctex auctex-latexmk auctex graphviz-dot-mode imenu-list magit-gh-pulls github-search github-clone github-browse-file gist gh marshal logito pcache ht ranger company-quickhelp macrostep elisp-slime-nav auto-compile packed visual-fill-column pangu-spacing org-cliplink find-by-pinyin-dired chinese-pyim chinese-pyim-basedict avy-zap ace-pinyin pinyinlib ace-jump-mode multiple-cursors dash helm-themes helm-swoop helm-pydoc helm-projectile helm-mode-manager helm-gtags helm-gitignore helm-flx helm-descbinds helm-cscope helm-company helm-c-yasnippet helm-ag flyspell-correct-helm ace-jump-helm-line counsel swiper anaconda-mode anzu smartparens undo-tree ycmd flyspell-correct helm helm-core ivy yasnippet flycheck projectile magit magit-popup git-commit with-editor async js2-mode omnisharp csharp-mode yapfify xterm-color xcscope ws-butler window-numbering which-key wgrep web-beautify volatile-highlights vi-tilde-fringe uuidgen use-package toc-org stickyfunc-enhance srefactor spacemacs-theme spaceline smex smeargle shell-pop restart-emacs rainbow-mode rainbow-identifiers rainbow-delimiters racket-mode quelpa pyvenv pytest pyenv-mode py-isort popwin pip-requirements persp-mode pcre2el paradox orgit org-projectile org-present org-pomodoro org-plus-contrib org-download org-bullets open-junk-file ob-sml neotree mwim multi-term move-text mmm-mode markdown-toc magit-gitflow lorem-ipsum livid-mode live-py-mode linum-relative link-hint json-mode js2-refactor js-doc ivy-hydra info+ indent-guide ido-vertical-mode ibuffer-projectile hy-mode hungry-delete htmlize hl-todo highlight-parentheses highlight-numbers highlight-indentation help-fns+ helm-make google-translate golden-ratio gnuplot gitignore-mode gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link git-gutter-fringe git-gutter-fringe+ gh-md ggtags flyspell-correct-ivy flycheck-ycmd flycheck-pos-tip flx-ido fish-mode fill-column-indicator fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-magit evil-lisp-state evil-indent-plus evil-iedit-state evil-exchange evil-escape evil-ediff evil-args evil-anzu eval-sexp-fu eshell-z eshell-prompt-extras esh-help dumb-jump disaster diff-hl define-word cython-mode counsel-projectile company-ycmd company-tern company-statistics company-shell company-c-headers company-anaconda column-enforce-mode color-identifiers-mode coffee-mode cmake-mode clean-aindent-mode clang-format auto-yasnippet auto-highlight-symbol auto-dictionary aggressive-indent adaptive-wrap ace-window ace-link ac-ispell))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
